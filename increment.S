# *********************************************************************************
# * Description: Increment a number                                               *
# *********************************************************************************

.text

string: .asciz "Program to increment a number, through in intermediate function\n"
prompt: .asciz "Please enter a number to increment: "
number: .asciz "%ld"
answer: .asciz "%ld"

.global my_main                         
.global my_increment           

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

        call  inout

        # epilogue - clear the stack and return
        movq  %rbp, %rsp
        movq  $0, %rax
        popq  %rbp
        ret

inout:
        # prologue
        pushq %rbp
        movq  %rsp, %rbp

        # read input
        subq  $16, %rsp
        leaq  -8(%rbp), %rsi
        leaq  number(%rip), %rdi
        movq  $0, %rax
        call  scanf
        
        movq -8(%rbp), %rdi
        
        call my_increment

        movq  %rax, %rsi
        leaq  answer(%rip), %rdi
        movq  $0, %rax
        call  printf

        # epilogue
        movq  %rbp, %rsp
        movq  $0, %rax
        popq  %rbp
        ret

my_increment:
        # prologue
        pushq %rbp
        movq  %rsp, %rbp
        
        incq %rdi
        movq %rdi, %rax

        # epilogue
        movq  %rbp, %rsp
        popq  %rbp
        ret

