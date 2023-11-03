from amaranth import *
from amaranth.sim import *
from amaranth.back import verilog

class PCG32(Elaboratable):
    def __init__(self, seed):
        self.state = Signal(64, reset=seed)
        self.output = Signal(32)

    def elaborate(self, platform):
        m = Module()

        state = self.state
        output = self.output

        # Constants for the PCG algorithm
        multiplier = 0x5851f42d4c957f2d
        increment = 0x14057b7ef767814f

        # Generate a new random number
        m.d.comb += output.eq(state[0:32] ^ (state[32:64] >> 18))
        m.d.sync += state.eq((state * multiplier + increment) & ((1 << 64) - 1))

        return m

    def proc(self):
        with open('output.txt', 'w') as f:
            while True:
                yield Tick()
                f.write(f'{(yield self.output)}\n')

# Test the implementation by simulating it
if __name__ == '__main__':
    dut = PCG32(0x123456789abcdef0)
    sim = Simulator(dut)
    sim.add_clock(1e-6)
    sim.add_sync_process(dut.proc)
    sim.run()
