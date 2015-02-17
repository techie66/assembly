[SECTION .text]
extern printf
global getdatum

getdatum:

push ebx
push ecx
push edx

cmp byte [firsttime], 1
jne skip
mov eax, 4
mov ebx, 1
mov ecx, message
mov edx, 215
int 80h
mov byte [firsttime], 0
skip:
mov eax, 4
mov ebx, 1
mov ecx, prompt
mov edx, 2
int 80h

mov eax, 3
mov ebx, 0
mov ecx, buffer
mov edx, 100
int 80h

mov ebx, eax
dec ebx
mov ecx, 4
sub ecx, ebx
mov eax, 0
mov edx, buffer

topwhile:
cmp ebx, 0
je dunwhile
shl eax, 8
or al, [edx]
inc edx
dec ebx
jmp topwhile
dunwhile:
zeros:
cmp ecx, 0
jle dunzeros
shl eax, 8
dec ecx
jmp zeros
dunzeros:
pop edx
pop ecx
pop ebx
ret

global showdatum
showdatum:
push ebp
mov ebp, esp
push eax
push ebx
push ecx
push edx
mov byte [newline], 10
mov eax, [ebp+8]
xchg ah, al
ror eax, 16
xchg ah, al
mov [outbytes], eax
mov eax, 4
mov ebx, 1
mov ecx, outbytes
mov edx, 5
int 80h
pop edx
pop ecx
pop ebx
pop eax
pop ebp
ret

[SECTION .data]
message db 'Please note: you may enter a string consisting of 1, 2, '
        db '3, or 4 characters; if you enter more than 4 characters, '
        db 'only the last 4 will be returned.  No characters entered '
        db '(press only the Enter key) will return NULL.',10
prompt db '? '
firsttime db 1
[SECTION .bss]
nulls resb 4
buffer resb 100
outbytes resb 4
newline resb 1