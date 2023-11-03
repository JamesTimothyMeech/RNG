from amaranth import *
from amaranth.build import *
from amaranth.sim import *
from amaranth.lib.io import Pin
from amaranth_boards.icebreaker import ICEBreakerPlatform

pmod0 = [
    Resource("pmod0", 0, Pins("1 2 3 4 7 8 9 10", dir="oe", conn=("pmod", 0)),
             Attrs(IO_STANDARD="SB_LVCMOS")),
]

pmod1 = [
    Resource("pmod1", 0, Pins("1 2 3 4 7 8 9 10", dir="oe", conn=("pmod", 1)),
             Attrs(IO_STANDARD="SB_LVCMOS")),
]

pmod2 = [
    Resource("pmod2", 0, Pins("1 2 3 4 7 8 9 10", dir="oe", conn=("pmod", 2)),
             Attrs(IO_STANDARD="SB_LVCMOS")),
]

class PCG32(Elaboratable):
    def __init__(self, seed, maxperiod):
        self.multiplier = Signal(64, reset=0x5851f42d4c957f2d)
        self.increment = Signal(64, reset=0x14057b7ef767814f)
        self.state = Signal(64, reset = seed)
        self.output = Signal(32)
        self.pmod0 = pmod0
        self.pmod1 = pmod1
        self.pmod2 = pmod2
        self.maxperiod = maxperiod
        

    def elaborate(self, platform):
       
        m = Module()
        led_r = platform.request("led_r")
        led_g_0 = platform.request("led_g", 0)
        led_g_1 = platform.request("led_g", 1)
        led_g_2 = platform.request("led_g", 4)
        led_g_3 = platform.request("led_g", 2)
        led_g_4 = platform.request("led_g", 3)
        #pmod0 = platform.request("pmod0")
        #pmod1 = platform.request("pmod1")
        #pmod2 = platform.request("pmod2")
        state = self.state
        output = self.output
        multiplier = self.multiplier
        increment = self.increment

        # Generate a new random number
        m.d.comb += output.eq(state[0:32] ^ (state[32:64] >> 18))  
        m.d.sync += state.eq((state * multiplier + increment) & ((1 << 64) - 1))
        
        counter = Signal(range(self.maxperiod + 1))

        with m.If(counter == 0):
            m.d.sync += [
                led_r.o.eq(self.output[0]),
                led_g_0.o.eq(self.output[1]),
                led_g_1.o.eq(self.output[2]),
                led_g_2.o.eq(self.output[3]),
                led_g_3.o.eq(self.output[4]),
                led_g_4.o.eq(self.output[5]),
                #pmod0.o.eq(self.output[0:7]),
                #pmod1.o.eq(self.output[8:15]),
                #pmod2.o.eq(self.output[16:23]),
                counter.eq(self.maxperiod)
            ]
        with m.Else():
            m.d.sync += counter.eq(counter - 1)

        return m
        
    def proc(self):
            while True:
                yield Tick()
     

# Instantiate the design and build it for the Icebreaker FPGA
platform = ICEBreakerPlatform()
#platform.add_resources(pmod0)

#platform.add_resources(pmod1)

#platform.add_resources(pmod2)
platform.add_resources(platform.break_off_pmod)
design = PCG32(0x123456789abcdef0, 10000000)
platform.build(design, do_program=True)

#sim = Simulator(design)
#sim.add_clock(1e-6)
#sim.add_sync_process(design.proc)
#with sim.write_vcd('pcg32.vcd', 'pcg32.gtkw'):
    #sim.run_until(100e-6) 
