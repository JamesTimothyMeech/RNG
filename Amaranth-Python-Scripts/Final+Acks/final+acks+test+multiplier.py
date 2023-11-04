from amaranth import *
from amaranth.sim import *
from amaranth.back import verilog
from amaranth_soc import wishbone
from random import randint

class PCG32(Elaboratable):
    def __init__(self):
        self.multiplier = Signal(64, reset=0x5851f42d4c957f2d)
        self.increment = Signal(64, reset=0x14057b7ef767814f)
        self.seed = Signal(64, reset=0x123456789abcdef0)
        self.state = Signal(64)
        self.output = Signal(32)

        # Create a Wishbone bus interface
        self.wb_bus = wishbone.Interface(addr_width=32, data_width=32)

    def elaborate(self, platform):
        m = Module()

        state = self.state
        output = self.output
        multiplier = self.multiplier
        increment = self.increment

        # Generate a new random number
        m.d.comb += output.eq(state[0:32] ^ (state[32:64] >> 18))
        m.d.sync += state.eq((state * multiplier + increment) & ((1 << 64) - 1))

        # Connect the random number generator to the Wishbone bus
        with m.If(self.wb_bus.cyc & self.wb_bus.stb):
            m.d.sync += self.wb_bus.ack.eq(1)
            with m.Switch(self.wb_bus.adr):
                with m.Case(0x00000000):
                    m.d.comb += self.wb_bus.dat_r.eq(output)
                with m.Case(0x00000001):
                    m.d.sync += self.seed[32:64].eq(self.wb_bus.dat_w)
                with m.Case(0x00000002):
                    m.d.sync += self.seed[0:32].eq(self.wb_bus.dat_w)
                with m.Case(0x00000003):
                    m.d.sync += self.multiplier[32:64].eq(self.wb_bus.dat_w)
                with m.Case(0x00000004):
                    m.d.sync += self.multiplier[0:32].eq(self.wb_bus.dat_w)
                with m.Case(0x00000005):
                    m.d.sync += self.increment[32:64].eq(self.wb_bus.dat_w)
                with m.Case(0x00000006):
                    m.d.sync += self.increment[0:32].eq(self.wb_bus.dat_w)
        with m.Else():
            m.d.sync += self.wb_bus.ack.eq(0)

        return m

    def proc(self):
        for i in range(50):
            yield Tick()

            # Write to the multiplier signal of the random number generator after 10 clock cycles
            if i == 10:
                yield self.wb_bus.adr.eq(0x00000003)
                yield self.wb_bus.we.eq(1)
                yield self.wb_bus.sel.eq(0xff000000)
                yield self.wb_bus.cyc.eq(1)
                yield self.wb_bus.stb.eq(1)
                yield self.wb_bus.dat_w.eq(randint(0, 2**32-1))
                yield Tick()
                yield self.wb_bus.cyc.eq(0)
                yield self.wb_bus.stb.eq(0)

                yield self.wb_bus.adr.eq(0x00000004)
                yield self.wb_bus.we.eq(1)
                yield self.wb_bus.sel.eq(0x00ff0000)
                yield self.wb_bus.cyc.eq(1)
                yield self.wb_bus.stb.eq(1)
                yield self.wb_bus.dat_w.eq(randint(0, 2**32-1))
                yield Tick()
                yield self.wb_bus.cyc.eq(0)
                yield self.wb_bus.stb.eq(0)

# Test the implementation by simulating it
if __name__ == '__main__':
    dut = PCG32()
    sim = Simulator(dut)
    sim.add_clock(1e-6)
    sim.add_sync_process(dut.proc)
    with sim.write_vcd('pcg32.vcd', 'pcg32.gtkw'):
        sim.run_until(100e-6)

top = PCG32()
print(verilog.convert(top, ports=[top.wb_bus.adr, top.wb_bus.dat_w, top.wb_bus.dat_r, top.wb_bus.sel, top.wb_bus.we, top.wb_bus.cyc, top.wb_bus.stb, top.wb_bus.ack]))
