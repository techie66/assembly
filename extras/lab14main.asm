[SECTION .text]

global main

%include "lab14macros.mac"

main:

push ebx
shiftmul f1, f2, result
mov ecx, digits
add ecx, 40
mov byte [ecx], 10
mov edx, 1
topdo:
bigdiv result, 10
add al, 30h
dec ecx
mov [ecx], al
inc edx
cmp2zero result, 16
jnz topdo

mov eax, 4
mov ebx, 1
int 80h

pop ebx
ret

[SECTION .bss]
digits resb 40
       resb 1
result resb 16  ;should become 12089 25819 61462 91747 06176 000
[SECTION .data]
f1 db 0,0,0,0,0,100,0,0 ;=100x2^40=10995 11627 77600
f2 db 0,0,0,0,0,10,0,0  ;=10x2^40=10995 11627 7760