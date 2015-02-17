[SECTION .text]
global bigsum
bigsum:
	push rbp
	mov ebp, esp
	push rbx
	push rdi
	push rsi
; Start Here

	mov eax, [ebp+8]
	mov ecx, [ebp+12]
	mov edi, 0
	mov esi, 0

	topfor:
		add esi, [eax]
		jno valid
			cmp esi, 0
			jnl decover
			inc edi
			jmp valid
			decover:
			dec edi

		valid:
		add eax, 4
		dec ecx
		jnz topfor
	endfor:

	cmp esi, 0
	jnl done
	dec edi
	done:

	mov eax, esi
	mov edx, edi

	pop rsi
	pop rdi
	pop rbx
	pop rbp

ret

