[BITS 64]
;;; 	void	*bcopy(void *src, const void *dest, size_t n);
	SECTION .text
	GLOBAL	bcopy:function

bcopy:
;;; 	PROLOG
	PUSH	RBP
	MOV	RBP, RSP

	MOV	RCX, RDX		; RCX = n
	TEST	RDX, RDX		; n = 0 ?
	JE	_end

_inc_loop:
	LEA	R8, [RDI]
	LEA	RDI, [RSI]
	LEA	RSI, [R8]
	CLD				; good old memcpy
	REP	MOVSB
	JMP	_end

_end:
;;; 	EPILOG
	MOV	RSP, RBP
	POP	RBP
	RET
