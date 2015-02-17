extern MAX_SIZE
global funcx
global find_det
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

	mov ebx, [ebp+12]
	fld qword[ebx]
	mov eax, [ebp+8]
	fld qword[eax]
	fdivp st1, st0
	fchs
	fldz
	fstp qword[ebx]
	mov ecx, [ebp+16]
	dec ecx
	for:
		add ebx, 8
		add eax, 8
		fld qword[eax]
		fmul st0, st1
		fadd qword[ebx]
		fstp qword[ebx]
		dec ecx
		jnz for
	end_for:
	fstp st0

; STOP HERE
	pop edx
	pop ecx
	pop eax
	pop esi
	pop edi
	pop ebx
	pop ebp

ret


;Function
find_det:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push eax
	push ecx
	push edx
; START HERE

	mov eax, [MAX_SIZE]
	imul eax, 8
	mov [mymax], eax
	mov eax, [ebp+8]
	cmp dword[ebp+12], 1
	jnz else
	if:
		fld qword[eax]
		jmp end
	else:
		mov ebx, eax
		add ebx, [mymax]
		mov ecx, [ebp+12]
		dec ecx
		det_for:
			push dword[ebp+12]
			push ebx
			push eax
			call funcx
			add esp, 12
			add ebx, [mymax]
			dec ecx
			jnz det_for
		end_det_for:
		mov edx, [ebp+12]
		dec edx
		push edx
		mov ebx, eax
		add ebx, [mymax]
		add ebx, 8
		push ebx
		call find_det
		add esp, 8
		fmul qword[eax]
	endif:

; STOP HERE
end:
	pop edx
	pop ecx
	pop eax
	pop esi
	pop edi
	pop ebx
	pop ebp

ret


[SECTION .bss]
mymax resd 1

