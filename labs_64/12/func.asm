[SECTION .text]
global addBCD
global mulx1
global mulxn

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
addBCD:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov ecx, [ebp+8]
	mov edx, [ebp+12]
	clc           ;set carry to CLEAR
	mov ebx, 100
	add_for:
		mov al, byte[ecx]
		adc al, byte[edx]
		aaa           ;adjust here
		mov byte[ecx], al
		inc ecx
		inc edx
		dec ebx
		jnz add_for
	add_bot:

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
mulx1:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov ecx, [ebp+8]
	mov edx, [ebp+13]
	mov byte[pre_carry], 0
	mov ebx, 100
	mul1_for:
		mov al, byte[ebp+12]
		mul byte[ecx]
		adc al, [pre_carry]
		aam
		mov [edx], al
		mov [pre_carry], ah
		inc edx
		inc ecx
		dec ebx
		jnz mul1_for
	mul1_bot:

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
mulxn:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
; START HERE

	mov ecx, [ebp+12]    ;num2
	mov edx, [ebp+16]    ;total
	mov ebx, 100
	muln_for:
		push temp
		dec esp
		mov al, [ecx]
		mov [esp], al
		push dword[ebp+8]
		call mulx1
		add esp, 9
		push temp
		push edx
		call addBCD
		add esp, 8
		inc edx
		inc ecx
		dec ebx
		jnz muln_for
	muln_bot:

; STOP HERE
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

[SECTION .bss]
pre_carry resb 1
temp resb 100
