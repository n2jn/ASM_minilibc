[BITS 64]
	SECTION .text
	GLOBAL	strcasecmp:function

strcasecmp:
	PUSH	RBP
	MOV	RBP, RSP

	XOR	RAX, RAX

_loop:
	MOVZX	EDX, BYTE [RDI]		; take first 8 bit (char) of src
	MOVZX	ECX, BYTE [RSI]		; take first 8 bit (char) of dest
	INC	RDI			; src++
	INC	RSI			; dest++

_edx_upper_to_lower:
	CMP	EDX, 0
	JE	_ebx_upper_to_lower
	CMP	EDX, 91
	JGE	_ebx_upper_to_lower
	ADD	EDX, 32			; *src + 32

_ebx_upper_to_lower:
	CMP	ECX, 0
	JE	_end
	CMP	ECX, 91
	JGE	_cmp
	ADD	ECX, 32			; *dest + 32

_cmp:
	CMP	EDX, ECX		; *src == *dest
	JE	_loop

_end:
	SUB	EDX, ECX		; *src - *dest
	MOV	EAX, EDX

	MOV	RSP, RBP
	POP	RBP
	RET
