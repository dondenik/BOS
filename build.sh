#!/bin/sh

echo "compiling boot files..."
nasm ./boot/boot_sect.asm -f bin -o ./boot_sect.bin

echo "compiling kernel"
clang -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra -Wno-main-return-type --target=i686-pc-none-elf -march=i686
nasm kernel_entry.asm -f elf -o kernel_entry.o
if [[ $(uname) == "Darwin" ]]; then
    /opt/homebrew/Cellar/llvm/16.0.0/bin/ld.lld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
else
    ld.lld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
fi
cat boot_sect.bin kernel.bin > osimage.bin

echo "running..."
qemu-system-i386 -drive file="./osimage.bin",format=raw
