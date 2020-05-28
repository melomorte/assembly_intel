section .data

x dd 50	; dd - define dword
	 	; dd - define byte
	 	; dw - define word
	 	; dq - define qword
	 	; dt - define ten word

y dd 10
msg1 db "X maior que Y", 0xa
len1 equ $ - msg1

msg2 db "y maior que x", 0xa
len2 equ $ - msg2

section .text

global _start

_start:
	mov eax, DWORD[x]
	mov ebx, DWORD[Y]
	cmp eax, ebx
	jge maior
	mov edx, len2
	mov ecx, msg2
	jmp final
maior:
	mov edx, len1
	mov ecx, msg1
final:
	mov ebx, 1
	mov eax, 4
	int 0x80
	mov eax, 1
	int 0x80