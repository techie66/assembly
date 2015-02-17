[SECTION .text]
global find_big
find_big:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi

	mov eax, [ebp+8]
	mov edi, [eax]
	mov esi, eax
	add esi, 4
	mov ebx, [ebp+12]
	dec ebx

	topfor:
		cmp [esi], edi
		jbe endf
		mov eax, esi
		mov edi, [eax]
		endf:
		add esi, 4
		dec ebx
		jnz topfor
	endfor:

	pop esi
	pop edi
	pop ebx
	pop ebp

ret
	
