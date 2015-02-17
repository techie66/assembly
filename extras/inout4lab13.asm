[SECTION .text]
global getnames
extern printf

getnames:
push ebx
push ecx
push edi
push esi
mov edi, arrayofaddresses
push dword bufferofnames
mov esi, 0  ;count

mov eax, 4
mov ebx, 1
mov ecx, msg
mov edx, 163
int 80h

topwhile:
mov eax, 4
mov ebx, 1
mov ecx, prompt
mov edx, 2
int 80h

mov eax, 3
mov ebx, 0
pop ecx
mov edx, 30
int 80h
cmp eax, 1
je dunwhile
mov [edi], ecx
add edi, 4
add ecx, eax
push ecx
inc esi
mov byte [ecx-1], 0
jmp topwhile
dunwhile:

mov edx, esi
mov eax, arrayofaddresses

pop esi
pop edi
pop ecx
pop ebx
ret

global showname
showname:
push ebp
mov ebp, esp
push ecx
push edx

push dword [ebp+8]
push pformat
call printf
add esp, 8

pop edx
pop ecx
pop ebp
ret

[SECTION .data]
pformat db '%s', 10, 0
msg db 'At the prompt, enter any character string, terminated by Enter;'
    db ' An empty string (Enter only) ends the entry process.'
    db '  Maximum length of an entry is 30 characters.',10
prompt db '? '

[SECTION .bss]
arrayofaddresses resd 100
bufferofnames resb 3000