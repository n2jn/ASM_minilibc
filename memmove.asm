[BITS 64]
;;; 	void	*memmove(void *dest, const void *src, size_t n);
	SECTION .text
	GLOBAL	memmove:function

memmove:
;;; 	PROLOG
	PUSH	RBP
	MOV	RBP, RSP

	MOV	RAX, RDI		; RET = dest
	MOV	RCX, RDX		; RCX = n
	TEST	RDX, RDX		; n = 0 ?
	JE	_end
	CMP	RSI, RDI		; (src > dest) ? (++) : (--)
	JA	_inc_loop
	DEC	RCX			; (n = 6) <=> from src[0] to src[5]
	JBE	_dec_loop

_dec_loop:
	CMP	RCX, -1
	JE	_end
	MOVZX	EDX, BYTE [RSI + RCX] 	; read from src[RCX]
	MOV	BYTE [RAX + RCX], DL	; write to dest[RCX]
	DEC	RCX			; RCX--
	JMP	_dec_loop

_inc_loop:
	CLD				; good old memcpy
	REP	MOVSB
	JMP	_end

_end:
;;; 	EPILOG
	MOV	RSP, RBP
	POP	RBP
	RET
