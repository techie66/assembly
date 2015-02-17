[SECTION .text]

global special
extern CONTAINER_SIZE
special:
push ebp
mov ebp, esp
push ebx
push ecx
push edx
push edi

mov ebx, [ebp+8]
mov ecx, [ebp+12]
mov edx, [CONTAINER_SIZE]
shl edx, 2
dec ecx
topdo:
add ebx, edx
cmp dword [ebx], 0
jne pre_reduce
dec ecx
jnz topdo
mov eax, 0
jmp dunhere
pre_reduce:
mov edi, [ebp+8]
mov ecx, [ebp+12]
topforex:
neg dword [ebx]
push dword [ebx]
push dword [edi]
pop dword [ebx]
pop dword [edi]
add ebx, 4
add edi, 4
dec ecx
jnz topforex
mov eax, 1
dunhere:
pop edi
pop edx
pop ecx
pop ebx
pop ebp
ret