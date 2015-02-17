global solver
;Function
solver:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push eax
	push ecx
	push edx
; START HERE

	mov eax, [ebp+8]	;eax is now *a1
	mov ebx, [ebp+12]	;ebx is now *x1
	fldz
	mov ecx, [ebp+24]
	cmp ecx, 1		;test before loop so we can do 
	jna endwhile		; iterated test at the bottom
	while:
		fld qword[eax]
		fmul qword[ebx]
		faddp st1, st0
		add eax, 8
		add ebx, 8
		dec ecx
		cmp ecx, 1
		ja while
	endwhile:
	fld qword[ebp+16]	;load Bn
	fsubrp st1, st0
	fdiv qword[eax]
	fstp qword[ebx]		;store to Xn

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



