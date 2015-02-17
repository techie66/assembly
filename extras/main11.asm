[SECTION .text]
global main
extern addBCD
extern mulx1
extern mulxn
main:
push ebx

push num1
call getBCD
add esp, 4

push num2
call getBCD
add esp, 4

push num2
push num1
call addBCD
add esp, 8

mov eax, 4
mov ebx, 1
mov ecx, msg1
mov edx, 11
int 80h

push num1
call showBCD
add esp, 4

push onedigitprod
push 9
push num2
;call mulx1
add esp, 12

mov eax, 4
mov ebx, 1
mov ecx, msg2
mov edx, 24
int 80h

push onedigitprod
call showBCD
add esp, 4

push num1
call getBCD
add esp, 4

push num2
call getBCD
add esp, 4

push manydigitprod
push num2
push num1
;call mulxn
add esp, 12

mov eax, 4
mov ebx, 1
mov ecx, msg3
mov edx, 40
int 80h

push manydigitprod
call showBCD
add esp, 4

pop ebx
ret


global showBCD
showBCD:
push ebp
mov ebp, esp
push eax
push ebx
push ecx
push edx
push edi
push esi
mov edi, [ebp+8]
add edi, 99
mov ecx, 100
mov al, 0
std
repe scasb
cld
mov esi, ecx
mov ecx, edi
inc ecx
inc esi

mov ebx, 1
mov edx, 1
toascii:
add byte [ecx], 30h
mov eax, 4
int 80h
dec ecx
dec esi
jnz toascii

mov eax, 4
push dword 10
mov ecx, esp
mov edx, 1
int 80h
add esp, 4
 
pop esi
pop edi
pop edx
pop ecx
pop ebx
pop eax
pop ebp
ret

global getBCD
getBCD:
push ebp
mov ebp, esp
push eax
push ebx
push ecx
push edx
push edi
push esi

mov eax, 4
mov ebx, 1
push dword '?'
mov ecx, esp
mov edx, 1
int 80h
add esp, 4

mov edi, [ebp+8]
mov al, 0
mov ecx, 100
rep stosb

mov eax, 3
mov ebx, 0
mov ecx, [ebp+8]
mov edx, 100
int 80h

dec eax

add ecx, eax
mov byte [ecx], 0  ;replace newline with 0
dec ecx ; ptr to last
mov edx, [ebp+8] ; ptr to first
topwhile:
cmp eax, 2
jb dunwhile
mov bl, [ecx]
sub bl, 30h
xchg bl, [edx]
sub bl, 30h
xchg bl, [ecx]
dec ecx
inc edx
sub eax, 2
jmp topwhile
dunwhile:
cmp eax, 0
je dundun
sub byte [ecx], 30h
dundun:

pop esi
pop edi
pop edx
pop ecx
pop ebx
pop eax
pop ebp
ret

[SECTION .data]
msg1 db 'The sum is '
msg2 db 'num2 multiplied by 9 is '
msg3 db 'The product of your last two entries is '

[SECTION .bss]
num1 resb 100
num2 resb 100
onedigitprod resb 100
manydigitprod resb 200