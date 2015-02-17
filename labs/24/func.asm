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

	fld qword[cc]
	mov ebx, dword[ebp+8]
	fld qword[ebx]
	fld1
	do:
		fld1
		fld st1
		fyl2x
		fldln2
		fmulp st1, st0
		fld1
		faddp st1, st0
		fld st1
		call support
		fmul st1, st0
		fsub st0, st3
		fdivrp st1, st0
		fsubr st0, st1
		fxch
		fsubr st0, st1
		fabs
		fcomp st0, st3
		fstsw ax
		sahf
		jnb do
	while:
	fstp st1
	fstp st1

; STOP HERE
	pop edx
	pop ecx
	pop eax
	pop esi
	pop edi
	pop ebx
	pop ebp

ret

;SUPPORT FUNCTION
support:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push eax
	push ecx
	push edx
; START HERE

	fld st0
	fyl2x
	fld st0
	frndint
	fxch
	fsub st0, st1
	f2xm1
	fld1
	faddp st1, st0
	fscale
	fstp st1

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
cc dq 1.e-12
omega dq 27.

[SECTION .bss]
temp resq 1
cont resw 1
