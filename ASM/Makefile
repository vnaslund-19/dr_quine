NASM    = nasm
LD      = gcc
NASMFLAGS = -f elf64

COLLEEN = Colleen
GRACE   = Grace
SULLY   = Sully

SRC_COLLEEN = Colleen.s
SRC_GRACE   = Grace.s
SRC_SULLY   = Sully.s

OBJ_COLLEEN = $(SRC_COLLEEN:.s=.o)
OBJ_GRACE   = $(SRC_GRACE:.s=.o)
OBJ_SULLY   = $(SRC_SULLY:.s=.o)

.PHONY: all clean fclean re

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(OBJ_COLLEEN)
	$(LD) $(OBJ_COLLEEN) -o $(COLLEEN)

$(GRACE): $(OBJ_GRACE)
	$(LD) $(OBJ_GRACE) -o $(GRACE)

$(SULLY): $(OBJ_SULLY)
	$(LD) $(OBJ_SULLY) -o $(SULLY)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	@rm -f *.o

fclean: clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY)

re: fclean all
