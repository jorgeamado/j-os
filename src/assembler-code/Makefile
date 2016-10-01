ASM_FILE=boot_sect.asm
BIN_FILE=boot.sect.bin

build : 
	@nasm -f bin -o $(BIN_FILE) $(ASM_FILE)
run : build
	@qemu-system-i386 -drive format=raw,file=$(BIN_FILE),index=0,if=floppy -curses
clean : 
	@rm $(BIN_FILE)