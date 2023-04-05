// video memory is 80 x 25 cells (= 2000)
// video memory is made up of 16 bit cells
// the first 8 bits (one byte) is the actual character
// the last 8 bits (one byte) is the style information (colour, bold, etc)
typedef struct {
  char *memory;
  int cursor_row;
  int cursor_col;
} VgaHandle;

VgaHandle get_vga() {
  VgaHandle vga = {(char *)0xb8000, 0, 0};
  return vga;
}

void clear_screen(VgaHandle vga) {
  vga.cursor_col = 0;
  vga.cursor_row = 0;

  for (int i = 0; i < 2000; i++) {
    *(vga.memory + (i * 2)) = ' ';
  }
}

