;print string from bx while 0 occures
  print_string:
  	pusha			;save all registers
	mov ah, 0x0e	;put print function to ah
	print_loop:
	mov al, [bx]	;put to al first character
	cmp al, 0		;check if it eol
	je end			;finish printing
	int 0x10		;call BIOS interruption for tele-type
	inc bx			;increment char address
	jmp print_loop	;back to print loop
	end:			
	popa			;restore all regis
	ret