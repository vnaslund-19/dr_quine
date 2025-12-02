; A single required comment

%define NL 10
%define QT 34
%define S  " grace_source "

section .data
grace_source: db "; A single required comment",NL,NL,\
"%define NL 10",NL,\
"%define QT 34",NL,\
"%define S  ",QT," grace_source ",QT,NL,NL,\
"section .data",NL,\
"grace_source: db ",QT,"; A single required comment",QT,",NL,NL,",QT,"%define NL 10",QT,",NL,",QT,"%define QT 34",QT,",NL,",QT,"%define S  ",QT," grace_source ",QT,",NL,NL,",QT,"section .data",QT,",NL,",QT,"grace_source: db ",QT,",QT,",QT,"; A single required comment",QT,",QT,",QT,",NL,NL,",QT,"%define NL 10",QT,",QT,",QT,",NL,",QT,"%define QT 34",QT,",QT,",QT,",NL,",QT,"%define S  ",QT," grace_source ",QT,",QT,",QT,",NL,NL,",QT,"section .data",QT,",QT",NL,\
"bytes_end:

section .text
global _start

_start:
    mov rax, 2              ; sys_open
    mov rdi, filename
    mov rsi, 577            ; O_CREAT | O_WRONLY | O_TRUNC
    mov rdx, 0644
    syscall

    mov r12, rax            ; save fd

    mov rax, 1              ; sys_write
    mov rdi, r12
    mov rsi, grace_source
    mov rdx, bytes_end - grace_source
    syscall

    mov rax, 3              ; sys_close
    mov rdi, r12
    syscall

    mov rax, 60             ; sys_exit
    xor rdi, rdi
    syscall

section .data
filename: db "Grace_kid.s", 0
