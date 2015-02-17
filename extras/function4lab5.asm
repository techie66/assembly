[SECTION .text]
global convert

convert:
push ebp
mov ebp, esp
push ebx
push ecx
mov ebx, [ebp+8]
mov ax, 0
mov ecx, 8
topfor:
mov al, [ebx]
ror al, 1
shl ax, 1
inc ebx
dec ecx
jnz topfor
mov al, ah
pop ecx
pop ebx
pop ebp
ret