[SECTION .text]

global main

extern add2tree
extern rand
extern printf

main:
push ebx

mov dword [mytree], 0


mov ebx, 100
mov edi, 1
topfor:
call rand
and eax, 0ffh
push edi
push eax
push mytree
call add2tree  ; mytree is a pointer to the address of the root
add esp, 12
inc edi
dec ebx
jnz topfor

push dword [mytree]
call inorder
add esp, 4

pop ebx
ret

inorder:
push ebp
mov ebp, esp
push eax
push ebx
push ecx
push edx
push edi

mov edi, [ebp+8]
cmp edi, 0
je dunwalk
push dword [edi]
call inorder 
add esp, 4

push dword [edi+8]
push dword [edi+4]
push pformat
call printf
add esp, 12

push dword [edi+12]
call inorder
add esp, 4

dunwalk:
pop edi
pop edx
pop ecx
pop ebx
pop eax
pop ebp
ret


[SECTION .bss]
mytree resd 1

[SECTION .data]
pformat db 'Student ID=%u, license number=%u',10,0
