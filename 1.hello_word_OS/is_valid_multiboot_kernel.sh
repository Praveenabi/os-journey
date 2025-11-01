#/bin/bash

if grub-file --is-x86-multiboot kernel.bin; then
	echo kernel.bin is valid multiboot kernel
else 
	echo ERROR: kernel.bin is not valid multiboot kernel
fi
