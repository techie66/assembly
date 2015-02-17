extern printf
[SECTION .text]
BITS 64
global main ;OS treats main as a function
main:
push rbx ;keep value of ebx for OS
;now the real code

mov eax, 5          ; set the open function
mov ebx, file       ; pointer to filename
mov ecx, 0          ; don't know why, but you have to
int 80h             ; call the function

mov ebx, eax        ; set input to opened file

mov eax, 3          ; set the read function
mov ecx, randoms    ; pointer to read data to
mov edx, 4000       ; read 81 bytes
int 80h             ; call the function

mov edx, 999        ; number of unsorted pairs

topdo:

mov ebx, randoms    ; start of array
mov al, 0           ; "swap" flag
mov ecx, edx        ; set loop to unsorted pairs

topwhile:

mov esi, [ebx]
mov edi, [ebx+4]
topif:
cmp esi, edi
jbe endif
mov [ebx+4], esi
mov [ebx], edi
mov al, 1
endif:

add ebx, 4
dec ecx
jnz topwhile

endwhile:

dec edx
cmp al, 0
jnz topdo

enddo:

mov rbx, randoms
mov edi, 1000
topprint:

push qword [rbx]
push string
call printf
add rsp, 16
add ebx, 4

dec edi
jnz topprint
endprint:

pop rbx ;restore ebx for exit
ret

[SECTION .data]
question db 3fh
return db 0ah
file db 'randomnums.bin',0
string db '%u',10,0

[SECTION .bss]
buffer resb 81
randoms resb 4000
