section .text

	global main
	extern fprintf, sprintf, fopen, fclose, system

main:
	push	rbp
	mov		rbp, rsp
	mov		r12, 5
	cmp		r12, 0
	jle		end
	sub		rsp, 16
	lea		rdi, [rel rsp]
	lea		rsi, [rel file]
	mov		rdx, r12
	call	sprintf wrt ..plt
	mov		rax, 2
	lea		rdi, [rel rsp]
	mov		rsi, 2
	syscall
	mov		rdx, 0
	cmp		rdx, rax
	jg		create_file
	dec		r12

create_file:
	sub		rsp, 16
	lea		rdi, [rel rsp]
	lea		rsi, [rel file]
	mov		rdx, r12
	call	sprintf wrt ..plt
	mov		rdi, rsp
	lea		rsi, [rel mode]
	call	fopen wrt ..plt
	push	rax
	mov		rdi, rax
	mov		rax, 0
	lea		rsi, [rel str]
	lea		rdx, [rel str]
	mov		rcx, 10
	mov		r8, 9
	mov		r9, 34
	push	r12
	call	fprintf wrt ..plt
	pop		rdi
	pop		rdi
	call	fclose wrt ..plt
	sub		rsp, 16
	lea		rdi, [rel rsp]
	lea		rsi, [rel bin]
	mov		rdx, r12
	call	sprintf wrt ..plt
	sub		rsp, 128
	lea		rdi, [rel rsp]
	lea		rsi, [rel command]
	lea		rdx, [rel rsp + 128]
	call	sprintf wrt ..plt
	lea		rdi, [rel rsp]
	call	system wrt ..plt

end:
	mov		rax, 0
	leave
	ret

section .data

str:
	db "section .text%2$c%2$c%3$cglobal main%2$c%3$cextern fprintf, sprintf, fopen, fclose, system%2$c%2$cmain:%2$c%3$cpush%3$crbp%2$c%3$cmov%3$c%3$crbp, rsp%2$c%3$cmov%3$c%3$cr12, %5$d%2$c%3$ccmp%3$c%3$cr12, 0%2$c%3$cjle%3$c%3$cend%2$c%3$csub%3$c%3$crsp, 16%2$c%3$clea%3$c%3$crdi, [rel rsp]%2$c%3$clea%3$c%3$crsi, [rel file]%2$c%3$cmov%3$c%3$crdx, r12%2$c%3$ccall%3$csprintf wrt ..plt%2$c%3$cmov%3$c%3$crax, 2%2$c%3$clea%3$c%3$crdi, [rel rsp]%2$c%3$cmov%3$c%3$crsi, 2%2$c%3$csyscall%2$c%3$cmov%3$c%3$crdx, 0%2$c%3$ccmp%3$c%3$crdx, rax%2$c%3$cjg%3$c%3$ccreate_file%2$c%3$cdec%3$c%3$cr12%2$c%2$ccreate_file:%2$c%3$csub%3$c%3$crsp, 16%2$c%3$clea%3$c%3$crdi, [rel rsp]%2$c%3$clea%3$c%3$crsi, [rel file]%2$c%3$cmov%3$c%3$crdx, r12%2$c%3$ccall%3$csprintf wrt ..plt%2$c%3$cmov%3$c%3$crdi, rsp%2$c%3$clea%3$c%3$crsi, [rel mode]%2$c%3$ccall%3$cfopen wrt ..plt%2$c%3$cpush%3$crax%2$c%3$cmov%3$c%3$crdi, rax%2$c%3$cmov%3$c%3$crax, 0%2$c%3$clea%3$c%3$crsi, [rel str]%2$c%3$clea%3$c%3$crdx, [rel str]%2$c%3$cmov%3$c%3$crcx, 10%2$c%3$cmov%3$c%3$cr8, 9%2$c%3$cmov%3$c%3$cr9, 34%2$c%3$cpush%3$cr12%2$c%3$ccall%3$cfprintf wrt ..plt%2$c%3$cpop%3$c%3$crdi%2$c%3$cpop%3$c%3$crdi%2$c%3$ccall%3$cfclose wrt ..plt%2$c%3$csub%3$c%3$crsp, 16%2$c%3$clea%3$c%3$crdi, [rel rsp]%2$c%3$clea%3$c%3$crsi, [rel bin]%2$c%3$cmov%3$c%3$crdx, r12%2$c%3$ccall%3$csprintf wrt ..plt%2$c%3$csub%3$c%3$crsp, 128%2$c%3$clea%3$c%3$crdi, [rel rsp]%2$c%3$clea%3$c%3$crsi, [rel command]%2$c%3$clea%3$c%3$crdx, [rel rsp + 128]%2$c%3$ccall%3$csprintf wrt ..plt%2$c%3$clea%3$c%3$crdi, [rel rsp]%2$c%3$ccall%3$csystem wrt ..plt%2$c%2$cend:%2$c%3$cmov%3$c%3$crax, 0%2$c%3$cleave%2$c%3$cret%2$c%2$csection .data%2$c%2$cstr:%2$c%3$cdb %4$c%1$s%4$c, 0%2$cfile:%2$c%3$cdb %4$cSully_%%d.s%4$c, 0%2$cmode:%2$c%3$cdb %4$cw%4$c, 0%2$cflag:%2$c%3$cdb %4$cR_OK%4$c, 0%2$cbin:%2$c%3$cdb %4$cSully_%%d%4$c, 0%2$ccommand:%2$cdb %4$cnasm -f elf64 %%1$s.s && gcc -no-pie %%1$s.o -o %%1$s && ./%%1$s ; rm -f Sully*.o%4$c, 0%2$c", 0
file:
	db "Sully_%d.s", 0
mode:
	db "w", 0
flag:
	db "R_OK", 0
bin:
	db "Sully_%d", 0
command:
db "nasm -f elf64 %1$s.s && gcc -no-pie %1$s.o -o %1$s && ./%1$s ; rm -f Sully*.o", 0
