extern printf
extern rand
extern find_big
[SECTION .text]
global main         ; OS treats main as a function
main:
push ebx            ; keep value of ebx for OS
                    ; now the real code

mov ebx, randoms
mov edi, 1000

topfor:
	call rand
	mov dword [ebx], eax
	add ebx, 4
	dec edi
	jnz topfor
botfor:

mov edi, 1000
mov ebx, randoms

topwhile:
	cmp edi, 1
	jbe botwhile
	push edi
	push ebx
	call find_big
	mov ecx, [eax]
	mov edx, [ebx]
	mov [eax], edx
	mov [ebx], ecx
	add esp, 8
	add ebx, 4
	dec edi
	jmp topwhile
botwhile:

mov eax, 8
mov ebx, file
mov ecx, 110100100b
int 80h

mov ebx, eax        ;set output to new file
mov eax, 4          ;set the write function
mov ecx, randoms    ;pointer to data to be written
mov edx, 4000       ;how much to write
int 80h             ;call the function


pop ebx             ; restore ebx for exit
ret

[SECTION .data]
question db 3fh
return db 0ah
file db 'sorted.bin',0
string db '%u',10,0

[SECTION .bss]
buffer resb 81
randoms resb 4000
arg1 resb 4
