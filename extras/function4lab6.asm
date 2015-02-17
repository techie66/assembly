[SECTION .text]

extern malloc
extern free
global show_signed_bytes

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
jmp dun
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
dun:

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