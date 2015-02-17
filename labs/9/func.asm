[SECTION .text]
global binsearch
binsearch:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
; START HERE

	mov esi, [ebp+8]
	cmp esi, 0
	jnz elsif
		mov eax, 0
		jmp done
	elsif:
	mov edi, [ebp+12]
	cmp edi, [esi+4]
	jnz else
		mov eax, [esi+8]
		jmp done
	else:
	cmp edi, [esi+4]
	ja above
		push edi
		push dword[esi]
		call binsearch
		add esp, 8
		jmp done
	above:
		push edi
		push dword[esi+12]
		call binsearch
		add esp, 8
		jmp done
	
	done:

; STOP HERE
	pop esi
	pop edi
	pop ebx
	pop ebp

ret
	
