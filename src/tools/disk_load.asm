; load DH sectors to ES:BX from drive DL
disk_load:
	push dx			; store dx on stack to check how
					; many sectors read (dh == al)

	mov ah, 0x02	;BIOS read segment function
	mov al, dh 		; dh - sectors to read
	mov ch, 0x00	; cilinder = 0
	mov dh, 0x00	; head = 0
	mov cl, 0x02	; read from secon sector 
					; after boot sector

	int 0x13		; BIOS interrupt

	jc carry_flag_set_error

	pop dx			; restore dx from stack
	cmp dh, al		;al != dh -> didn't read dh sectors
	jne sector_read_error
	ret

	carry_flag_set_error:
		mov bx, CARRY_FLAG_ERROR 
		call print_string
		jmp $


	sector_read_error:
		mov bx, SECTOR_READ_ERROR 
		call print_string
		jmp $

; Variables
CARRY_FLAG_ERROR db "Disk read error! CARRY_FLAG_ERROR", 0
SECTOR_READ_ERROR db "Disk read error! SECTOR_READ_ERROR", 0
		
