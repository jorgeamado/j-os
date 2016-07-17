
build : 
	@nasm -f bin -o boot.sect.bin boot_sect.asm
run : 
	@nasm -f bin -o boot.sect.bin boot_sect.asm
	@qemu-system-i386 -drive format=raw,file=boot.sect.bin -curses
clean : 
	@rm boot.sect.bin