# *********************************************************************************
# * Description: Recursive factorial number calculator                            *
# *********************************************************************************

.text

string: .asciz "Factorial\n"
prompt: .asciz "Please enter a number for the factorial: "
factorial_num: .asciz "%ld"

# Algorithm: if n < 1 return 1 else return n * factorial(n - 1)

.global my_main
.global factorial

my_main:
        # prologue - set up the stack frame, clear %rax
        pushq %rbp
        movq  %rsp, %rbp
        movq  $0, %rax

        # print message
        leaq  string(%rip), %rdi
        movq  $0, %rax
        call  printf

        # print the user prompt
        leaq  prompt(%rip), %rdi
        movq  $0, %rax
        call  printf

        # read input
        subq  $16, %rsp
        leaq  -8(%rbp), %rsi
        leaq  factorial_num(%rip), %rdi
        movq  $0, %rax
        call  scanf
    
        # load number as function argument
        movq -8(%rbp), %rdi

        call  factorial
    
        # print the result
        movq  %rax, %rsi
        leaq  factorial_num(%rip), %rdi
        movq  $0, %rax
        call  printf

        # epilogue - clear the stack and return
        movq  %rbp, %rsp
        movq  $0, %rax
        popq  %rbp
        ret

factorial:
        # prologue
        pushq %rbp
        movq  %rsp, %rbp
        movq  $0, %rax

        subq  $16, %rsp # reserve memory to store the entered number
        movq  %rdi, -8(%rbp) # store the factorial number

        cmpq  $1, -8(%rbp) # check if n < 1
            # n >= 1
            jge   recursion # jump to recursive part if greater than or equal to 1
            # n < 1
            movq  $1, %rax # put 1 into return
            jmp   then

        # epilogue
        movq  %rbp, %rsp
        popq  %rbp
        ret

recursion:
        movq  -8(%rbp), %rax # load n into the rax
        decq  %rax # decrement it
        movq  %rax, %rdi # load it into argument for factorial

        call  factorial

        mulq  -8(%rbp) # multiply result (%rax) with n
then:
        # epilogue
        movq  %rbp, %rsp
        popq  %rbp
        # rax holds the result of factorial
        ret




        

        

 
