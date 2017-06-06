
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
