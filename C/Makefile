# C/Makefile

CC      = clang
CFLAGS  = -Wall -Wextra -Werror

COLLEEN = Colleen
GRACE   = Grace
SULLY   = Sully

SRC_COLLEEN = Colleen.c
SRC_GRACE   = Grace.c
SRC_SULLY   = Sully.c

.PHONY: all clean fclean re

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(SRC_COLLEEN)
	$(CC) $(CFLAGS) $(SRC_COLLEEN) -o $(COLLEEN)

$(GRACE): $(SRC_GRACE)
	$(CC) $(CFLAGS) $(SRC_GRACE) -o $(GRACE)

$(SULLY): $(SRC_SULLY)
	$(CC) $(CFLAGS) $(SRC_SULLY) -o $(SULLY)

clean:
	@echo "Nothing to clean in /C (no object files)."

fclean: clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY)

re: fclean all
