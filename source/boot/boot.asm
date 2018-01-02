	use16
	org 7C00h

; Boot the operating system.
boot:	cli
	cld

	; Clear the segment registers.
	xor	ax,	ax
	mov	ds,	ax
	mov	es,	ax
	mov	ss,	ax

	mov	sp,	7BFEh	; Set up the stack.

	sti			; Now that the stack is setup, restore
				; interrupts.

; Prevents the system from executing past here.
hang:	hlt
	jmp	hang		; If hlt fails, jump to hang.

	times	510-$+$$ db 0	; Fill the bootsector with NUL bytes.
	dw	0AA55h		; Set the last two bytes to the boot signature:
				; "55 AA."

