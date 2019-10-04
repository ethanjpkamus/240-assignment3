;Author: Ethan Kamus
;Email: ethanjpkamus@csu.fullerton.edu

global assignment3
extern scanf
extern printf
extern getchar

segment .data

	welcome db "We will compute the mean for you using only integers",10,0
	inputprompt db "Enter integers separated by white space. After the last input, press Control + D",10,0

	numcount db "The number of integers you entered: %ld",10,0
	meancalc db "The mean of these integers: %ld",10,0

	continue db "do you have more sets of integers? (y or n)",10,0

	goodbye db "The assembly file will now close",10,0

	integerformat db "%ld"
	stringformat db "%s"

segment .bss
;empty

segment .text

assignment3:

;to make counter, use a general purpose register to store the number of numbers input

	push       rbp
	mov	    rbp, rsp

	push       rbx
	push       rcx
	push       rdx
	push       rsi
	push       rdi
	push       r8
	push       r9
	push       r10
	push       r11
	push       r12
	push       r13
	push       r14
	push       r15

;===== print welcome statement =================================================

	mov qword  rax, 0
	mov 	    rdi, stringformat 	;"%s"
	mov	    rsi, welcome
	call 	    printf

;===== beginning of loop =======================================================

beginloop:

;===== print input prompt ======================================================

	mov qword  rax, 0
	mov	    rdi, stringformat 	;"%s"
	mov	    rsi, inputprompt
	call	    printf

;===== get user input ==========================================================

	mov        r15, 0			;counter
	mov	    r14, 0			;sum

inputloop:


	push qword 0
	mov qword  rax, 0
	mov 	    rdi, integerformat
	mov        rsi, rsp
	call 	    scanf

	cdqe
	pop	    r13			;store current number

	add	    r14, r13
	inc	    r15

	;check for cntl + D

	cmp        rax, -1
	jne	    inputloop



;===== output number of integers input =========================================

	mov qword  rax, 0
	mov 	    rdi, numcount		;the number of...
	mov	    rsi, r15
	call	    printf

;===== output mean of integers =================================================

	;do division
	mov        rax, r14
	cqo
	idiv	    r15
	mov        r13, rax

	mov qword  rax, 0
	mov	    rdi, meancalc		;the mean of the integers...
	mov 	    rsi, r13
	call	    printf

;===== ask user if they want to continue =======================================

	mov qword  rax, 0
	mov 	    rdi, stringformat
	mov        rsi, continue
	call       printf

;===== check what the user input ===============================================

	mov        rax, 0
	call       getchar
	cmp        rax, 121
	je	    beginloop

;===== print closing statements ================================================

	mov qword  rax, 0
	mov 	    rdi, stringformat
	mov        rsi, goodbye
	call printf

;===== restore registers =======================================================

	mov	    rax, r13

	pop 	    r15
	pop	    r14
	pop        r13
	pop        r12
	pop        r11
	pop        r10
	pop        r9
	pop        r8
	pop        rdi
	pop        rsi
	pop        rdx
	pop        rcx
	pop        rbx
	pop        rbp

	ret
