%define OUTFILE "Grace_kid.s"
%define CODE "%%define OUTFILE %3$cGrace_kid.s%3$c%1$c%%define CODE %3$c%4$s%3$c%1$c%%define FN main%1$c%1$cextern fprintf%1$cextern fopen%1$cextern fclose%1$c; 42%1$csection .data%1$c%2$ccode db CODE, 0%1$c%2$coutfile db OUTFILE, 0%1$c%2$cmode db %3$cw%3$c, 0%1$c%2$cfileptr db 0%1$c%1$csection .text%1$c%2$cglobal FN%1$c%1$cFN:%1$c%2$cpush rbp%1$c%2$cmov rbp, rsp%1$c%1$c%2$cmov rdi, outfile%1$c%2$cmov rsi, mode%1$c%2$ccall fopen%1$c%1$c%2$cmov [fileptr], rax%1$c%1$c%2$cmov rdi, [fileptr]%1$c%2$cmov rsi, code%1$c%2$cmov rdx, 0x0A%1$c%2$cmov rcx, 0x09%1$c%2$cmov r8, 0x22%1$c%2$cmov r9, code%1$c%2$ccall fprintf%1$c%1$c%2$cmov rdi, [fileptr]%1$c%2$ccall fclose%1$c%1$c%2$cleave%1$c%2$cret"
%define FN main

extern fprintf
extern fopen
extern fclose
; 42
section .data
	code db CODE, 0
	outfile db OUTFILE, 0
	mode db "w", 0
	fileptr db 0

section .text
	global FN

FN:
	push rbp
	mov rbp, rsp

	mov rdi, outfile
	mov rsi, mode
	call fopen

	mov [fileptr], rax

	mov rdi, [fileptr]
	mov rsi, code
	mov rdx, 0x0A
	mov rcx, 0x09
	mov r8, 0x22
	mov r9, code
	call fprintf

	mov rdi, [fileptr]
	call fclose

	leave
	ret