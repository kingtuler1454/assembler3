%include "io64.inc"

section .rodata
a2: dq 7FEFFFFFFEFFFFFFh
a3: dq 0.0
a1: dd 6, 6
section .text
global CMAIN

CEXTERN _ZN6medium4var56accessEfiNS0_1SE

CMAIN:
    mov rbp, rsp; for correct debugging
    push rbx
    mov edi, 6312

    mov rsi, [a1]
    
    movsd xmm0, [a2]
    mulsd xmm0, xmm0
    movsd xmm1, xmm0
    
    movsd xmm0, [a3]
    
    call _ZN6medium4var56accessEfiNS0_1SE
    pop rbx
    xor rax, rax
    ret