bits 16
[ORG 0x8000]

entry:
mov bl, 0xCF
mov dl, 0
mov dh, 0

mov al, 'D'
call write_char
inc dl

mov al, 'o'
call write_char
inc dl

mov al, 'c'
call write_char
inc dl

jmp $

; function(character: al, colour: bl, row: dh, col: dl)
write_char:
call set_cursor_pos
mov ah, 0x9 ; "Write character and attribute at cursor position"
mov bh, 0 ; "Page number"
mov cx, 1 ; we only want to print each number once
int 0x10
ret

; function(row: dh, col: dl)
set_cursor_pos:
mov ah, 0x2 ; "Set cursor position"
mov bh, 0x0 ; "Page number"
int 0x10
ret