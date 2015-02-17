[SECTION .text]
global main
extern printf
extern sscanf
extern funcx
main:
push ebp
mov ebp, esp
push ebx
;Start Here

	mov edi, [ebp+12]
	mov edx, [edi+4]
	push storage
	push sstr
	push edx
	call sscanf
	add esp, 12
	
	push storage
	call funcx
	add esp, 4

	fstp qword[storage]
	push dword[storage+4]
	push dword[storage]
	push pstr
	call printf
	add esp, 12

;End Here
pop ebx
pop ebp
ret

;End Function
[SECTION .bss]
storage resq 1

[SECTION .data]
sstr db '%lf',0
pstr db '%.12lf',10,0

