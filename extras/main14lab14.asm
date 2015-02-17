[SECTION .text]

extern addBCD
showBCD:
push ebp
mov ebp, esp
pushad
mov esi, [ebp+8]
mov edi, esi
mov ecx, [ebp+12]
add esi, ecx
mov byte [esi], 10
shr ecx, 1
adc ecx, 0
topfor2:
dec esi 
mov al, [esi]
or al, 30h
xchg [edi], al
or al, 30h
xchg [esi], al
inc edi
dec ecx
jnz topfor2

mov eax, 4
mov ebx, 1
mov ecx, [ebp+8]
mov edx, [ebp+12]
inc edx
int 80h
popad
pop ebp
ret

getBCD:
push ebp
mov ebp, esp
push ebx
push ecx
push edx
push edi
push esi
mov eax, 3
mov ebx, 0
mov ecx, [ebp+8]
mov edx, 80
int 80h
dec eax
mov esi, ecx
add esi, eax
mov byte [esi], 0
dec esi
mov edi, [ebp+8]
mov ecx, eax
shr ecx, 1
adc ecx, 0
topfor3:
mov dl, [esi]
sub dl, 30h
xchg [edi], dl
sub dl, 30h
xchg [esi], dl
dec esi
inc edi
dec ecx
jnz topfor3
pop esi
pop edi
pop edx
pop ecx
pop ebx
pop ebp
ret

global main
main:
push ebx

mov eax, 4
mov ebx, 1
mov ecx, prompt1
mov edx, 48
int 80h

push num1
call getBCD
add esp, 4
mov [len1], eax

mov eax, 4
mov ebx, 1
mov ecx, prompt2
mov edx, 49
int 80h

push num2
call getBCD
add esp, 4
mov [len2], eax
cmp eax, [len1]
jg pusheax
mov eax, [len1]
pusheax:
push eax
push num2
push num1
call addBCD
add esp, 12
push eax

mov eax, 4
mov ebx, 1
mov ecx, message1
mov edx, 11
int 80h
push num1
call showBCD
add esp, 8

pop ebx
ret

[SECTION .bss]
num1 resb 41
num2 resb 41
len1 resd 1
len2 resd 1

[SECTION .data]
prompt1 db 'Please enter the first number, up to 40 digits: '
prompt2 db 'Please enter the second number, up to 40 digits: '
message1 db 'The sum is '
