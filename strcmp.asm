[BITS 64]
;;; 	int	strcmp(const char *s1, const char *s2);
	SECTION	.text
	GLOBAL	strcmp:function

strcmp:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RAX, -1				; length = -1

_loop:
	MOVZX	EDX, BYTE [RDI]			; TMP *DEST BYTE
	MOVZX	ECX, BYTE [RSI]			; TMP *SRC BYTE
	CMP	EDX, ECX			; *DEST != *SRC
	JG 	_sup_end
	JL 	_end
	CMP 	BYTE [RDI], 0			; *DEST == '\0'
	JE 	_equal_end
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
