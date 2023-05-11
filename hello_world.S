# *********************************************************************************
# * Description: Hello, World!                                                     *                                                           *
# *********************************************************************************

.global my_main 

to_print: .asciz "Hello, World!"

my_main:
    # prologue
    pushq %rbp
    movq %rsp, %rbp
    movq $0, %rax

    leaq to_print(%rip), %rdi # load eff address to_print
    call printf
    movq %rbp, %rsp

    # epilogue
    movq $0, %rax
    popq %rbp
    ret
