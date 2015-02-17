global funcx
;Function
funcx:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push eax
	push ecx
	push edx
; START HERE

	mov eax, dword[ebp+8]
	fld qword[eax]
	fld qword[eax]
	fmulp st1, st0
	fld qword[eax]
	fmulp st1, st0
	fld qword[eax]
	fmulp st1, st0
	fld qword[one]
	faddp st1, st0
	fsqrt
	fsqrt
	fld qword[eax]
	fdivp st1, st0

; STOP HERE
	pop edx
	pop ecx
	pop eax
	pop esi
	pop edi
	pop ebx
	pop ebp

ret


[SECTION .data]
one dq 1.0
