[SECTION .text]
global bigsum
bigsum:
	push rbp
	mov rbp, rsp
	push rbx
	push rdi
	push rsi
; Start Here

	mov rax, [rbp+16]
	mov ecx, [rbp+24]
	mov edi, 0
	mov esi, 0

	topfor:
		add esi, [rax]
		jno valid
			cmp esi, 0
			jnl decover
			inc edi
			jmp valid
			decover:
			dec edi

		valid:
		add rax, 4
		dec ecx
		jnz topfor
	endfor:

	cmp esi, 0
	jnl done
	dec edi
	done:

	mov eax, esi
	shl rax, 32
	mov eax, edi

	pop rsi
	pop rdi
	pop rbx
	pop rbp

ret

