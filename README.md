# RNG Project

## Main Idea and High-Level Project Overview

This project is based on the idea that large language models are good at generating code in popular high-level languages
such as Python. Large language models are comparatively bad at generating code in languages that describe hardware such 
as Verilog. Therefore this project leverages Amaranth, a Python hardware description language that can generate Verilog
to quickly and efficiently generate a hardware pseudorandom number generator design, simulate the design, run the simulated output of the design through the Dieharder test suite, and finally produce the verilog for the design to connect to the Caravel wishbone and hardend. The image below shows a human drawn diagram of the random number generator design generated by Microsoft Bing Chat using the Amaranth hardware description language. We used Microsoft Bing Chat for this project because we had free access to the enterprise version and it can search the internet for (hopefully) up-to-date information about the open-source projects we are leveraging to produce our design in this project. It is unlikely that I would have been able to complete this project on my own, even using Amaranth as had to learn how to use it, partly from Microsoft Bing Chat during the project. We committed the original unedited conversations with Microsoft Bing Chat which we recorded using the Bing Chat History plugin for the Google Chrome browser. We then edited the files to remove formatting errors such as all code blocks being printed twice. We changed the names of the files generated by the Amranth scripts to make the documentation of the project easier to follow. We will share a write-up that provides a more in-depth analysis of the project on arxiv soon. to the enterprise version and it can search the internet for (hopefully) up-to-date information about the open-source projects we are leveraging to produce our design in this project. It is unlikely that I would have been able to complete this project on my own, even using Amaranth as had to learn how to use it, partly from Microsoft Bing Chat during the project. We committed the original unedited conversations with Microsoft Bing Chat which we recorded using the Bing Chat History plugin for the Google Chrome browser. We then edited the files to remove formatting errors such as all code blocks being printed twice. We changed the names of the files generated by the Amranth scripts to make the documentation of the project easier to follow. A write-up that provides a more in-depth analysis of the project is avaliable here: https://arxiv.org/abs/2311.03489. We will extend the write-up with more results and analysis as they become avaliable. 
![Circuit](Diagrams/RNGCircuit.png)

## Initial Design Generation and Simulation

Initially, we explored the feasibility of the project by having the conversation recorded in the Initial_Design_Generation_and_Simulation.md file in the Chat-Logs directory. Microsoft Bing Chat was able to generate a
Python script containing successfully simulated and produced verilog for a random number generator design. 
The .vcd files and screenshots of the simulation results can be found in the Simulations directory. 
The generated Verilog can be found in the Generated-Verilog directory. 

## Design Refinement and Simulation

Important signals such as seed, state, multiplier, and increment did not appear in the simulation generated in the conversation in the Initial_Design_Generation_and_Simulation.md file so we had a second conversation which can be found in 
the Refine_Initial_Design_and_Simulation.md file. The purpose of this conversation was to make these signals appear in both the simulated results and the generated Verilog module. The .vcd files and screenshots of the simulation results can be found in the Simulations directory. The generated Verilog can be found in the Generated-Verilog directory.

## Random Number Generator Testing Using The Dieharder Test Suite

We had a conversation in the Random_Number_Generator_Dieharder_Simulation.md file to use Amaranth to create a simulation of the random number generator which would print the random numbers produced by the generator to a .txt file which we could use as input to the Dieharder test suite to verify the quality of the random number generator. Microsoft Bing Chat was able to successfully produce a Python script that created a text file containing the output of the random number generator. We had the script not write the simulation results to a .vcd file to increase the simulation speed, even with this improvement the Dieharder test suite takes multiple days to run over the simulated random number generator output. Testing a file of random numbers is undesirable as the files have to be very large ~ 250 GB so as not to be re-wound by the Dieharder test suite. For this reason, we wanted to pipe the output of the random number generator directly into the Dieharder test suite by running the terminal command python3 test-edited.py | dieharder -a -g 200. For this reason, we manually edited the Python script generated by Microsoft Bing Chat to write the line sys.stdout.buffer.write(struct.pack('>I', int(integer))) in place of where the Microsoft Bing Chat generated script wrote to the text file and import sys and struct. A sample of the text file generated (test.txt) and the output of the Dieharder tests can be found in the Simulations directory. As of now, the tests are not completed but we saved the current partial results in the test-results.txt file in the simulation directory. Two tests have failed already but as we will discuss in the arxiv writeup, even good random number generators can fail some tests. 

