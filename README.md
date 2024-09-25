## What is LS 6502 ?

The LS 6502 project is a realization of the very famous [MOS 6502](https://en.wikipedia.org/wiki/MOS_Technology_6502) processor on the [Logisim](http://www.cburch.com/logisim/) logic simulator. 
This processor, being famous, marked the era of computers and game consoles in the 80s. 
As an example, the [Apple II](https://en.wikipedia.org/wiki/Apple_II), [Commodore 64](https://en.wikipedia.org/wiki/Commodore_64), and [BBC Micro computers](https://en.wikipedia.org/wiki/BBC_Micro) were all based on 6502 processors. 
Many very popular game consoles also used this processor, such as the [Atari 2600](https://en.wikipedia.org/wiki/Atari_2600), [Nintendo Entertainment System](https://en.wikipedia.org/wiki/Nintendo_Entertainment_System) (NES), and [Atari Lynx](https://en.wikipedia.org/wiki/Atari_Lynx).

## How the LS 6502 whas implemented ?

The implementation was done on the [Logisim](http://www.cburch.com/logisim/) logic simulator (the stand-alone processor image below).
A simulator normally intended for academic use for small projects, and not complete processors. 
Despite this, the simulator normally manages to run this processor, with a fairly high number of elementary components exceeding 2500.
The implementation was a from scratch build, meaning that the pre-built components of the Logisim library were avoided as much as possible,
and that most of the parts were built at low level with only logic gates and flip-flops, except perhaps for memories like RAM and ROM.

![stand-alone LS6502 snapshot](images/LS6502.jpg)

## Testing the LS 6502

The internal implementation, or what is called the microarchitecture, does not exactly follow that of the original MOS 6502 processor.
The LS 6502 was implemented differently for the sake of simplicity and logic gate reduction.
Although the microarchitecture is different and smaller, it manages to perfectly simulate the [instruction set](https://en.wikipedia.org/wiki/Instruction_set_architecture) of the MOS 6502 processor.
To ensure that the simulated processor could follow exactly the same instruction execution behavior of a 6502 processor,
the [Klaus Dormann 6502 Benchmark](https://github.com/Klaus2m5/6502_65C02_functional_tests) test was run on the processor, which also allowed several bugs to be found and corrected
(the image below represents the LS 6502 used in a basic architecture for the [benchmark](https://en.wikipedia.org/wiki/Benchmark_(computing)) exercise).
On the other hand, the hardware reduction of the processor caused the timing specifications to be no longer respected.
So the LS 6502 processor does not take the same execution time (in clock cycles) as a real MOS 6502 processor.
Usually the simulated processor requires more time.

![basic LS6502 architecture snapshot](images/Elementary_LS6502_architecture.jpg)

## Creating a simple 6502 computer from the 80s era

To test the processor in a real environment, a simplistic architecture similar to that of the computers of the 80s was rebuilt. Using,
as it was known at the time. [BASIC](https://en.wikipedia.org/wiki/BASIC) as operating system and programming language.
[Enhanced BASIC](http://retro.hansotten.nl/6502-sbc/lee-davison-web-site/enhanced-6502-basic/) was integrated into the ROM of the architecture,
which allowed to use as a machine similar to the computers of the 80s on the Logisim simulator.
Although the response time was very very slow (the image below is a capture of this BASIC-based architecture).

![LS6502 architecture with BASIC snapshot](images/LS6502_with_BASIC.jpg)

## Files and directories description

1. LS6502 cpu.circ : Is the stand-alone LS 6502 processor that you can embed in other architectures.
2. Simplistic 6502 architecture.circ : A simplistic architecture with only a processor, a RAM, and a ROM. Mainly used to execute Klaus Dormann 6502 Benchmar software.
3. Micro-Program Table (Micro-instructions).pdf : The table of micro-instructions used to micro-programming the processor.
4. Adressing mode formats.txt : A list of the binary OpCode format of the entire set of instructions.
5. read.me : This read me.
6. EnBasic Logisim 6502 Computer : The directory containing the architecture installed with the language BASIC.
   1. EhBASIC Logisim 6502 Computer.circ : A relatively advanced architecture with a screen and a keyboard, similar to 80s era computers with BASIC used as operating system and programming language.
   2. EnBASIC Binary Code.65b : The binary code of the Enhanced BASIC firmware image used as BASIC language for the architecture.
   3. Enhanced_BASIC.ROM : Is the mapping of the Enhanced BASIC Binary Code firmware image into the architecture 32KB ROM
   4. 6502_EhBASIC_V2.22-master.zip : The main 6502 code of the Enhanced BASIC frimware.
   5. Michal Kowalski 6502 simulator.zip : A 6502 simulator used as to simulate the 6502 code.
7. ROMs : This directory is used to store the different ROM images of internal processor sequencer/control unit (CU). Many functional ROMs were used equivalent to complex combinational circuits.
8. references : A directory containing the references and source materials was mainly used to understand the proper working of the 6502. All the resources are saved here.
9. exemples : Some well documented examples used to test the LS6502 are stored here. The simplest examples are the Factorial and the Fabonacci programs. Plus the Klaus Dormann Benchmark directory.
10. exemples/Klaus Dormann Benchmark : A directory containing the code of the Klaus Dormann Benchmark, plus an 6502 assembler.

## Links
- My personal website [el-kalam.com](https://www.el-kalam.com)
