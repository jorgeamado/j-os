  print_string:
  	pusha
	mov ah, 0x0e
	print_loop:
	mov al, [bx]
	cmp al, 0
	je end
	int 0x10
	inc bx
	jmp print_loop
	end:
	popa
	ret