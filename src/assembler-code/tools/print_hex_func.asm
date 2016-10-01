;print hex from dx
print_hex:
	pusha				;save all registers
	mov cx, 4			;cx - counter to get 4 bytes 
	mov bx, HEX_OUT		;put pointer to template "0x0000" to bx
	add bx, 5			;set bx pointer to the last char of template "0x000 >0"

	charloop:
	mov ax, dx			;move value from dx to ax
	and ax, 0xf			;apply mask 0x000f to get last byte from value	

	cmp ax, 0xa			;MAGIC if this is letter we need to add 7
	jl to_string
	add byte al, 7

	to_string:
	add al, [ZERO_SYMBOL]

	mov byte [bx], al 	;change template string add value to char '0'(zero-symbol) + 2 = '2' 

	shr dx, 4			;shift right dx, to use last byte for printing
	dec cx				;dec cicle counter
	dec bx				;dec pointer to the template string characrter
	cmp cx, 0			;check if we have to exit printing cicle
	je end_hex			;if end exit from print hex loop
	jmp charloop		;else - continue print hex loop

	end_hex:
	mov bx, HEX_OUT		;put updated template to bx
	call print_string	;call print string from bx

	mov bx, HEX_OUT		;put pointer to template "0x0000" to bx
	add bx, 5			;set bx pointer to the last char of template "0x000 >0"

	popa				;restore registers
	ret

HEX_OUT: db '0x0000',0 	;create template sctring "0x0000" and add to the 
						;zero byte after the string
ZERO_SYMBOL: db '0'		; zero-symbol - for string creation				
