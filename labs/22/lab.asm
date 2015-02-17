[SECTION .text]
global main
extern printf
main:
push ebx
;Start Here

	push x
	call my_func
	add esp, 4

	push y
	call my_func
	add esp, 4

	push dword[x+4]
	push dword[x]
	push str_out
	call printf
	add esp, 12

	push dword[y+4]
	push dword[y]
	push str_out
	call printf
	add esp, 12

	fld qword[x]
	fmul st0, st0
	fld qword[y]
	fmul st0, st0
	faddp st1, st0
	fsqrt
	fstp qword[tan]

	push dword[tan+4]
	push dword[tan]
	push str_out
	call printf
	add esp, 12

	mov eax, y
	fld qword[eax]
	mov eax, x
	fld qword[eax]
	fpatan
	fldPI
	fdivp st1, st0
	fld qword[oneighty]
	fmulp st1, st0
	fstp qword[tan]

	push dword[tan+4]
	push dword[tan]
	push str_out
	call printf
	add esp, 12


;End Here
pop ebx
ret


;Function
my_func:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push eax
	push ecx
	push edx
; START HERE
	mov edi, 0
	mov dword[nega], 0

	mov eax, 3
	mov ebx, 0
	mov ecx, buf
	mov edx, 1
	int 80h

	cmp byte[buf], '-'
	jnz end_neg
		mov dword[nega], 80000000h
		mov eax, 3
		mov ebx, 0
		mov ecx, buf
		mov edx, 1
		int 80h
	end_neg:
	
	while_per:
	cmp byte[buf], '.'
	jz end_per
		imul edi, 10
		sub byte[buf], 30h
		mov eax, 0
		mov al, byte[buf]
		add edi, eax
		mov eax, 3
		mov ebx, 0
		mov ecx, buf
		mov edx, 1
		int 80h
		jmp while_per
	end_per:

	mov eax, 3
	mov ebx, 0
	mov ecx, buf
	mov edx, 20
	int 80h

	mov edx, 0
	mov esi, 64
	dec eax
	mov dword[dig], eax
	dec eax
	mov dword[buf_end], buf
	add dword[buf_end], eax
	clc

	do:
		mov ebx, [buf_end]
		mov ecx, [dig]
		for:
			mov al, [ebx]
			adc al, al
			aaa
			mov [ebx], al
			dec ebx
			dec ecx
			jnz for
		end_for:
		rcl edi, 1
		rcl edx, 1
		dec esi
		jnc do
	end_do:

	add esi, 1023
	shrd edi, edx, 12
	shrd edx, esi, 12
	or edx, [nega]
	mov eax, [ebp+8]
	mov dword[eax], edi
	mov dword[eax+4], edx

; STOP HERE
	pop edx
	pop ecx
	pop eax
	pop esi
	pop edi
	pop ebx
	pop ebp

ret
	
;End Function
[SECTION .bss]
nega resd 1
buf resb 128
buf_end resd 1
dig resd 1
tan resq 1
x resq 1
y resq 1

[SECTION .data]
str_out db '%lf',10,0
oneighty dq 180.
