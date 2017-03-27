[BITS 64]
;;; 	int	strncmp(const char *s1, const char *s2, int n);
	SECTION	.text
	GLOBAL	strncmp:function

strncmp:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RAX, -1				; length = -1

_loop:
	MOVZX	R8D, BYTE [RDI]			; TMP *DEST BYTE
	MOVZX	R9D, BYTE [RSI]			; TMP *SRC BYTE
	CMP	R8D, R9D			; *DEST != *SRC
	JG 	_sup_end
	JL 	_end
	CMP 	BYTE [RDI], 0			; *DEST == '\0'
	JE 	_equal_end
	DEC	RDX
	CMP	RDX, 0
	JE	_equal_end
	INC     RDI				; DEST++
	INC     RSI				; SRC++
	JMP	_loop

_sup_end:
	INC	RAX

_equal_end:
	INC	RAX

_end:
	MOV	RSP, RBP
	POP	RBP
	RET
