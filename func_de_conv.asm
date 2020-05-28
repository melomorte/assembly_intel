section .data
	v1 dw '777', 0xa

section .bss
	buffer: resb 10

section .text

global _start

_start:
	call conversor
	call print_valor
_final:
	mov eax, 1
	mov ebx, 0
	int 0x80
conversor:
	lea esi, [v1]
	mov ecx, 3
	call string_int
	mov eax, [v1]
	sub eax, '0'
	add eax, 1
	ret
print_valor:
	lea esi, [buffer]
	call int_string
	mov eax, 4
	mov ecx, buffer
	mov ebx, 1
	mov edx, 10
	int 0x80
	ret
String_int:
	xor ebx, ebx
.prox_digit
	movzx eax, byte[esi]
	inc esi
	sub al. '0'
	imul ebx, 10
	add ebx, eax
	loop .prox_digit
	mov eax, ebx
	ret
int_string:
	add esi, 9
	mov byte[esi], 0
	mov ebx, 10
	prox_digit:
	xor edx, edx
	div ebx
	add dl, '0'
	dec esi
	mov [esi], dl
	test eax, eax
	jmz .prox_digit:
	mov eax, esi
	ret