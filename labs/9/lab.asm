[SECTION .text]
extern malloc
global add2tree
add2tree:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
; START HERE

	mov esi, [ebp+8]
	mov ebx, [esi]
	cmp ebx, 0
	jnz notbase
		push dword 16
		call malloc
		add esp, 4
		mov [esi], eax
		mov ecx, [ebp+12]
		mov [eax+4], ecx
		mov ecx, [ebp+16]
		mov [eax+8], ecx
		mov dword[eax], 0
		mov dword[eax+12], 0
		jmp done
	notbase:
		push dword[ebp+16]
		push dword[ebp+12]
		mov edx, [ebp+12]
		mov edi, [ebx+4]
		cmp edx, edi
		jnb notless
			push ebx
			call add2tree
			add esp, 12
			jmp done
		notless:
			add ebx, 12
			push ebx
			call add2tree
			add esp, 12

	done:

; STOP HERE
	pop esi
	pop edi
	pop ebx
	pop ebp

ret
	
