all:
	nasm -felf64 loop.s -o loop.o
	nasm -felf64 cond.s -o cond.o
	ld -o loop loop.o
	ld -o cond cond.o
