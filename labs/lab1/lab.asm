[BITS 64]

[SECTION .text]
global main ;OS treats main as a function
main:
push rbx ;keep value of ebx for OS
;now the real code

mov eax, 4 ;set the write function
mov ebx, 1 ;set output to stdout
mov ecx, question ;pointer to data to be written
mov edx, 1 ;write only 1 byte
int 80h    ;call the function

mov eax, 3 ;set the read function
mov ebx, 0 ;set output to stdin
mov ecx, buffer ;pointer to read data to
mov edx, 81 ;read 81 bytes
int 80h    ;call the function

mov esi, eax ;store number of chars read
add ecx, eax ;add number of chars read to ecx
dec ecx      ;decrement ecx

topdo:
mov eax, 4 ;set the write function
mov ebx, 1 ;set output to stdout
mov edx, 1 ;write only 1 byte
int 80h    ;call the function
dec ecx    ;move back one char
dec esi    ;decrement counter
jnz topdo  ;loop until esi is zero

mov eax, 4 ;set the write function
mov ebx, 1 ;set output to stdout
mov ecx, return ;pointer to data to be written
mov edx, 1 ;write only 1 byte
int 80h    ;call the function

mov eax, 4 ;set the write function
mov ebx, 1 ;set output to stdout
mov ecx, question ;pointer to data to be written
mov edx, 1 ;write only 1 byte
int 80h    ;call the function

mov eax, 3 ;set the read function
mov ebx, 0 ;set output to stdin
mov ecx, buffer ;pointer to read data to
mov edx, 81 ;read 81 bytes
int 80h    ;call the function

mov r8b, byte[buffer]
mov rsi, buffer
mov eax, 4 ;set the write function
mov ebx, 1 ;set output to stdout
mov ecx, esi ;pointer to data to be written
mov edx, 1 ;write only 1 byte
int 80h    ;call the function



pop rbx ;restore ebx for exit
ret

[SECTION .data]
question db 3fh
return db 0ah

[SECTION .bss]
buffer resb 81
