[BITS 64]
;;; 	size_t	strlen(const char *s);
	SECTION .text
	GLOBAL	strlen:function

strlen:
	PUSH	RBP
	MOV	RBP, RSP
	XOR	RAX, RAX			; length = 0

_loop:
	CMP	BYTE [RDI + RAX * 1], 0		; end of string ?
	JE	_end
	INC	RAX				; length++
	JMP	_loop

_end:
	MOV	RSP, RBP
	POP	RBP
	RET
