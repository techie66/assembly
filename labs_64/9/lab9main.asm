[SECTION .text]

global main

extern add2tree
extern binsearch
extern scanf
extern rand
extern printf

main:
push ebx

mov dword [mytree], 0


mov ebx, 1000000
mov edi, 1
topfor:
call rand
push edi
push eax
push mytree
call add2tree  ; mytree is a pointer to the address of the root
add esp, 12
inc edi
dec ebx
jnz topfor

topwhile:
push message
push pmformat
call printf
add esp, 8
push target
push sformat
call scanf
add esp, 8
cmp eax, 0
je dunwhile
push dword [target]
push dword [mytree]
call binsearch
add esp, 8

cmp eax, 0
je notfound

push eax
push dword [target]
push pfoundformat
call printf
add esp, 12
jmp skip
notfound:
push dword [target]
push pnotformat
call printf
add esp,8
skip:
jmp topwhile
dunwhile:
pop ebx
ret

[SECTION .bss]
mytree resd 1
target resd 1

[SECTION .data]
sformat db '%u', 0
pfoundformat db 'Student with ID=%u has license number %u.',10,10,0
pnotformat db 'Student ID %u not found.',10,10,0
pmformat db '%s',0
message db 'Enter a student ID (or any non-digit to quit): ',0