## Testing Random Number Generator Design on Icebreaker FPGA

We attempted to have Microsoft Bing Chat generate a Python script to deploy the random number generator design to an Icebreaker FPGA but it was not able to do so. Instead, we hand-edited the refined.py file to produce the fpga.py file which we used to test the design on the Icebreaker FPGA. We verified the design was functional by slowing the design down using a counter and connecting the Icebreaker LEDs to six of the random number generator output signals. We also measured the signals with a logic analyzer at a higher clock speed without slowing the design down with a counter. We attempted to break out more of the output signals to the Icebreaker PMOD connectors but we were unable to get this working. 

## Creating and Simulating Wishbone Interface

We had a conversation in the Create_and_Simulate_Wishbone.md file to add a wishbone interface to the random number generator to allow it to connect to the wishbone bus in Caravel. We include the Verilog generated when testing the connection of the output of the signal of the random number generator to the Wishbone bus. We assume that the subsequent Python files wishbone-test-seed.py, wishbone-test-multiplier.py, and wishbone-test-increment.py will all produce the same Verilog as we only asked Microsoft Bing Chat to change the simulation, not the design. The Verilog file does not include the correct ports to connect to the wishbone bust but we will solve that in the next section. We include .vcd files and screenshots for each of the four wishbone-test-*.py files in the Simulation-Results directory.  

## Creating The Final Design With Correct Ports

We had a conversation in the Final_Verilog_Design_Generation.md file to create the final.py Python script which we used to generate a Verilog module with the correct ports to connect to the Caravel wishbone bus. We then changed the name of the Verilog module to RNG and manually integrated it into the Caravel user_proj_example and hardened the design as described in the Efabless tutorial video. We edited the macro.cfg file to mprj 100 200 N to prevent the make user_project_wrapper command from failing. 

## Final Design With Wisbone Acks and Safety Settings Changes

To meet the original deadline of the project we hurriedly deleted the ack port of the Wishbone interface because our Amaranth design did not have any logic to drive it and this caused errors when running Openlane. After the competition deadline was extended we had one last conversation with Microsoft Bing Chat to add acks to the wishbone bus. The conversation can be found in the Final_Verilog_Design_Generation_With_Acks_and_Safety_Settings.md file in the Chat-Logs folder. Microsoft Bing Chat was able to add acks to the Wishbone bus but it was only able to do this after being reminded that it had generated Amranth in the past. We attempted to get it to generate simulations to test the final design but it refused to do so even after being reminded that it had generated Amaranth in the past. We believe this is because the safety settings of Microsoft Bing Chat have been changed to make it more hesitant to generate code for the user.
In the absence of new test simulations, we used the old proc functions and simulation code that Microsoft Bing Chat generated to test the first version of the Wishbone bus to test the new version with acks included. The results of these tests can be found in the Simulation-Results/Final+Acks directory. The Python scripts used to generate these results can be found in the Amaranth-Python-Scripts/Final+Acks directory. The image below shows a diagram of how we connected the random number generator to the Caravel wishbone using an Amaranth generated wishbone interface to program and sample from the random number generator.

![Project](Diagrams/RNGProject.png)

## Future Work and Project Direction

In future work, we want to implement the functionality to re-seed the random number generator using a true random number generator such as https://betrusted.io/avalanche-noise.html either inside or outside the ASIC. This would enable the best of both worlds, the high speed of a pseudorandom number generator and the security of a truly random number generator. The rate of re-seeding will be a tradeoff between security and random number generation speed. We may also need to remove one or both of the multiplier and increment values from the Wishbone bus for security purposes.

## Acknowledgments and Thanks

Thanks to Joseph Dean (jpdean) for suggesting that I use Microsoft Bing chat when ChatGPT had trouble generating Amaranth code due to the training data cut-off date. Thanks to Emilio Baungarten and Anton Maurovic (algofoogle) for helping me harden the design when I was rushing to complete my submission before the deadline in the early hours of the morning.
 
 
