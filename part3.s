.data
  writeFaculty: .asciz "The faculty for %d "
  writeFaculty1: .asciz "is %d\n"


.text
.global main
.extern printf

facultyCalc:
  PUSH {lr}
  MOV r0, r5
  MOV r1, r0
  MOV r3, r0
  SUB r1, r1, #1
recursive:
  CMP r1, #0
  BEQ base1
  MUL r0, r0, r1
  SUB r1, r1, #1
  BAL recursive
base1:
  MOV r4, r0
  POP {pc}

main:
  PUSH {lr}
  MOV r5, #0
loop:
  ADD r5, r5 ,#1
  BL facultyCalc
  MOV r1, r3
  LDR r0, =writeFaculty
  BL printf
  mov r1, r4
  LDR r0, =writeFaculty1
  BL printf
  CMP r5, #10
  BLT loop
  POP {pc}
.end
