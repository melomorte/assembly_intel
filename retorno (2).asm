section .data

section .text

global _start

_start:
	mov eax, 1
	mov ebx, 2
	int 0x80

; equivalente em c
;int main(){
;	return (2);
;}