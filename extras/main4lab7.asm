[SECTION .text]
extern fill_array
extern qsort
extern scanf
extern printf
extern binsearch
extern malloc
extern free

global main

main:
push ebx

push 500
push mybytes
call fill_array
add esp, 8

push mycompare
push 1
push 500
push mybytes
call qsort
add esp, 16


push 500
push mybytes
call show_signed_bytes
add esp, 8

top:
push prompt
call printf
add esp, 4

push temp
push sformat
call scanf
add esp, 8

cmp eax, 0
je setcy
clc
mov eax, [temp]
jmp over
setcy:
stc
over:

jc dun
push eax
push 500
push mybytes
call binsearch
add esp, 12

push eax
push pformat
call printf
add esp, 8

jmp top
dun:
pop ebx
ret

mycompare:
push ebp
mov ebp, esp
push ebx
push edi
push esi
mov edi, [ebp+8]
mov esi, [ebp+12]
mov al, [edi]
mov bl, [esi] 
cmp al, bl
jge skipif
mov eax, -1
jmp duncomp
skipif:
jnz pos
mov eax, 0
jmp duncomp
pos:
mov eax, 1
duncomp
pop esi
pop edi
pop ebx
pop ebp
ret



show_signed_bytes:
push ebp
mov ebp, esp
push eax
push ebx
push ecx
push edx
push edi
       
mov ecx, [ebp+12]
shl ecx, 2
add ecx, [ebp+12]
push ecx
call malloc
add esp, 4
push eax
mov edi, eax
mov ebx, [ebp+8]
mov ecx, [ebp+12]
mov byte [linecount], 0
topfor:
mov al, [ebx]
cmp al, 0
jge ok
neg al
mov byte [edi], '-'
inc edi
inc byte [linecount]
ok:
cmp al, 9
ja ok2
add al, 30h
mov byte [edi], al
inc edi
inc byte [linecount]
jmp chardun
ok2:
cmp al, 100
jb twodigits
mov byte [edi], 31h
inc edi
inc byte [linecount]
sub al, 100
twodigits:
mov ah, 0
div byte [ten]
add ax, 3030h
mov [edi], al
mov [edi+1], ah
add edi, 2
add byte [linecount], 2
chardun:

mov byte [edi], 20h
inc edi
inc byte [linecount]
cmp byte [linecount], 75
jbe domore
mov byte [edi-1], 10
mov byte [linecount], 0
domore:
inc ebx
dec ecx
jnz topfor
mov byte [edi], 10
inc edi

mov eax, 4
mov ebx, 1
pop ecx
mov edx, edi
sub edx, ecx
int 80h

push ecx
call free
add esp, 4

pop edi
pop edx
pop ecx
pop ebx
pop eax
pop ebp
ret
[SECTION .data]
ten db 10
linecount db 0

[SECTION .data]
prompt db 'Please enter a target value: ',0
sformat db '%d',0
pformat db '%d ',0

[SECTION .bss]
temp resd 1
mybytes resb 500
