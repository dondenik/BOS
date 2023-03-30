#!/bin/sh

echo "compiling..."
nasm ./boot_sect.asm -f bin -o ./boot_sect.bin
nasm ./kernel.asm -f bin -o ./kernel.bin
cat ./boot_sect.bin ./kernel.bin > ./os-image

echo "running..."
qemu-system-i386 -drive format=raw,file="./os-image"