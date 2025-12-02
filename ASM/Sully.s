; i = 5

%define NL 10
%define QT 34
%define I 5

section .data

src: db "; i = %d",NL,NL,\
"%define NL 10",NL,\
"%define QT 34",NL,\
"%define I %d",NL,NL,\
"section .data",NL,NL,\
"src: db ",QT,"; i = %d",QT,",NL,NL,",QT,"%define NL 10",QT,",NL,",QT,"%define QT 34",QT,",NL,",QT,"%define I %d",QT,",NL,NL,",QT,"section .data",QT,",NL,NL,",QT,"src: db ",QT,",QT,",QT,"; i = %d",QT,",QT,",QT,",NL,NL,",QT,"%define NL 10",QT,",QT,",QT,",NL,",QT,"%define QT 34",QT,",QT,",QT,",NL,",QT,"%define I %d",QT,",QT",NL,\
"section .text",NL,\
"global _start",NL,NL,\
"_start:",NL,\
"    ; entry",NL,\
"    mov rax, 2",NL,\
"    mov rdi, filename",NL,\
"    mov rsi, 577",NL,\
"    mov rdx, 0644",NL,\
"    syscall",NL,\
"    mov r12, rax",NL,\
"    mov rax, 1",NL,\
"    mov rdi, r12",NL,\
"    mov rsi, src",NL,\
"    mov rdx, src_end - src",NL,\
"    syscall",NL,\
"    mov rax, 3",NL,\
"    mov rdi, r12",NL,\
"    syscall",NL,\
"    mov rax, 60",NL,\
"    xor rdi, rdi",NL,\
"    syscall",NL\
src_end:

section .data
filename: db "Sully_", I + 48, ".s", 0

section .text
global _start

_start:
    ; entry
    mov rax, I
    cmp rax, 0
    jl exit_program

    ; write next source
    mov rax, 2
    mov rdi, filename
    mov rsi, 577
    mov rdx, 0644
    syscall
    mov r12, rax

    mov rax, 1
    mov rdi, r12
    mov rsi, src
    mov rdx, src_end - src
    syscall

    mov rax, 3
    mov rdi, r12
    syscall

    ; prepare next assembly filename
    mov rbx, I
    sub rbx, 1
    add rbx, 48
    mov byte [filename+6], bl

    ; assemble next
    mov rax, 59
    mov rdi, cmd_as
    mov rsi, args_as
    xor rdx, rdx
    syscall

    ; run next
    mov rax, 59
    mov rdi, cmd_run
    mov rsi, args_run
    xor rdx, rdx
    syscall

exit_program:
    mov rax, 60
    xor rdi, rdi
    syscall

section .data

cmd_as: db "/usr/bin/nasm",0
args_as: dq filename, "-f", "elf64", "-o", "Sully_",0

cmd_run: db "/usr/bin/gcc",0
args_run: dq filename, "-o", filename, 0
