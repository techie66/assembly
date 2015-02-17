;JAcob Geigle
[SECTION .text]
global main
extern freq
main:
push ebx

;START

mov eax, 5          ; set the open function
mov ebx, file       ; pointer to filename
mov ecx, 0          ; sets mode to read only
int 80h             ; call the function

mov ebx, eax        ; set input to opened file

mov eax, 3          ; set the read function
mov ecx, data       ; pointer to read data to
mov edx, 20000      ; read 20000 bytes
int 80h             ; call the function

push 5000
push data
call freq
mov esi, eax
add esp, 8
mov ah, 30h
mov al, 30h
mov edx, 0
main_while:
	inc edi
	add edx, [esi]
	add esi, 4
	inc al
	cmp al, 3ah
	je if
	jmp endif
	if:
		inc ah
		mov al, 30h
	endif:
	cmp edx, 2500
	jb main_while
main_bot:
mov byte[out_buff], ah
mov byte[out_buff+1], al
mov byte[out_buff+2], 0ah

mov eax, 4 ;set the write function
mov ebx, 1 ;set output to stdout
mov ecx, out_buff ;pointer to data to be written
mov edx, 3 ;write only 12000 bytes
int 80h    ;call the function

for:
	mov eax, 4 ;set the write function
	mov ebx, 1 ;set output to stdout
	mov ecx, dot ;pointer to data to be written
	mov edx, 1 ;write only 12000 bytes
	int 80h    ;call the function
	dec edi
	jnz for
bot:

;STOP
pop ebp
ret
[SECTION .bss]
data resd 5000
out_buff resb 3
[SECTION .data]
file db 'labexam1.dat ',0
dot db '.',0
