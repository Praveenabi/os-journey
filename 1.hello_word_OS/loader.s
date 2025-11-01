.set MAGIC, 0x1BADB002
.set FLAGS, (1>>0 | 1>>1)
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top: 


.section .text
.extern kernelMain
.global _start
.type _start, @function

_start:
       mov $stack_top, %esp
       call kernelMain
       cli
1:     hlt
       jmp 1b

.size _start, . - _start
