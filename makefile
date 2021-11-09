main:	asm.o
	ld -o asm asm.o
asm.o:	asm.s
	as -o asm.o asm.s
clean:
	rm *.o
	rm asm	
	as -o asm.o asm.s	
	ld -o asm asm.o
