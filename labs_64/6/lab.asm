[BITS 64]

[SECTION .text]
global bin64toasc
bin64toasc:
	push rbp
	mov rbp, rsp
	push rbx
	push rdi
	push rsi
; Start Here

	mov rcx, arr
	add rcx, 19
	mov byte[rcx], 0
	mov esi, [rbp+16]
	mov edi, [rbp+24]

	topdo:
		mov edx, 0
		mov eax, edi
		mov ebx, 10
		div ebx
		mov edi, eax
		mov eax, esi
		div ebx
		mov esi, eax
		dec rcx
		add edx, 30h
		mov [rcx], dl
		cmp esi, 0
		jnz topdo
		cmp edi, 0
		jnz topdo
	enddo:

	mov rax, rcx

	pop rsi
	pop rdi
	pop rbx
	pop rbp

ret

[SECTION .bss]
arr resb 20
