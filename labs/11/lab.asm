[SECTION .text]

global main

extern free
extern malloc

main:
push ebx
; START HERE

	mov eax, 5          ; set the open function
	mov ebx, file       ; pointer to filename
	mov ecx, 0          ; read-only
	int 80h             ; call the function

	mov [fileid], eax

	mov edi, head

	topwhile:
		push 34
		call malloc
		add esp, 4
		mov ebx, [fileid]
		mov ecx, eax      ; pointer to read data to
		mov eax, 3          ; set the read function
		mov edx, 30         ; read xxx bytes
		int 80h             ; call the function

		cmp eax, 30
		jnz botwhile

		mov [edi], ecx
		add ecx, 30
		mov edi, ecx
		jmp topwhile
	botwhile:

	push ecx
	call free
	add esp, 4
	mov dword[edi], 0

	mov edi, [head]

	sub esp, 30

	topdo:
		mov ebx, edi
		mov al, 2eh
		mov ecx, -1
		repne scasb
		sub edi, ebx
		mov ecx, edi
		mov edi, esp
		mov esi, ebx
		push ecx
		rep movsb

		inc esi
		mov edi, esi
		mov al, 20h
		mov ecx, -1
		repne scasb
		sub edi, esi
		dec edi
		mov ecx, edi
		mov edi, ebx
		rep movsb

		mov al, 2ch
		mov ah, 20h
		stosw
		
		pop ecx
		mov esi, esp
		rep movsb
		mov al, 0ah
		mov edi, ebx
		add edi, 29
		stosb
		
		mov edi, [ebx+30]
		cmp edi, 0
		jnz topdo
	botdo:
	
	add esp, 30

	mov eax, 8          ; set the open function
	mov ebx, newfile       ; pointer to filename
	mov ecx, 110100100b          ; don't know why, but you have to
	int 80h             ; call the function
	mov [fileid], eax

	mov ecx, [head]

	topout:
		mov ebx, [fileid]
		mov eax, 4          ; set the write function
		mov edx, 30         ; write xxx bytes
		int 80h             ; call the function

		mov ecx, [ecx+30]
		cmp ecx, 0
		jnz topout
	botout:






; STOP HERE
pop ebx
ret

[SECTION .bss]
fileid resb 4
head resb 4

[SECTION .data]
file db 'names.txt',0
newfile db 'output.txt',0


