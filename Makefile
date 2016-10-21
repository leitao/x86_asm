all:
	nasm -felf64 loop.s -o loop.o
	ld -o loop loop.o
