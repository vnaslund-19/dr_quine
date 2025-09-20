NAME = dr_quine

.PHONY: all clean fclean re

all: $(NAME)

$(NAME):
	@make -C ./C
	@make -C ./ASM

clean:
	@make clean -C ./C
	@make clean -C ./ASM

fclean:
	@make fclean -C ./C
	@make fclean -C ./ASM

re:
	@make re -C ./C
	@make re -C ./ASM
