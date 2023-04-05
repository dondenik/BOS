void main() {
  char *video_memory = (char *)0xb8000;
  // video memory is 80 x 25 cells (= 2000)
  // video memory is made up of 16 bit cells
  // the first 8 bits (one byte) is the actual character
  // the last 8 bits (one byte) is the style information (colour, bold, etc)
  // puts ' ' in every cell
  for (int i = 0; i < 2000; i++) { *(video_memory + (i * 2)) = ' '; }
}
