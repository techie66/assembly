%macro mymac 3
	imul %1, %2, 320
	add %1, %3
%endmacro

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

drawtile:
push bp
mov bp, sp
push bx
push cx
push dx
push di
push si
;START
	mymac di, [bp+4], [bp+6]
	mov al, [bp+8]
	mov dx, 31
	drawfor:
		push di
		mov cx, 40
		rep stosb
		pop di
		add di, 320
		dec dx
		jnz drawfor
	drawbot:
;END
pop si
pop di
pop dx
pop cx
pop bx
pop bp
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

movetile:
push bp
mov bp, sp
push bx
push cx
push dx
push di
push si
;START

	mymac si, [bp+8], [bp+10]
	mymac di, [bp+4], [bp+6]
	mov dx, 31
	movefor:
		push di
		push si
		mov cx, 40
		rep movsb
		pop si
		pop di
		add si, 320
		add di, 320
		dec dx
		jnz movefor
	movebot:
	push 0
	push word[bp+10]
	push word[bp+8]
	call drawtile
	add sp, 6

;END
pop si
pop di
pop dx
pop cx
pop bx
pop bp
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

getmouse:
push bp
mov bp, sp
push bx
push di
push si
;START

	do1:
		mov ax, 3
		int 33h
		cmp bx, 0
		jz do1
	endwhile1:

	push bx

	do2:
		mov ax, 3
		int 33h
		cmp bx, 0
		jnz do2
	endwhile2:

	pop bx
	cmp bx, 2
	jnz else
	mov ax, 2
	jmp done
	
	else:
		mov ax, dx
		mov dl, 31
		idiv dl
		imul dl
		mov dx, ax
		shr cx, 1
		mov ax, cx
		mov cl, 40
		idiv cl
		imul cl
		mov cx, ax
		mov ax, 1
	done:

;END
pop si
pop di
pop bx
pop bp
ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

