#include "vga.c"

void main() {
  VgaHandle vga = get_vga();
  clear_screen(vga);
}
