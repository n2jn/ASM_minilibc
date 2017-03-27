[BITS 64]
;;; 	void	bzero(void *s, size_t n);
	SECTION	.text
	GLOBAL	bzero:function

bzero:
	PUSH	RBP
	MOV	RBP, RSP

_loop:
	CMP	RSI, 0
	JE	_end
	MOV	BYTE [RDI], 0
	INC	RDI
	DEC	RSI
	JMP	_loop

_end:
	MOV	RSP, RBP
	POP	RBP
	RET
