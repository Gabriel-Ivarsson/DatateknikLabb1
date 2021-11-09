.data
test:
.word 1
.word 3
.word 5
.word 7
.word 9
.word 8
.word 6
.word 4
.word 2
.word 0
textA: .asciz "Lab1, Assignment 2\n "
textB: .asciz "The max is %d \n"
textC: .asciz "Done \n"
.text
.global main
.extern printf

/**
Function finding maximum value in a zero terminated integer array
**/
findMax:
PUSH {lr}
/* Add code to find maximum value element here ! /
/ Any registers altered by the function beside r0 - r3 must be preserved */
LDR r3, [r0]
again:
  LDR r2, [r0]
  CMP r2, #0
  BEQ finish
  CMP r2, r3
  ADD r0, r0, #4
  BGT bigger
  BAL again
bigger:
  MOV r3, r2
  BL again
finish:
  MOV r0, r3
  POP {pc}

/**
main function
**/
main:
  PUSH {lr}
  LDR r0, =textA
  BL printf
  LDR r0, =test
  BL findMax
  MOV r1, r0
  LDR r0, =textB
  BL printf
  LDR r0, =textC
  BL printf
  POP {pc}
.end

