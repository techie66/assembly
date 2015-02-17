[SECTION .text]
global sort
sort:
	push rbp
	mov ebp, esp
	push rbx
	push rdi
	push rsi
; Start Here

mov esi, [ebp+12]
mov edi, [ebp+8]

cmp esi, 1
jz end
	dec esi
	inc edi
	push rsi
	push rdi
	dec edi
	call sort
	add esp, 8
	mov al, [edi]
	inc edi
	topwhile:
		cmp esi, 0
		jle endwhile
		cmp al, [edi]
		jle endwhile
		shr word[edi-1],8
		dec esi
		inc edi
		jmp topwhile
	endwhile: 
	mov [edi-1], al

end:

; End Here
	pop rsi
	pop rdi
	pop rbx
	pop rbp

ret

