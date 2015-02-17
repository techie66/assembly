[SECTION .text]
global main
extern printf
extern funcx
main:
push ebx
;Start Here

	

;End Here
pop ebx
ret


;Function
my_func:
	push ebp
	mov ebp, esp
	push ebx
	push edi
	push esi
	push eax
	push ecx
	push edx
; START HERE

	

; STOP HERE
	pop edx
	pop ecx
	pop eax
	pop esi
	pop edi
	pop ebx
	pop ebp

ret
	
;End Function
[SECTION .bss]

[SECTION .data]


