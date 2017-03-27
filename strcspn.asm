[BITS 64]
;;; 	size_t strcspn(const char *s, const char *reject)
	SECTION .text
	GLOBAL	strcspn:function

strcspn:
	PUSH    RBP
	MOV     RBP, RSP
	XOR     RAX, RAX
	LEA     RCX, [RSI]		; save first address of reject

_loop:
	MOVZX   EDX, BYTE [RDI]
	CMP     EDX, 0
	JE      _end
	INC     RDI

_loop_rsi:
	MOVZX   EBX, BYTE [RSI]
	CMP     EBX, 0
	JE      _not_equal
	CMP     EDX, EBX		; compare all *reject with a byte of s
	JE      _end
	INC     RSI
	JMP     _loop_rsi

_not_equal:
	LEA     RSI, [RCX]		; give back the first address of reject in rsi
	INC	RAX
	JMP     _loop

_end:
	MOV     RSP, RBP
	POP     RBP
	RET
