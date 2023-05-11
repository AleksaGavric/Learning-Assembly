# *********************************************************************************
# * Description: Power function implementation                                    *
# *********************************************************************************

.text

string: .asciz "Base raised to power calculator\n"
base_prompt: .asciz "\nPlease enter a base: "
base: .asciz "%ld"
power_prompt: .asciz "Please enter a power: "
power: .asciz "%ld"
result: .asciz "%ld"

.global my_main
.global my_pow

# Algorithm: while exp != 0 get result*base and store into result, then decrement the exponent

my_main:
        # prologue
        pushq %rbp
        movq  %rsp, %rbp
        movq  $0, %rax

        # print intro prompt
        leaq  string(%rip), %rdi
        movq  $0, %rax
        call  printf

        # print base_prompt
        leaq  base_prompt(%rip), %rdi
        movq  $0, %rax
        call  printf
        
        # reserve stack memory for 2 variables
        subq  $16, %rsp

        # read and store base
        leaq  -8(%rbp), %rsi
        leaq  base(%rip), %rdi
        movq  $0, %rax
        call  scanf

        # print base_prompt
        leaq  power_prompt(%rip), %rdi
        movq  $0, %rax
        call  printf

        # read and store power
        leaq  -16(%rbp), %rsi
        leaq  power(%rip), %rdi
        movq  $0, %rax
        call  scanf
        
        movq -16(%rbp), %rsi # power
        movq -8(%rbp), %rdi # base

        call my_pow
        
        # print result
        movq  %rax, %rsi
        leaq  result(%rip), %rdi
        movq  $0, %rax
        call  printf

        # epilogue
        movq  %rbp, %rsp
        movq  $0, %rax
        popq  %rbp
        ret

my_pow:
        # prologue
        pushq %rbp
        movq  $0, %rax
        movq  %rsp, %rbp

        movq  $1, %rax # result

        jmp while

        # epilogue
        movq  %rbp, %rsp
        movq  $0, %rax
        popq  %rbp
        ret

while:
        cmpq  $0, %rsi # compare 0 to power
        je    then  # jump if equal
        mulq  %rdi # %rax implicit in multiplication
        decq  %rsi
        jmp   while
then:
        # epilogue
        movq  %rbp, %rsp
        popq  %rbp
        ret

        

        
