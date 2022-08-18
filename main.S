	.data

msg: 
	.ascii "Hello World!\n"
len 	= . - msg

	.text
	.globl _start

_start:
	@ init write(int fd, const void *buff, size_t count) parameters
	mov r0, #1	@ fd = 1 , stdout
	ldr r1, =msg	@ buff = msg 
	ldr r2, =len	@ count = len(msg)

	@ configure syscall write()
	mov r7, #4	@ r7 = 0x04 , for write() syscall
	swi #0		@ invoke syscall

	@ init exit(int status)
	mov r0, #0	@ return 0 , for exit()

	@ configure syscall exit()
	mov r7, #1	@ r7 = 1 , for exit() syscall
	swi #0		@ invoke syscall
