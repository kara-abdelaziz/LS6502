;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                                                         ;;
;;       Programmer      : Kara Abdelaziz                                                                                  ;;
;;       Date            : 06/2020                                                                                         ;;
;;       file            : Factorial.asm                                                                                   ;;
;;       repository      : https://github.com/kara-abdelaziz                                                               ;;
;;                                                                                                                         ;;
;;       -------------------------------------------------------------------------------------------------------           ;;
;;                                                                                                                         ;;    
;;       Description     : The code source below written in 6502 assembly language implements the factorial function.      ;;
;;                                                                                                                         ;;                         
;;       Appendix 1      : In addition to the assembly code, A listing of disassembly code is appended below it.           ;;
;;       Appendix 2      : Also a hexadecimal machine code for the function is added to the last part of the file.         ;;     
;;                                                                                                                         ;;
;;       Target          : This code is intended to be executed on LS6502 machine, a Logisim 6502 simulation.              ;;
;;                                                                                                                         ;;
;;       Compiler        : The code was compiled by Nick Morgan online assembler. (https://skilldrick.github.io/easy6502/) ;;
;;                         ,the compilation (assembly) provides the machine code necessary to use on LS6502.               ;;
;;                                                                                                                         ;;
;;       Note 1          : This factorial code is simplistic and primitive, not intented to be used in real programs, it   ;;
;;                         was primarily designed to be a proof of concept for the LS6502 machine.                         ;;
;;                                                                                                                         ;;
;;       Note 2          : This code and the LS6502 machine are available on the programmer GitHub.                        ;;
;;                                                                                                                         ;;
;;       Note 3          : To be compatible with LS6502, disassembly code and hexdump file were translated from            ;;
;;                         address $0600 (assembler begin execution address) to address $8000 (LS6502 begin execution).    ;;
;;                         Effectively only JMP and JSR instructions were concerned.                                       ;;
;;                                                                                                                         ;;
;;       Note 4          : To execute this program on LS6502, you have to load the Hexdump file in the ROM. The file       ;;            
;;                         fazctorial.ROM already contains the values of Hexdump file.                                     ;;
;;                                                                                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  PLP            ; initalisation proceddure :
  PLP            ; enable interrupts and 
                 ; initialise stack to $01FF

main:            ; main program entry
		   
  LDA #$5        ; value to be factored (in this case 5), you can change it for other cases
  PHA
  JSR  factorial ; factorial call
  PLA            ; the result or the factorial(5) is in the Accumulator
end:
  JMP end        ; end program
  
		   
factorial:       ; simple factorial routine (res = i!)

  TSX            ; X is the stack pointer
  INX            ; that's allow us to access
  INX            ; the argument i
  INX
  LDY $0100,X    ; Y = i
  LDA #$1
  STA $0100,X    ; res = 1 (initialization)
  
fact_loop:
  
  LDA $0100,X

  PHA
  TYA
  PHA
  JSR  mul
  PLA
  PLA            ; fact * i
  
  STA $0100,X    ; res = fact * i
  DEY            ; j--
  TYA            
  SEC
  SBC  #$2
  BPL  fact_loop ; repeat if j>=1

  RTS            ; return from factorial    

mul:             ; multiplication routine (res = i * j)

define tmp   $00 ;  temporary variable in zero page RAM

  TXA
  PHA
  TYA
  PHA            ; save X and Y
 
  TSX            ; X is the stack pointer
  INX            ; that's allow us to access
  INX            ; arguments i and j
  INX
  INX
  INX
  LDY $0100,X    ; Y = j
  INX
  LDA $0100,X    ; A = i
  STA tmp        ; tmp = i
  LDA #$0
  STA $0100,X    ; res = 0 (initialization)
  DEY

mul_loop:
  
  LDA $0100,X    ; A = res
  CLC
  ADC tmp
  STA $0100,X    ; res += tmp
  DEY
  TYA            ; j--

  BPL  mul_loop  ; repeat if j>=0

  PLA
  TAY
  PLA
  TAX            ; restore X and Y

  RTS            ; return from mul

  
;-------------------------------
;Dissassembly code
;-------------------------------
;Address |Hexdump  |Dissassembly
;-------------------------------
;$8000    28        PLP 
;$8001    28        PLP 
;$8002    a9 05     LDA #$05
;$8004    48        PHA 
;$8005    20 0c 80  JSR $800c
;$8008    68        PLA 
;$8009    4c 09 80  JMP $8009
;$800c    ba        TSX 
;$800d    e8        INX 
;$800e    e8        INX 
;$800f    e8        INX 
;$8010    bc 00 01  LDY $0100,X
;$8013    a9 01     LDA #$01
;$8015    9d 00 01  STA $0100,X
;$8018    bd 00 01  LDA $0100,X
;$801b    48        PHA 
;$801c    98        TYA 
;$801d    48        PHA 
;$801e    20 2e 80  JSR $802e
;$8021    68        PLA 
;$8022    68        PLA 
;$8023    9d 00 01  STA $0100,X
;$8026    88        DEY 
;$8027    98        TYA 
;$8028    38        SEC 
;$8029    e9 02     SBC #$02
;$802b    10 eb     BPL $8018
;$802d    60        RTS 
;$802e    8a        TXA 
;$802f    48        PHA 
;$8030    98        TYA 
;$8031    48        PHA 
;$8032    ba        TSX 
;$8033    e8        INX 
;$8034    e8        INX 
;$8035    e8        INX 
;$8036    e8        INX 
;$8037    e8        INX 
;$8038    bc 00 01  LDY $0100,X
;$803b    e8        INX 
;$803c    bd 00 01  LDA $0100,X
;$803f    85 00     STA $00
;$8041    a9 00     LDA #$00
;$8043    9d 00 01  STA $0100,X
;$8046    88        DEY 
;$8047    bd 00 01  LDA $0100,X
;$804a    18        CLC 
;$804b    65 00     ADC $00
;$804d    9d 00 01  STA $0100,X
;$8050    88        DEY 
;$8051    98        TYA 
;$8052    10 f3     BPL $8047
;$8054    68        PLA 
;$8055    a8        TAY 
;$8056    68        PLA 
;$8057    aa        TAX 
;$8058    60        RTS 
 
;-------------------------------
;Hexdump file
;-------------------------------

;8000: 28 28 a9 05 48 20 0c 80 68 4c 09 80 ba e8 e8 e8 
;8010: bc 00 01 a9 01 9d 00 01 bd 00 01 48 98 48 20 2e 
;8020: 80 68 68 9d 00 01 88 98 38 e9 02 10 eb 60 8a 48 
;8030: 98 48 ba e8 e8 e8 e8 e8 bc 00 01 e8 bd 00 01 85 
;8040: 00 a9 00 9d 00 01 88 bd 00 01 18 65 00 9d 00 01 
;8050: 88 98 10 f3 68 a8 68 aa 60 
  
  