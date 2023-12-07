%include "io64.inc"

section .rodata
zero: dd 0
number: dd 6

section .text
global CMAIN
CEXTERN access5
CMAIN:
    push rbx
    mov rdi, 1
    cvtsi2ss xmm0, [zero]
    cvtsi2ss xmm2, [zero]
    cvtsi2sd xmm1, [number]
    call access5
    pop rbx
    xor rax, rax
    ret