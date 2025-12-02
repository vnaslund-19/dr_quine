NASM = nasm
ASMFLAGS = -f elf64

GCC = gcc
LDFLAGS = -nostartfiles -no-pie

SRC = Colleen.s Grace.s Sully.s
OBJ = $(SRC:.s=.o)
BIN = Colleen Grace Sully

.SUFFIXES:

all: $(BIN)

%.o: %.s
	$(NASM) $(ASMFLAGS) $< -o $@

%: %.o
	$(GCC) $(LDFLAGS) $< -o $@

clean:
	rm -f $(OBJ) Sully_*.o Sully_*.s Grace_kid.s

fclean: clean
	rm -f $(BIN) tmp*

re: fclean all

.PHONY: all clean fclean re