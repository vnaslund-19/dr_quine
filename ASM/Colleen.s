section .text

	global main
	extern printf
	; Outside comment

main:
	; Inside comment
	push	rbp
	mov		rbp, rsp
	lea		rdi, [rel str]
	lea		rsi, [rel str]
	mov		rdx, 10
	mov		rcx, 9
	mov		r8, 34
	call	printf wrt ..plt
	mov		rax, 0
	leave
	ret

section .data

str:
	db "section .text%2$c%2$c%3$cglobal main%2$c%3$cextern printf%2$c%3$c; Outside comment%2$c%2$cmain:%2$c%3$c; Inside comment%2$c%3$cpush%3$crbp%2$c%3$cmov%3$c%3$crbp, rsp%2$c%3$clea%3$c%3$crdi, [rel str]%2$c%3$clea%3$c%3$crsi, [rel str]%2$c%3$cmov%3$c%3$crdx, 10%2$c%3$cmov%3$c%3$crcx, 9%2$c%3$cmov%3$c%3$cr8, 34%2$c%3$ccall%3$cprintf wrt ..plt%2$c%3$cmov%3$c%3$crax, 0%2$c%3$cleave%2$c%3$cret%2$c%2$csection .data%2$c%2$cstr:%2$c%3$cdb %4$c%1$s%4$c, 0%2$c", 0
