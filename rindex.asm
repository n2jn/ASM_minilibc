[BITS 64]
;;; 	char	*rindex(const char *s, int c);
	SECTION .text
	GLOBAL	rindex:function

rindex:
;;; 	PROLOG
	PUSH	RBP
	MOV	RBP, RSP

	XOR	RAX, RAX			; RET = 0
	XOR	RCX, RCX			; index = 0
	MOV	RBX, -1				; save_index = -1

_loop:
	CMP	BYTE [RDI + RCX], 0 		; end of string
	JE	_end_str
	CMP	BYTE [RDI + RCX], SIL		; *s match c ?
	JE	_save_match
	INC	RCX				; index++
	JMP	_loop

_save_match:
	MOV	RBX, RCX			; save_index = index
	INC	RCX				; index++
	JMP	_loop

_end_str:
	CMP	BYTE [RDI + RCX], SIL		; match on last byte ('\0') ?
	JE	_end_lastmatch
	CMP	RBX, -1				; did it match once ?
	JNE	_end_match
	JMP	_end

_end_lastmatch:
	MOV	RBX, RCX			; RET = save_index

_end_match:
	LEA	RAX, [RDI + RBX] 		; RET = &(s[index])

_end:
;;; 	EPILOG
	MOV	RSP, RBP
	POP	RBP
	RET
