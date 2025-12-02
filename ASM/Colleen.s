; Outside comment

section .data
src: db "; Outside comment",10,10,\
"section .data",10,\
"src: db ",34,"; Outside comment",34,",10,10,",34,"section .data",34,",10,",34,"src: db ",34,34,"; Inside comment",34,34,",34,",34,"section .text",34,",10,",34,"global _start",34,",10,",34,"_start:",34,",10,",34,"    ; Inside comment",34,",10,",34,"    mov rsi, src",34,",10,",34,"    mov rdx, src_end - src",34,",10,",34,"    call print",34,",10,",34,"exit:",34,",10,",34,"    mov rax, 60",34,",10,",34,"    xor rdi, rdi",34,",10,",34,"    syscall",34,",10,",34,"print:",34,",10,",34,"    mov rax, 1",34,",10,",34,"    mov rdi, 1",34,",10,",34,"    syscall",34,",10,",34,"    ret",34
src_end:

section .text
global _start

_start:
    ; Inside comment
    mov rsi, src            ; pointer to source
    mov rdx, src_end - src  ; length
    call print
    jmp exit

exit:
    mov rax, 60
    xor rdi, rdi
    syscall

print:
    mov rax, 1
    mov rdi, 1
    syscall
    ret
