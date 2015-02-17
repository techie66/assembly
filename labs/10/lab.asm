[SECTION .text]

global main

extern qsort
extern my_cmp
extern malloc

main:
push ebx
; START HERE

	mov eax, 5          ; set the open function
	mov ebx, file       ; pointer to filename
	mov ecx, 2          ; don't know why, but you have to
	int 80h             ; call the function

	mov [fileid], eax

	;
	;I'm going to use Kernel Func 19 here
	mov eax, 19
	mov ebx, [fileid]
	mov ecx, 0
	mov edx, 2
	int 80h
	; I think I got it!!!
	mov [filesize], eax

	; reseting to beginning
	;I'm going to use Kernel Func 19 here
	mov eax, 19
	mov ebx, [fileid]
	mov ecx, 0
	mov edx, 0
	int 80h

	push dword[filesize]
	call malloc
	add esp, 4
	mov [names], eax

	mov ebx, [fileid]
	mov eax, 3          ; set the read function
	mov ecx, [names]    ; pointer to read data to
	mov edx, [filesize]       ; read xxx bytes
	int 80h             ; call the function

	mov ebx, arr        ; address of array of 50 pointers
	mov edx, 0          ; name counter

	mov al, 10
	mov ecx, [filesize]
	mov edi, [names]

	topwhile:
		cmp ecx, 0
		jna botwhile
		mov [ebx], edi
		add ebx, 4
		inc edx
		repne scasb
		jmp topwhile
	botwhile:
	mov [names_cnt], edx

	;push args, call qsort

	push my_cmp
	push 4
	push edx
	push arr
	call qsort
	add esp, 16

	; reseting to beginning
	;I'm going to use Kernel Func 19 here
	mov eax, 19
	mov ebx, [fileid]
	mov ecx, 0
	mov edx, 0
	int 80h

	mov esi, arr

	topfor:
		mov edi, [esi]
		mov al, 10
		mov ecx, -1
		repne scasb
		sub edi, [esi]

		mov eax, 4
		mov ebx, [fileid]
		mov ecx, [esi]
		mov edx, edi
		int 80h

		add esi, 4
		dec dword[names_cnt]
		jnz topfor
	botfor:



; STOP HERE
pop ebx
ret

[SECTION .bss]
arr resd 50
filesize resb 4
fileid resb 4
names resb 4
names_cnt resb 4

[SECTION .data]
file db 'names.txt',0

