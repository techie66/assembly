[SECTION .text]

[BITS 16]

[ORG 100H]

mov ax, 0a000h
mov es, ax
mov ds, ax
mov ah, 0   ;use function 0 of Interrupt 10H to change video mode 
mov al, 13h ;new video mode
int 10h     ;do it

;draw the 4x4 grid of tiles
mov ax, 1
mov bx, 31
mov cx, 4
outer:
push cx
mov cx, 4
mov si, 80
inner:
push ax
push si
push bx
call drawtile
add sp, 6
add si, 40
inc ax
loop inner
pop cx
add bx, 31
loop outer
;end of 4x4 draw

call numbers

mov ax, 0 ;for int 33h, function # must be in ax
int 33h   ;init the mouse
mov ax, 1 ;function 1
int 33h   ;show the mouse pointer
event:
call getmouse
cmp ax, 2
je quit
;inbounds test
cmp cx, 240
jae badchoice
cmp cx, 80
jb badchoice
cmp dx, 31
jb badchoice
cmp dx, 155
jae badchoice
 ;adjacent logic below
 ; abs(blankrow minus dx) + abs(blankcol minus cx)>40 is no go
mov ax, dx
sub ax, [cs:blankrow]  ;uses ds without cs override
cmp ax, 0
jg ok1
 neg ax
ok1:
mov bx, cx
sub bx, [cs:blankcol]
cmp bx, 0
jg ok2
neg bx
ok2:
add ax, bx
cmp ax, 40
ja badchoice

push cx
push dx
push word [cs:blankcol]
push word [cs:blankrow]

mov ax, 2  ;function 2
int 33h    ;hide mouse pointer
call movetile
add sp, 8
mov [cs:blankcol], cx
mov [cs:blankrow], dx
mov ax, 1  
int 33h    ;reshow mouse pointer
badchoice:
jmp event

quit:
mov ah, 0
mov al, 3
int 10h  ;reset to default text mode 3

mov ah, 4ch  
int 21h      ;exit to the operating system, DOS        

%include "lab14fns.asm"

numbers:
push ax
push bx
push cx
push dx
push di

;start of 15 second digits
mov di, 15
topfor:
mov ah, 2
mov bh, 0
mov dh, [cs:row]
mov dl, [cs:col]
int 10h   ;function 2 positions cursor

mov ah, 0ah
mov al, [cs:asc]
mov bh, [cs:bkcol]
mov bl, [cs:forcol]
mov cx, 1
int 10h   ;function 0ah writes al character at cursor

inc byte [cs:bkcol]
inc byte [cs:asc]
cmp byte [cs:asc], 39h
jbe ok
mov byte [cs:asc], 30h
ok:
add byte [cs:col], 5
cmp byte [cs:col], 32
jne skip
mov byte [cs:col], 12
add byte [cs:row], 4
skip:
dec di
jnz topfor

;start of 6 double-digit completions
mov byte [cs:row], 13 ;14
mov byte [cs:col], 16
mov byte [cs:bkcol], 10
mov byte [cs:asc], 31h
mov di, 6

topfor2:
mov ah, 2
mov bh, 0
mov dh, [cs:row]
mov dl, [cs:col]
int 10h

mov ah, 0ah
mov al, [cs:asc]
mov bh, [cs:bkcol]
mov bl, [cs:forcol]
mov cx, 1
int 10h

inc byte [cs:bkcol]
add byte [cs:col], 5
cmp byte [cs:col], 31
jne skip2
mov byte [cs:col], 11
add byte [cs:row], 4
skip2:
dec di
jnz topfor2

pop di
pop dx
pop cx
pop bx
pop ax
ret

[SECTION .data]
row db 5
col db 12
bkcol db 1
asc db 31h
forcol db 15
blankrow dw 124 
blankcol dw 200

