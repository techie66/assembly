[SECTION .text]
global get_precision

get_precision:

push ebx
push ecx
push edx

mov eax, 4
mov ebx, 1
mov ecx, prompt
mov edx, 38
int 80h

mov eax, 3
mov ebx, 0
mov ecx, reply
mov edx, 3
int 80h

cmp eax, 3
je tenplus
mov eax, 0
mov al, [reply]
sub al, 30h
jmp dun
tenplus:
mov eax, 0
mov ah, [reply]
mov al, [reply+1]
sub ax, 3030h
aad
dun:

pop edx
pop ecx
pop ebx
ret

global get_userstring
get_userstring:
push ebp
mov ebp, esp
push ebx
push ecx
push edx

mov eax, 4
mov ebx, 1
mov ecx, inprompt
mov edx, 64
int 80h

mov eax, 3
mov ebx, 1
mov ecx, [ebp+8]
mov edx, 80
int 80h

pop edx
pop ecx
pop ebx
pop ebp
ret

[SECTION .data]
prompt db 'Please enter precision--0 through 18: '
inprompt db 'Please enter a fixed-point real with period, at most 18 digits: '
[SECTION .bss]
reply resb 3