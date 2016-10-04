BASIC_C_FILE=basic.c
BASIC_O_FILE=basic.o
BASIC_BIN_FILE=basic.bin
BASIC_DIS_FILE=basic.dis


build : 
	@gcc -ffreestanding -c $(BASIC_C_FILE) -o $(BASIC_O_FILE)
	@ld -o $(BASIC_BIN_FILE) -Ttext 0x0 --oformat binary $(BASIC_O_FILE)
	@ndisasm -b 32 $(BASIC_BIN_FILE) > $(BASIC_DIS_FILE)
