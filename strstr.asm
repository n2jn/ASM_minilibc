[BITS 64]
;;; 	char *strstr(const char *haystack, const char *needle);
	SECTION .text
	GLOBAL	strstr:function

strstr:
;;	PROLOG
	PUSH	RBP
	MOV	RBP, RSP

	XOR	RAX, RAX			; RET = NULL by default
	XOR	RDX, RDX			; haystack_i = 0
	XOR	RCX, RCX			; needle_i = 0
	JMP	_main_loop

_restore_save_haystack:
	INC	R10				; save_haystack += 1
	MOV	RDX, R10			; restore haystack_i to save_haystack

_main_loop:
	MOV	R10, RDX			; save_haystack = haystack_i   (also initializes save_haystack the 1st time)
	MOVZX	R8, BYTE [RDI + RDX]
	MOVZX	R9, BYTE [RSI + RCX]
	CMP	R9, 0				; *needle == '\0' <=> needle_found, so it's finished
	JE	_return_save_haystack
	CMP	R8, 0				; *haystack == '\0' <=> haystack finished so needle isn't found
	JE	_end

_match_loop:
	MOVZX	R8, BYTE [RDI + RDX]
	MOVZX	R9, BYTE [RSI + RCX]
	CMP	R9, 0				; *needle == '\0' <=> needle_found, so it's finished
	JE	_return_save_haystack
	CMP	R8, 0				; *haystack == '\0' <=> haystack finished so needle isn't found
	JE	_end
	CMP	R8, R9				; *haystack != *needle <=> continue to search from (save_haystack + 1)
	JNE	_restore_save_haystack
	INC	RDX				; ++haystack_i
	INC	RCX				; ++needle_i
	JMP	_match_loop

_return_save_haystack:
	LEA	RAX, [RDI + R10]		; RET = (haystack + save_haystack)

_end:
;;	EPILOG
	MOV     RSP, RBP
	POP     RBP
	RET
