##
## Makefile for  in /home/valentin.collomb/Epitech/Year_2/Experiment/ASM/asm_bootstrap/Valentin
## 
## Made by Valentin Collomb
## Login   <valentin.collomb@epitech.net>
## 
## Started on  Tue Feb 28 17:43:35 2017 Valentin Collomb
## Last update Sun Mar 26 22:36:20 2017 Storm
##

RM		=	rm -f

ASM		=	nasm -f ELF64 -o

SRCS		=	strlen.asm \
			rindex.asm \
			strcmp.asm \
			strchr.asm \
			memmove.asm \
			strstr.asm \
			memset.asm \
			strncmp.asm \
			strpbrk.asm \
			memcpy.asm \
			strcasecmp.asm \
			strcspn.asm \
			memfrob.asm \
			memccpy.asm \
			bzero.asm \
			bcopy.asm

OBJS		=	$(SRCS:.asm=.o)

NAME		=	libasm.so

all:			$(NAME)

$(NAME):		$(OBJS)
			ar rc $(NAME) $(OBJS)
			ranlib $(NAME)
			chmod 0777 $(NAME)

%.o:			%.asm
			$(ASM) $@ $<

clean:
			$(RM) $(OBJS)

fclean:			clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:			all clean fclean re
