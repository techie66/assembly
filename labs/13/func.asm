[SECTION .text]
global dotprod
global matrixmult

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
dotprod:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov edi, 0
	mov esi, [ebp+8]
	mov edx, [ebp+12]
	mov ecx, 4
	dot_for:
		mov eax, [esi]
		imul eax, dword[edx]
		add edi, eax
		add esi, 4
		add edx, 16
		dec ecx
		jnz dot_for
	dot_end:

	mov eax, edi

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
matrixmult:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov edx, [ebp+8]
	mov esi, [ebp+16]
	mov ecx, 4
	mult_for:
		mov edi, [ebp+12]
		mov ebx, 4
		inn_for:
			push edi
			push edx
			call dotprod
			add esp, 8
			mov [esi], eax
			add esi, 4
			add edi, 4
			dec ebx
			jnz inn_for
		inn_bot:
		add edx, 16
		dec ecx
		jnz mult_for
	mult_bot:

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
