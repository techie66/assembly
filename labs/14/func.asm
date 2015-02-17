[SECTION .text]
extern malloc
extern printf
global transpose
global show_array

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
transpose:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov esi, [ebp+8]
	mov ecx, [ebp+12]
	push ecx
	shl ecx, 2
	push ecx
	call malloc
	add esp, 4
	pop ecx
	mov edi, eax
	push eax
	tran_for:
		cmp ecx, 0
		jna tran_bot
		push dword[ebp+12]
		push esi
		call support
		add esp, 8
		mov [edi], eax
		add edi, 4
		push ecx
		mov ecx, [ebp+12]
		in_for:
			cmp ecx, 0
			jna in_bot
			add dword[esi], 4
			add esi, 4
			dec ecx
			jmp in_for
		in_bot:
		mov esi, [ebp+8]
		pop ecx
		dec ecx
		jmp tran_for
	tran_bot:
	pop eax

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
show_array:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov ebx, [ebp+8]
	mov ecx, [ebp+12]
	show_for:
		cmp ecx, 0
		jna show_bot
		mov esi, [ebx]
		push ecx
		mov ecx, [ebp+12]
		sif:
			cmp ecx, 0
			jna sib
			push ecx
			push dword[esi]
			push printstr
			call printf
			add esp, 8
			pop ecx
			add esi, 4
			dec ecx
			jmp sif
		sib:
		push printret
		call printf
		add esp, 4
		pop ecx
		add ebx, 4
		dec ecx
		jmp show_for
	show_bot:

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

support:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov esi, [ebp+8]
	mov ecx, [ebp+12]
	push ecx
	shl ecx, 2
	push ecx
	call malloc
	add esp, 4
	pop ecx
	mov edi, eax
	sup_for:
		cmp ecx, 0
		jna sup_bot
		mov ebx, [esi]
		mov edx, [ebx]
		mov [eax], edx
		add esi, 4
		add eax, 4
		dec ecx
		jmp sup_for
	sup_bot:
	mov eax, edi

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[SECTION .data]
printstr db '%d ',0
printret db 0ah


