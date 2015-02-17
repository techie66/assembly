[SECTION .text]

[BITS 16]

[ORG 100H]

main:

mov ax, 0a000h
mov es, ax

x:
mov ah, 0
mov al, 12h
int 10h

mov dx, 3ceh
mov ax,0205h
out dx, ax

mov ax, 1803h
;out dx, ax

mov word [r], 0
topwhile1:
cmp word [r], 480
jne stay
jmp out1
stay:
mov word [c], 0
fild word [r]
fidiv word [for79]
fmul qword [h]
fadd qword [beta]
fst qword [y0]
topwhile2:
cmp word [c], 640
je out2
fild word [c]
fidiv word [six39]
fmul qword [w]
fadd qword [alpha]
fst qword [x0]
mov cx, 0
toprepeat:
fld st0
fld st2
fmulp st1, st0
fimul word [two]
fadd qword [y0]
fstp st3
fld st0
fmulp st1, st0
fxch
fld st0
fmulp st1, st0 
fsubp st1, st0
fadd qword [x0]
inc cx
cmp cx, 511
je skipdraw
fld st0
fld st0
fmulp st1, st0
fld st2
fld st0
fmulp st1, st0
faddp st1, st0 
fsub qword [point5]
fistp word [radius]
cmp word [radius], 4
jl toprepeat
shr cx, 4
inc cx
push cx
push word [c]
push word [r]
call set_pix
add sp, 6
skipdraw:
inc word [c]
fstp st0
fstp st0
fld qword [y0]
jmp topwhile2
out2:
fstp st0
inc word [r]
jmp topwhile1
out1:
mov ax, 0
int 33h
mov ax, 1
int 33h
y: 
push word boxcoord
call get_box
add sp, 2
cmp ax, 2
jne good
jmp alldun
good:
mov ax, [boxcoord]
cmp ax, [boxcoord+4]
je y
jb ok1
push word [boxcoord+4]
mov [boxcoord+4], ax
pop word [boxcoord]
ok1:
mov ax, [boxcoord+2]
cmp ax, [boxcoord+6]
je y
jb ok2
push word [boxcoord+6]
mov [boxcoord+6], ax
pop word [boxcoord+2]
ok2:
fild word [boxcoord]
fidiv word [six39]
fmul qword [w]
fadd qword [alpha]
fstp qword [alpha]

fild word [boxcoord+2]
fidiv word [for79]
fmul qword [h]
fadd qword [beta]
fstp qword [beta]

fild word [boxcoord+4]
fisub word [boxcoord]
fidiv word [six39]
fmul qword [w]
fstp qword [w]

fild word [boxcoord+6]
fisub word [boxcoord+2]
fidiv word [for79]
fmul qword [h]
fstp qword [h]

;clear boxes starts here

;clear boxes ends here

mov ax, [boxcoord+4]
sub ax, [boxcoord]
push ax
mov ax, [boxcoord+6]
sub ax, [boxcoord+2]
push ax
push word [boxcoord]
push word [boxcoord+2]
call draw_box
add sp, 8

mov ah, 1 
int 21h
jmp x

alldun:
mov dx, 3ceh
mov ax, 0005h
out dx, ax
mov ax, 0ff08h
out dx, ax
mov ax, 0003h
out dx, ax

mov ah, 0
mov al, 3
int 10h
mov ah, 4ch
int 21h

%macro config_vga 2
push ax
push dx
mov dx, 3ceh
mov ah, %2
mov al, 8
out dx, ax
mov al, [es:%1]
pop dx
pop ax
%endmacro
%include "funcs15z.asm"
[SECTION .bss]
r resw 1
c resw 1
radius resw 1
x0 resq 1
y0 resq 1
boxcoord resw 4

[SECTION .data]
for79 dw 479
h dq -2.4
beta dq 1.2
six39 dw 639
w dq 3.2
alpha dq -2.0
two dw 2
point5 dq 0.5
 
