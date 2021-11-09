.data
  writeFaculty: .asciz "The faculty for %d "
  writeFaculty1: .asciz "is %d\n"


.text
.global main
.extern printf

facultyCalc:
  PUSH {lr}
  MOV r1, r0
  MOV r3, r0
  SUB r1, r1, #1
again:
  CMP r1, #0
  BEQ finish
  MUL r0, r0, r1
  SUB r1, r1, #1
  BAL again
finish:
  MOV r4, r0
  POP {pc}

main:
  PUSH {lr}
  MOV r0, #4
  BL facultyCalc
  MOV r1, r3
  LDR r0, =writeFaculty
  BL printf
  mov r1, r4
  LDR r0, =writeFaculty1
  BL printf
  POP {pc}
.end
