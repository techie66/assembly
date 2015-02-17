[SECTION .text]

%macro printword 1
 push eax
 push ebx
 push ecx
 push edx
 jmp %%skip
 %%myword db %1
          db 20h
 %%skip:
 mov eax, 4
 mov ebx, 1
 mov ecx, %%myword
 mov edx, %%skip
 sub edx, %%myword
 int 80h
 
 pop edx
 pop ecx
 pop ebx
 pop eax
%endmacro

%macro printcode 1
 push eax
 push ebx
 push ecx
 push edx
 mov al, %1
 push eax
 mov eax, 4
 mov ebx, 1
 mov ecx, esp
 mov edx, 1
 int 80h
 add esp, 4
 pop edx
 pop ecx
 pop ebx
 pop eax
%endmacro

show0:
ret

show1:
printword 'one'
ret

show2:
printword 'two'
ret

show3:
printword 'three'
ret

show4:
printword 'four'
ret

show5:
printword 'five'
ret

show6:
printword 'six'
ret

show7:
printword 'seven'
ret

show8:
printword 'eight'
ret

show9:
printword 'nine'
ret

show10:
printword 'ten'
ret

show11:
printword 'eleven'
ret

show12:
printword 'twelve'
ret

show13:
printword 'thirteen'
ret

show14:
printword 'fourteen'
ret

show15:
printword 'fifteen'
ret

show16:
printword 'sixteen'
ret

show17:
printword 'seventeen'
ret

show18:
printword 'eighteen'
ret

show19:
printword 'nineteen'
ret

show20:
printword 'twenty'
ret

show30:
printword 'thirty'
ret

show40:
printword 'forty'
ret

show50:
printword 'fifty'
ret

show60:
printword 'sixty'
ret

show70:
printword 'seventy'
ret

show80:
printword 'eighty'
ret

show90:
printword 'ninety'
ret
