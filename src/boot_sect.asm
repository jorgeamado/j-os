[org 0x7c00]
	mov dx,  [NUM]
	call print_hex
	
	jmp $      

	NUM: db 1

	%include "tools/print_str_func.asm"
	%include 'tools/print_hex_func.asm'

	times 510-($-$$) db 0
	dw 0xaa55

