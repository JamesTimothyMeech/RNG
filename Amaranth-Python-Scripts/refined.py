from amaranth import *
from amaranth.sim import *
from amaranth.back import verilog

class PCG32(Elaboratable):
    def __init__(self):
        self.multiplier = Signal(64, reset=0x5851f42d4c957f2d)
        self.increment = Signal(64, reset=0x14057b7ef767814f)
        self.seed = Signal(64, reset=0x123456789abcdef0)
        self.state = Signal(64)
        self.output = Signal(32)

    def elaborate(self, platform):
        m = Module()

        state = self.state
        output = self.output
        multiplier = self.multiplier
        increment = self.increment

        # Generate a new random number
        m.d.comb += output.eq(state[0:32] ^ (state[32:64] >> 18))
        m.d.sync += state.eq((state * multiplier + increment) & ((1 << 64) - 1))

        return m

    def proc(self):
        for i in range(50):
            yield Tick()

# Test the implementation by simulating it
if __name__ == '__main__':
    dut = PCG32()
    sim = Simulator(dut)
    sim.add_clock(1e-6)
    sim.add_sync_process(dut.proc)
    with sim.write_vcd('pcg32.vcd', 'pcg32.gtkw'):
        sim.run_until(100e-6)

# Generate the hardware description language implementation
print(verilog.convert(PCG32(), ports=[PCG32().multiplier, PCG32().increment, PCG32().seed, PCG32().output]))
