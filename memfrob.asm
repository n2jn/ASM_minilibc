[BITS 64]
	;; void	*memfrob(void *s, size_t n)
	SECTION	.text
	GLOBAL	memfrob:function

memfrob:
;; 	PROLOG
	PUSH	RBP
	MOV	RBP, RSP

	LEA	RAX, [RDI]
	XOR	RCX, RCX		; counter = 0

_loop:
	CMP	RCX, RSI		; counter == n ?
	JE	_end
	XOR	BYTE [RDI + RCX], 42	
	INC	RCX			; ++counter
	JMP	_loop

_end:
;;	EPILOG
	MOV	RSP, RBP
	POP	RBP
