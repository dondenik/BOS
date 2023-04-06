# BOS
better

## Dependencies

- `clang` and `ld.lld`, able to cross-compile for bare-metal x86 targets.
- GNU `make`
- GNU `coreutils`
- The Netwide Assembler (`nasm`)
- QEMU for running without real hardware

## Building

Run `make` to build and `make run` to run under QEMU.

## Todo and Technical Notes

- VGA text mode is 80x25.

### Todo
- Setup PIC and IDT
- Setup keyboard drivers (After IDT)
