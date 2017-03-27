[BITS 64]
;;; 	char *strpbrk(const char *haystack, const char *needle);
	SECTION .text
	GLOBAL	strpbrk:function

strpbrk:
	PUSH    RBP
	MOV     RBP, RSP
	XOR     RAX, RAX
	LEA     RCX, [RSI] ; save first address of needle

_loop:
	MOVZX   EDX, BYTE [RDI]
	CMP     EDX, 0
	JE      _end
	LEA     R8, [RDI] ; save address while advancing of haystack
	INC	RDI

_loop_rsi:
	MOVZX   EBX, BYTE [RSI]
	CMP	EBX, 0
	JE	_not_equal
	CMP	EDX, EBX
	JE	_equal
	INC	RSI
	JMP	_loop_rsi

_equal:
	LEA     RAX, [R8] ; give rax an address to the begining of *needle in haystack
	JMP     _end

_not_equal:
	LEA     RSI, [RCX] ; give back the first address of needle in rsi
	JMP     _loop

_end:
	MOV     RSP, RBP
	POP     RBP
	RET
