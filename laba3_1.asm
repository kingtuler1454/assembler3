; библиотека для макросов SASM
%include "io64.inc"  
section .rodata
    arr_length_str: db "Array length: ", 0
    arr_fill_str: db "--Array fill--", 10, 0
    arr_filled_str: db "--Array filled--", 10, 0
    input_size: db "%d", 0
    output_size: db "%d", 10, 0
    elem_str: db "elem of array: %d", 10, 0

section .text
    global main
    extern malloc
    extern free
    extern printf
    extern scanf
    
    main:
        mov rbp, rsp
        push rbp 
        mov rdi, arr_length_str
        call printf
        mov rdi, input_size
        mov rsi, r12 
        call scanf
        mov rbx, rsi 
        mov rdi, output_size
        call printf
        mov rdi, arr_fill_str
        call printf
        mov rdi, rbx 
        imul rdi, 4 
        call malloc
        mov rbp, rax 
        xor r15, r15
        .fill_loop:
            cmp r15, rbx  
            je .end_loop
            mov rdi, input_size
            lea rsi, [rbp+4*r15]                       
            call scanf
            mov rdi, elem_str 
            mov rsi, [rbp+4*r15] 
            call printf
            add r15, 1 
            jmp .fill_loop  
        .end_loop:
            mov rdi, arr_filled_str
            call printf
            mov rdi, rbp
            call free
            pop rbp
            xor rax, rax
            ret