[BITS 64]
;;; 	void	*memcpy(void *dest, const void *src, size_t n);
	SECTION .text
	GLOBAL	memcpy:function

memcpy:
	PUSH	RBP
	MOV	RBP, RSP

	LEA	RAX, [RDI]		; RET = dest
	MOV	RCX, RDX		; RCX = n

_loop:
	CLD		   		; clear direction flag (forward)
	REP	MOVSB			; repeat (*dest)++ = (*src)++ RCX times

_end:
	MOV	RSP, RBP
	POP	RBP
	RET
