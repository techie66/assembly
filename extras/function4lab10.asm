[SECTION .text]

extern printf
global show_dword_array

show_dword_array:

push ebp
mov ebp, esp
push eax
push ebx
push ecx
push edx
push edi
push esi

mov ebx, [ebp+8]
mov esi, [ebp+12]
mov edi, 0

topfor:
push dword [ebx]
push pformat
call printf
add esp, 8
inc edi
test edi, 7
jnz nonewline
push newline
call printf
add esp, 4
nonewline:
add ebx, 4
dec esi
jnz topfor

pop esi
pop edi
pop edx
pop ecx
pop ebx
pop eax
pop ebp
ret

[SECTION .data]
pformat db '%u ', 0
newline db 10, 0