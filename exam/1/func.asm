;Jacob Geigle
[SECTION .text]
global freq

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
freq:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push ecx
	push edx
; START HERE

	mov edx, [ebp+8]
	mov ecx, [ebp+12]
	freq_for:
		mov ebx, [edx]
		imul ebx, 4
		add ebx, frequency
		inc dword[ebx]
		add edx, 4
		dec ecx
		jnz freq_for
	freq_bot:
	mov eax, frequency

; STOP HERE
	pop edx
	pop ecx
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[SECTION .bss]
frequency resd 101


