[BITS 64]
;;; 	void	*memset(void *s, int c, size_t n);
	SECTION .text
	GLOBAL	memset:function

memset:
;;; 	PROLOG
	PUSH	RBP
	MOV	RBP, RSP
	LEA	RAX, [RDI]				; RET = s

_loop:
	TEST	RDX, RDX				; n == 0 ?
	JE	_end
	MOV	BYTE [RDI], SIL				; Copy c to s[i]
	DEC	RDX					; n--
	INC	RDI					; i++
	JMP	_loop

_end:
;;; 	EPILOG
	MOV	RSP, RBP
	POP	RBP
	RET
