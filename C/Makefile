CC       = clang
CFLAGS   = -Wall -Wextra -Werror
NOPIE    = -no-pie

COLLEEN  = Colleen
GRACE    = Grace
SULLY    = Sully

SRC_COLLEEN = Colleen.c
SRC_GRACE   = Grace.c
SRC_SULLY   = Sully.c

OBJ_COLLEEN = Colleen.o
OBJ_GRACE   = Grace.o
OBJ_SULLY   = Sully.o

SULLY_DIR = sully_dir

BIN = $(COLLEEN) $(GRACE) $(SULLY_DIR)/$(SULLY)
OBJ = $(OBJ_COLLEEN) $(OBJ_GRACE) $(OBJ_SULLY)

.PHONY: all clean fclean re

# -------------------------------------------------------------------------
# ALL
# -------------------------------------------------------------------------

all: $(COLLEEN) $(GRACE) $(SULLY_DIR)/$(SULLY)

# -------------------------------------------------------------------------
# BUILD NORMAL PROGRAMS
# -------------------------------------------------------------------------

$(COLLEEN): $(SRC_COLLEEN)
	$(CC) $(CFLAGS) -c $(SRC_COLLEEN)
	$(CC) $(CFLAGS) $(OBJ_COLLEEN) -o $(COLLEEN)

$(GRACE): $(SRC_GRACE)
	$(CC) $(CFLAGS) -c $(SRC_GRACE)
	$(CC) $(CFLAGS) $(OBJ_GRACE) -o $(GRACE)

# -------------------------------------------------------------------------
# BUILD SULLY INTO sully_dir
# -------------------------------------------------------------------------

$(SULLY_DIR)/$(SULLY): $(SRC_SULLY)
	mkdir -p $(SULLY_DIR)
	$(CC) $(CFLAGS) -c $(SRC_SULLY)
	$(CC) $(CFLAGS) $(NOPIE) $(OBJ_SULLY) -o $(SULLY_DIR)/$(SULLY)

# -------------------------------------------------------------------------
# CLEAN RULES
# -------------------------------------------------------------------------

clean:
	rm -f $(OBJ)
	rm -f $(SULLY_DIR)/*.o
	@echo "Cleaned object files."

fclean: clean
	rm -f $(COLLEEN) $(GRACE)
	rm -f $(SULLY_DIR)/$(SULLY)
	rm -rf $(SULLY_DIR)
	@echo "Fully cleaned executables and Sully_dir content."

re: fclean all
