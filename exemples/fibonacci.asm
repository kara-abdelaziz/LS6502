;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                                                                                                         ;;
;;       Programmer      : Kara Abdelaziz                                                                                  ;;
;;       Date            : 06/2020                                                                                         ;;
;;       file            : Fibonacci.asm                                                                                   ;;
;;       repository      : https://github.com/kara-abdelaziz                                                               ;;
;;                                                                                                                         ;;
;;       -------------------------------------------------------------------------------------------------------           ;;
;;                                                                                                                         ;;    
;;       Description     : The code source below written in 6502 assembly language implements the fibonacci sequence.      ;;
;;                                                                                                                         ;;                         
;;       Appendix 1      : In addition to the assembly code, A listing of disassembly code is appended below it.           ;;
;;       Appendix 2      : Also a hexadecimal machine code for the function is added to the last part of the file.         ;;     
;;                                                                                                                         ;;
;;       Target          : This code is intended to be executed on LS6502 machine, a Logisim 6502 simulation.              ;;
;;                                                                                                                         ;;
;;       Compiler        : The code was compiled by Nick Morgan online assembler. (https://skilldrick.github.io/easy6502/) ;;
;;                         ,the compilation (assembly) provides the machine code necessary to use on LS6502.               ;;
;;                                                                                                                         ;;
;;       Note 1          : This fibonacci code is simplistic and primitive, not intented to be used in real programs, it   ;;
;;                         was primarily designed to be a proof of concept for the LS6502 machine.                         ;;
;;                                                                                                                         ;;
;;       Note 2          : This code and the LS6502 machine are available on the programmer GitHub.                        ;;
;;                                                                                                                         ;;
;;       Note 3          : To be compatible with LS6502, disassembly code and hexdump file were translated from            ;;
;;                         address $0600 (assembler beginning execution address) to address $8000 (LS6502 beginning        ;;
;;                         execution). Effectively only JMP instructions was concerned.                                    ;;
;;                                                                                                                         ;;
;;       Note 4          : To execute this program on LS6502, you have to load the Hexdump file in the ROM. The file       ;;
;;                         fibonacci.ROM already contains the values of Hexdump file.                                      ;;
;;                                                                                                                         ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


  PLP        ; initalisation proceddure :
  PLP        ; enable interrupts and 
             ; initialise stack to $01FF

main:        ; main program entry
             ; the results are stored in an
			 ; arrow starting from address $0000


  LDA #$05   ; fibonacci for value 5
  TAY        ; Y = i loop counter
  LDA #$01
  STA $00    ; initialization of F(0) = 1
  STA $01    ; initialization of F(1) = 1
  LDX #$00   ; X = j , j is the term index
  DEY

loop:
  LDA $00,X  ; load the first term
  CLC
  ADC $01,X  ; add the second term
  STA $02,X  ; store the result in memory
  INX        ; j++
  DEY        ; i--
  TYA
  BPL loop   ; repeat if i>=0

end:
  JMP end    ; end program

  
;-------------------------------
;Dissassembly code
;-------------------------------
;Address |Hexdump  |Dissassembly
;------------------------------- 
;$8000    28        PLP 
;$8001    28        PLP
;$8002    a9 05     LDA #$05
;$8004    a8        TAY 
;$8005    a9 01     LDA #$01
;$8007    85 00     STA $00
;$8009    85 01     STA $01
;$800b    a2 00     LDX #$00
;$800d    88        DEY 
;$800e    b5 00     LDA $00,X
;$8010    18        CLC 
;$8011    75 01     ADC $01,X
;$8013    95 02     STA $02,X
;$8015    e8        INX 
;$8016    88        DEY 
;$8017    98        TYA 
;$8018    10 f4     BPL $800e
;$801a    4c 1a 80  JMP $801a
 
;-------------------------------
;Hexdump file
;-------------------------------

;8000: 28 28 a9 05 a8 a9 01 85 00 85 01 a2 00 88 b5 00 
;8010: 18 75 01 95 02 e8 88 98 10 f4 4c 1a 80 

