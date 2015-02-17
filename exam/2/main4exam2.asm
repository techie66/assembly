[SECTION .text]
global main
extern solver
extern printf

main:
push ebx

;insert exam code here

mov eax, coef
mov ebx, rhs
mov edx, 1
mov ecx, 5
forfive:
	push edx
	push dword[ebx+4]
	push dword[ebx]
	push sol
	push eax
	call solver
	add esp, 20
	mov esi, 8
	imul esi, edx
	add eax, esi
	add ebx, 8
	inc edx
	dec ecx
	jnz forfive
end_forfive:


;stop inserting code now
mov ebx, sol
mov edi, 5
topfor2:
push dword [ebx+4]
push dword [ebx]
push pformat
call printf
add esp, 12
add ebx, 8
dec edi
jnz topfor2
push 10
push esp
call printf
add esp, 8

pop ebx
ret

[SECTION .data]
coef dq 1.56, 6.82, 5.64, -3.67, 4.00, 4.33, 6.00, 1.00, -6.00, -5.00, 4.23, 0.69, -8.22, 1.24, -6.89
rhs dq -3.12, -9.00, -11.00, 6.00, 8.00
pformat db '%.2lf ', 0
[SECTION .bss]
sol resq 5
