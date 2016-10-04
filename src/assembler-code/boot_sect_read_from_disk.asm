[org 0x7c00]
	mov [BOOT_DRIVE], dl ;BIOS stores our boot drive in DL, so it’s
						; best to remember this for later.
mov bp, 0x8000 ; Here we set our stack safely out of the way, at 0x8000
mov sp, bp ;
mov bx, 0x9000 ; 
mov dh, 5 ; Load 5 sectors to 0x0000(ES):0x9000(BX) from the boot disk.

mov dl, [BOOT_DRIVE] 
call disk_load

mov dx, [0x9000] 
call print_hex
mov dx , [0x9000 + 512]
call print_hex
jmp $

; Print out the first loaded word, which
; we expect to be 0xdada , stored
; at address 0x9000
 ; Also, print the first word from the ; 2nd loaded sector: should be 0xface


	%include "tools/print_str_func.asm"
	%include 'tools/print_hex_func.asm'
	%include 'tools/disk_load.asm'

	BOOT_DRIVE: db 0

	times 510-($-$$) db 0
	dw 0xaa55
	
times 256 dw 0xdada
times 256 dw 0xface