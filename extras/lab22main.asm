[SECTION .text]

extern initcoef
extern polyval
extern sscanf
extern frac2asc

global main

main:

push ebp
mov ebp, esp
push ebx

finit

push 100
push coef
call initcoef
add esp, 8

finit

mov ebx, [ebp+12]
push x
push formatr
push dword [ebx+4]
call sscanf
add esp, 12

push dword [x]
push dword 99
push coef
call polyval
add esp, 12

mov ebx, [ebp+12]
push precision
push formati
push dword [ebx+8]
call sscanf
add esp, 12

mov ecx, [precision]
fld dword [pt5]
jecxz roundok
topround:
fidiv dword [ten]
dec ecx
jnz topround
roundok:
faddp st1, st0

fld st0
frndint
fcom st1
fstsw ax
test ah, 1
jnz ok
fld1
fsubp st1, st0
ok:
fist dword [intpart]
fsubp st1, st0

mov eax, [intpart]
mov ecx, 0
topdo:
mov edx, 0
div dword [ten]
push edx
inc ecx
cmp eax, 0
jnz topdo

mov ebx, outstring
mov edx, ecx
forecxtimes:
pop eax
add al, 30h
mov [ebx], al
inc ebx
dec ecx
jnz forecxtimes
mov byte [ebx], '.'
inc ebx

push ebx
push dword [precision]
call frac2asc
add esp, 8

inc edx
add edx, [precision]
mov byte [outstring+edx], 10
inc edx
mov ecx, outstring
mov ebx, 1
mov eax, 4
int 80h

pop ebx
pop ebp
ret

[SECTION .bss]
coef resd 100
x resd 1 
intpart resd 1
outstring resb 30
precision resd 1

[SECTION .data]
formatr db  '%f', 0
formati db '%u', 0
ten dd 10
pt5 dd 0.5