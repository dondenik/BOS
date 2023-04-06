#define VIDEO_ADDRESS 0xb8000
#define MAX_ROWS 25
#define MAX_COLS 80

#define BLACK 0x0
#define DARK_BLUE 0x1
#define GREEN 0x2
#define DARK_CYAN 0x3
#define DARK_RED 0x4
#define DARK_PINK 0x5
#define BROWN 0x6
#define GRAY 0x7
#define DARK_GRAY 0x8
#define PURPLE 0x9
#define LIME 0xA
#define CYAN 0xB
#define RED 0xC
#define PINK 0xD
#define YELLOW 0xE
#define WHITE 0xF

/* Screen i/o ports */
#define REG_SCREEN_CTRL 0x3d4
#define REG_SCREEN_DATA 0x3d5

/* Public kernel API */
void clear_screen();
void kprint_at(char *message, int col, int row, char attr);
void kprint(char *message);
void kprintln(char *message);
char get_char_at(int col, int row);
char vga_attr(char fore, char back);
