[org 0x7c00]

; mov bx, HELLO_MSG
; call print_string
; mov bx, GOODBYE_MSG
; call print_string

  ; mov dx, 0x1fb7    ; Set the value we want to print to dx
	mov bx, NUM
	; add byte [bx], dl
 	call print_hex

	int 0x10




   ; call print_hex    ; Print the hex value
  jmp $      

NUM: db '0',0



; ; Prints the value of DX as hex.
; print_hex:
;   pusha             ; save the register values to the stack for later

;   mov cx,4          ; Start the counter: we want to print 4 characters
;                     ; 4 bits per char, so we're printing a total of 16 bits

; char_loop:
;   dec cx            ; Decrement the counter

;   mov ax,dx         ; copy bx into ax so we can mask it for the last chars
;   shr dx,4          ; shift bx 4 bits to the right
;   and ax,0xf        ; mask ah to get the last 4 bits

;   mov bx, HEX_OUT   ; set bx to the memory address of our string
;   add bx, 2         ; skip the '0x'
;   add bx, cx        ; add the current counter to the address

;   ; cmp ax,0xa        ; Check to see if it's a letter or number
;   ; jl set_letter     ; If it's a number, go straight to setting the value
;   ; add byte [bx],7   ; If it's a letter, add 7
;                     ; Why this magic number? ASCII letters start 17
;                     ; characters after decimal numbers. We need to cover that
;                     ; distance. If our value is a 'letter' it's already
;                     ; over 10, so we need to add 7 more.
;   jmp set_letter

; set_letter:
;   add byte [bx],al  ; Add the value of the byte to the char at bx

;   cmp cx,0          ; check the counter, compare with 0
;   je print_hex_done ; if the counter is 0, finish
;   jmp char_loop     ; otherwise, loop again

; print_hex_done:
;   mov bx, HEX_OUT   ; print the string pointed to by bx
;   call print_string

;   popa              ; pop the initial register values back from the stack
;   ret               ; return the function


; [org 0x7c00]

; mov bx, HELLO_MSG
; call print_string
; mov bx, GOODBYE_MSG
; call print_string

  ; mov dx, 0x1fb7    ; Set the value we want to print to dx


  ; call print_hex    ; Print the hex value
  ; jmp $      

%include 'print_str_func.asm'

print_hex:
	pusha
	mov cx, 4
	mov bx, HEX_OUT
	add bx, 5
	add byte [bx], 7

	charloop:
	mov ax, dx
	and ax, 0xf

	cmp ax, 0xa
	jl to_string
	add byte [bx], 7



	to_string:
	add byte [bx], al

	shr dx, 4
	dec cx
	dec bx
	cmp cx, 0
	je end_hex
	jmp charloop



	end_hex:
	mov bx, HEX_OUT
	call print_string

	popa
	ret

; global variables



HEX_OUT: db '0x0000',0

; Padding and magic number

  times 510-($-$$) db 0
  dw 0xaa55
