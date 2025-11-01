GPPPARAMS = -m32 -ffreestanding -fno-exceptions -fno-rtti -o2 -Wextra -Wall
ASPARAMS = --32
LDPARAMS = -m32 -ffreestanding -nostdlib -o2

objects = loader.o kernel.o 

%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<

%.o: %.s 
	as $(ASPARAMS) -o $@ $<

kernel.bin: linker.ld $(objects)
	g++ $(LDPARAMS) -T $< -o $@ $(objects)

kernel.iso: kernel.bin
	mkdir -p iso/boot/grub
	cp $< iso/boot
	echo "set timeout=0" > iso/boot/grub/grub.cfg
	echo "set default=0" >> iso/boot/grub/grub.cfg
	echo '' >> iso/boot/grub/grub.cfg
	echo "menuentry "MyOS" {" >> iso/boot/grub/grub.cfg
	echo "  multiboot /boot/kernel.bin" >> iso/boot/grub/grub.cfg
	echo "boot" >> iso/boot/grub/grub.cfg
	echo "}" >> iso/boot/grub/grub.cfg
	grub-mkrescue --output=$@ iso
	
clean:
	rm *.o
	rm *.bin
	rm *.iso
	rm -rf iso
