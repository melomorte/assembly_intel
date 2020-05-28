section .data
	v1 dw '5', 0xa

section .text

global _start

_start:
	call conversor
	mov ecx, v1
	call print_valor
_final:
	mov eax, 1
	mov ebx, 0
	int 0x80
conversor:
	mov eax, [v1]
	sub eax, '0'
	add eax, 1
	add eax, '0'
	mov [v1], eax
	ret
print_valor:
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	int 0x80
	ret