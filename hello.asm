section .data:
	msg db 'heey melomorte!' 0xa
	len equ $ - msg


section .text:

global _start


_start:
	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mox eax, 4
	int 0x80

	mov eax, 1
	mov ebx, 0
	int 0x80