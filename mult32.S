		;		ARM Programming Assignment #1: 32 bit multiplier
		;
		;		Write a 32-bit multiplier.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
main
		;mov		R0, #3221225475	;11000000000000000000000000000011
		;mov		R1, #3221225475
		;adr		R2, result
		;str		R1, [R2]
		
		adr		R0, numbers
		ldr		R1, [R0]			; multiplicand
		ldr		R2, [R0, #4]		; multiplier
		mov		R3, #0			; partial sum right
		mov		R4, #0			; partial sum left
		mov		R5, #32			; counter
		b		docarry
		
docarry
		lsrs		R2, R2, #1
		bcs		doadd
		b		doshift
		
doadd
		adds		R3, R3, R1
		bvs		dosumleft
		b		doshift
		
dosumleft
		add		R4, R4, #1
		;ror		R4, R4, #1
		b		doshift
		
doshift
		lsl		R1, R1, #1
		subs		R5, R5, #1
		cmp		R5, #0
		bne		docarry
		;lsr		R3, R3, #1
		;ror		R3, R3, #1
		;str		R3, [R6]
		b		movetomem
		
movetomem
		;adr		R0, result
		;lsls	R3, R3, #1
		
		;str		R0,
		;str
		adr		R0, result
		stmfa	R0, {R3, R4}
		end
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
result	FILL		8
carry	FILL		4
