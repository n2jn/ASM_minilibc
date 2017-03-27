[BITS 64]
;;; 	char *strchr(const char *s, int c);
	SECTION .text
	GLOBAL	strchr:function

strchr:
	PUSH    RBP
	MOV     RBP, RSP

	XOR     RAX, RAX

_loop:
	MOVZX   EDX, BYTE [RDI]
	LEA     R8, [RDI] 		; save address while advancing of s
	INC     RDI			; increment s
	CMP     EDX, ESI		; compare to c
	JE	_equal
	CMP     EDX, 0
	JE      _end
	JMP	_loop

_equal:
	LEA     RAX, [R8] 		; give rax an address to the begining \
					; of the c in s
	JMP	_end

_end:
	MOV     RSP, RBP
	POP     RBP
	RET
