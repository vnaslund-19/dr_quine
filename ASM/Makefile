NASM     = nasm
ASMFLAGS = -f elf64
GCC      = gcc
NOPIE    = -no-pie

SRC = Colleen.s Grace.s Sully.s
OBJ = $(SRC:.s=.o)
BIN = Colleen Grace Sully

SULLY_DIR = sully_dir

.SUFFIXES:

all: $(BIN)

# --- BUILD RULES --------------------------------------------------------

%.o: %.s
	$(NASM) $(ASMFLAGS) $< -o $@

Colleen: Colleen.o
	$(GCC) $(NOPIE) Colleen.o -o Colleen

Grace: Grace.o
	$(GCC) $(NOPIE) Grace.o -o Grace

# Build Sully into sully_dir
Sully: Sully.o
	mkdir -p $(SULLY_DIR)
	$(GCC) $(NOPIE) Sully.o -o $(SULLY_DIR)/Sully

# --- CLEAN RULES --------------------------------------------------------

clean:
	rm -f $(OBJ)
	rm -f $(SULLY_DIR)/*.o
	@echo "Cleaned object files."

fclean: clean
	rm -f $(BIN)
	rm -rf $(SULLY_DIR)
	@echo "Fully cleaned executables and Sully_dir content."

re: fclean all

.PHONY: all clean fclean re