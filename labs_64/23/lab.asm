[SECTION .text]
global main
extern printf
extern funcx
main:
push ebx
;Start Here

	push funcx
	push 10000
	push dword[b+4]
	push dword[b]
	push dword[a+4]
	push dword[a]
	call my_func
	add esp, 24

	mov eax, 4
	mov ebx, 1
	mov ecx, prompt
	mov edx, 21
	int 80h

	mov eax, 3
	mov ebx, 0
	mov ecx, buf
	mov edx, 2
	int 80h

	mov dword[buf+1], 0
	mov dword[buf+2], 0
	mov dword[buf+3], 0
	sub dword[buf], 30h

	fsub qword[point5]
	fist dword[integer]
	fadd qword[point5]
	fisub dword[integer]
	mov ecx, dword[buf]
	my_for:
		fmul qword[ten]
		dec ecx
		jnz my_for
	end_my_for:
	fbstp tword[bcdint]
	mov ebx, bcdint
	dec esp
	mov byte[esp], 10
	mov ecx, dword[buf]
	shr ecx, 1
	cmp ecx, 0
	jz end_big_for
	big_for:
		mov al, byte[ebx]
		mov ah, 0
		shl ax, 4
		shr al, 4
		add ax, 3030h
		dec esp
		mov byte[esp], al
		dec esp
		mov byte[esp], ah
		inc ebx
		dec ecx
		jnz big_for
	end_big_for:
	mov ecx, 1
	and ecx, dword[buf]
	cmp ecx, 0
	jz endif
		mov al, byte[ebx]
		mov ah, 0
		shl ax, 4
		shr al, 4
		add ax, 3030h
		dec esp
		mov byte[esp], al
	endif:

	dec esp
	mov byte[esp], '.'
	mov ecx, dword[buf]
	add ecx, 2
	mov eax, dword[integer]
	do:
		mov edx, 0
		mov ebx, 10
		div ebx
		add edx, 30h
		dec esp
		mov byte[esp], dl
		inc ecx
		cmp eax, 0
		jnz do
	while:
	
	mov eax, 4
	mov ebx, 1
	mov edx, ecx
	mov ecx, esp
	int 80h
	add esp, edx

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

fld qword[ebp+16]
fld qword[ebp+8]
fst qword[x]
fsubp st1, st0
fild dword[ebp+24]
fdivp st1, st0
push x
call [ebp+28]
add esp, 4
mov ecx, [ebp+24]
dec ecx
for:
	fld qword[x]
	fadd st0, st2
	fstp qword[x]
	push x
	call [ebp+28]
	add esp, 4
	fimul word[weight]
	faddp st1, st0
	xor word[weight], 110b
	dec ecx
	jnz for
endfor:

mov eax, ebp
add eax, 16
push eax
call [ebp+28]
add esp, 4
faddp st1, st0
fmulp st1, st0
fdiv qword[three]

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
x resq 1
buf resb 128
integer resd 1
p resd 1
bcdint rest 1

[SECTION .data]
weight dw 4
b dq 100.0
a dq 1.0
three dq 3.0
point5 dq 0.5
ten dq 10.0
prompt db 'Enter one character:',0
printstr db '%lf',10,0


