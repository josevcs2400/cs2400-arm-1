			;		ARM Programming Assignment #1: Capitalizer
			;
			;		Write a program that goes through the characters in chars,
			;		and Capitalizes every lower-case letter that it finds..
			;		Write the number of capitalizations the program performed
			;		In the caps "fill" memory provided.
			;		all caps ascii numbers 65-90, 32 diff between caps and lowercase
			
			;		Your code here
			adr		R0, chars
			mov		R1, #0		; current index
			mov		R2, #11		; counter
			mov		R3, #0		; tally
			mov		R4, #96		; pivot
			b		loop
			
loop
			ldr		R5, [R0, R1]
			cmp		R4, R5
			bmi		docaps
			add		R1, R1, #4	; next index
			sub		R2, R2, #1	; decrement counter
			cmp		R2, #0
			bne		loop
			b		endprogram
			
docaps
			sub		R5, R5, #32
			str		R5, [R0, R1]
			add		R1, R1, #4	; next index
			sub		R2, R2, #1	; decrement counter
			add		R3, R3, #1	; increment tally
			cmp		R2, #0
			bne		loop
			b		endprogram
			
endprogram
			adr		R0, caps
			str		R3, [R0]
			end
			
			;pre		97	66	53	113	48	79	49	115	98	105	71
chars		DCD		'a', 'B', '5', 'q', '0', 'O', '1', 's', 'b', 'i', 'G'
			;post	65	66	53	81	48	79	49	83	66	73	71
caps			FILL		4			; value is in memory 0x12C
