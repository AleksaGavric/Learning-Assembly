# *********************************************************************************
# * Description: Recursive fibonacci number calculator                            *
# *********************************************************************************

.text

prompt: .asciz "Please enter a number for the fibonacci calculator: "
fib: .asciz "%ld"

.global my_main
.global fibonacci

my_main:
        # prologue
        pushq %rbp
        movq  %rsp, %rbp
        movq  $0, %rax

        # print prompt for number
        leaq  prompt(%rip), %rdi
        movq  $0, %rax
        call  printf

        # reserve stack memory for a variable
        subq  $8, %rsp

        # read and store number
        leaq  -8(%rbp), %rsi
        leaq  fib(%rip), %rdi
        movq  $0, %rax
        call  scanf

        movq -8(%rbp), %rdi # add number as argument

        call fibonacci

        # print result
        movq  %rax, %rsi
        leaq  fib(%rip), %rdi
        movq  $0, %rax
        call  printf

        # epilogue
        movq  %rbp, %rsp
        movq  $0, %rax
        popq  %rbp
        ret

fibonacci:
        # prologue
        pushq %rbp
        movq  %rsp, %rbp
        movq  $0, %rax

        pushq %rcx #

        subq  $16, %rsp
        movq  %rdi, -16(%rbp)

        cmpq  $1, -16(%rbp) # n <= 1
        jg    recurse # if greater
        movq  -16(%rbp), %rax # returning the fib number
        jmp   then # jump to end

        # epilogue
        movq  %rbp, %rsp
        popq  %rbp
        ret


