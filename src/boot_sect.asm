;;[org 0x7c00]

	mov bx, 0x7c0 	; set data segment to 0x7c0 to tell CPU
	mov ds, bx		; use addresses ds*16 == 0x7c00 + [addres]
					; it will make same thing like [org 0x7c00]

	mov dx,  [NUM]
	call print_hex

	jmp $

	NUM: dw 0x1234 ;NUM as a pointer to word

	%include "tools/print_str_func.asm"
	%include 'tools/print_hex_func.asm'
	
	times 510-($-$$) db 0
	dw 0xaa55
	