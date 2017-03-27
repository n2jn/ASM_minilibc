[BITS 64]
;;;	void	*memccpy(void *dest, const void *src, int c, size_t n);
	SECTION	.text
	GLOBAL	memccpy:function

memccpy:
	PUSH	RBP
	MOV	RBP, RSP

	XOR	RAX, RAX		; RET = NULL by default
	XOR	R8, R8			; index = 0

_loop:
	CMP	R8, RCX			; index == n ?
	JE	_end
	MOVZX	R9, BYTE [RSI + R8]
	CMP	R9B, DL			; c encountered ?
	JE	_match
	MOV	BYTE [RDI + R8], R9B
	INC	R8			; ++index
	JMP	_loop

_match:
	LEA	RAX, [RDI + R8 + 1]

_end:
	MOV	RSP, RBP
	POP	RBP
	RET
