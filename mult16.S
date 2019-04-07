		;		ARM Programming Assignment #1: 16 bit multiplier
		;
		;		Write a 16-bit multiplier, meaning numbers that have their high 16 bits set to 0.
		;		Use the standard shift-and-add operation.
		;		Note that we cannot address half-words (16) here. We can only address words (32) and bytes (8 B).
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
                ;
		
		;		Your code here
main
		adr		R0, numbers
		ldr		R1, [R0]			; multiplicand
		ldr		R2, [R0, #4]		; multiplier
		mov		R3, #0			; partial sum
		mov		R4, #16			; counter
		adr		R6, result		; result
		b		docarry
		
docarry
		lsrs		R2, R2, #1
		bcs		doadd
		b		doshift
		
doadd
		add		R3, R3, R1
		b		doshift
		
doshift
		lsl		R1, R1, #1
		subs		R4, R4, #1
		cmp		R4, #0
		bne		docarry
		;lsr		R3, R3, #1
		;ror		R3, R3, #1
		str		R3, [R6]
		end
		
		;51857,	62787 = 3255945459
		;numbers	DCD		0b1101001, 0b1011010		; this works
numbers	DCD		0b1100101010010001, 0b1111010101000011	; this doesn't work ???
result	FILL		4
carry	FILL		4
