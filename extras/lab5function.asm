[SECTION .text]

global showall
extern printf

showall:
push ebp
mov ebp, esp
push ebx
push edi
push eax
push ecx
push edx

mov ebx, [ebp+8]
mov edi, 0

topfor:
mov eax, edi
mov edx, 0
mov ecx, 14
div ecx
cmp edx, 0
jnz ok
push 10
push charformat
call printf
add esp, 8
ok:
push dword [ebx]
push format
call printf
add esp, 8
add ebx, 4
inc edi
cmp edi, [ebp+12]
jne topfor
pop edx
pop ecx
pop eax
pop edi
pop ebx
pop ebp
ret
[SECTION .data]
format db '%11u',0
charformat db '%c',0