[SECTION .text]
global sort_yall
sort_yall:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
; Start Here
	mov esi, [ebp+12]
	cmp esi, 1
	jz near end
	cmp esi, 0
	jz end

	mov edi, [ebp+8]
	add edi, 4
	dec esi

	topfor:
		push dword[edi]
		add edi, 4
		dec esi
		jnz topfor
	botfor:

	sub edi, 4
	mov edx, [ebp+8]
	mov ecx, [edx]
	mov esi, [ebp+12]
	dec esi
; SPLIT IT UP
	sortfor:
		pop eax
		cmp eax, ecx;
		jl myelse
		mov [edi], eax
		sub edi, 4
		jmp myfor
		myelse:
			mov [edx], eax
			add edx, 4

		myfor:
			dec esi
			jnz sortfor
	stopfor:
	
	mov [edi], ecx

	; RECURSION

	sub edx, [ebp+8]
	shr edx, 2
	; edx contains 'low-count'

	mov esi, [ebp+12]
	sub esi, edx
	dec esi
	; esi contains 'high-count'
	add edi, 4
	; edi contains right address
	
	; done making args
	push edx
	push dword[ebp+8]
	call sort_yall
	add esp, 8
	push esi
	push edi
	call sort_yall
	add esp, 8


; End Here
end:
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

