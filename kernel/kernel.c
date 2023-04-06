#include "../drivers/vga.h"

void main() {
  clear_screen();
  kprint_at("Hello, World!", 10, -1, vga_attr(RED, BLUE));
}
