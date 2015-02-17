[SECTION .text]
global my_cmp
my_cmp:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
; START HERE

	mov eax, [ebp+8]
	mov esi, [eax]
	mov eax, [ebp+12]
	mov edi, [eax]

	mov ecx, -1

	repe cmpsb

	ja above_2
	mov eax, -1
	jmp done
	above_2:
	mov eax, 1

	done:

; STOP HERE
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret
	
