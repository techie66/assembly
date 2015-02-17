extern printf
extern sort
[SECTION .text]
global main ;OS treats main as a function
main:
push rbx ;keep value of ebx for OS
;now the real code

mov eax, 5          ; set the open function
mov ebx, file       ; pointer to filename
mov ecx, 0          ; sets mode to read only
int 80h             ; call the function

mov ebx, eax        ; set input to opened file

mov eax, 3          ; set the read function
mov ecx, randoms    ; pointer to read data to
mov edx, 4000       ; read 4000 bytes
int 80h             ; call the function

push 4000           ; number of unsorted pairs
push randoms        ; 
call sort
add esp, 8

mov esi, randoms
mov ebx, lookup
mov edi, output

mov ecx, 4001
topfor:
	dec ecx
	jz botfor
	mov dl, [esi]
	mov dh, 0
	shl dx, 4
	push rbp
	mov ebp, lookup
	add ebp, edx
	mov al, [ebp]
	pop rbp
	mov [edi], eax
	inc edi
	mov dh, 0
	shl dx, 4
	push rbp
	mov ebp, lookup
	add ebp, edx
	mov al, [ebp]
	pop rbp
	mov [edi], eax
	inc edi
	mov byte[edi], 20h
	inc edi
	inc esi
	jmp topfor
botfor:


mov eax, 4 ;set the write function
mov ebx, 1 ;set output to stdout
mov ecx, output ;pointer to data to be written
mov edx, 12000 ;write only 12000 bytes
int 80h    ;call the function



pop rbx ;restore ebx for exit
ret

[SECTION .data]
question db 3fh
return db 0ah
file db 'randomnums.bin',0
string db '%u',10,0
lookup db '0123456789ABCDEF',0

[SECTION .bss]
buffer resb 81
randoms resb 4000
output resb 12000
