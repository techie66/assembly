[BITS 64]

[SECTION .text]
global bin64toasc
bin64toasc:
	push rbp
	mov ebp, esp
	push rbx
	push rdi
	push rsi
; Start Here

	mov ecx, arr
	add ecx, 19
	mov byte[ecx], 0
	mov esi, [ebp+8]
	mov edi, [ebp+12]

	topdo:
		mov edx, 0
		mov eax, edi
		mov ebx, 10
		div ebx
		mov edi, eax
		mov eax, esi
		div ebx
		mov esi, eax
		dec ecx
		add edx, 30h
		mov [ecx], dl
		cmp esi, 0
		jnz topdo
		cmp edi, 0
		jnz topdo
	enddo:

	mov eax, ecx

	pop rsi
	pop rdi
	pop rbx
	pop rbp

ret

[SECTION .bss]
arr resb 20
