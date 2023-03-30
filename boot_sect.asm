[ORG 0x7c00]
bits 16
boot_stuff:
mov [BOOT_DRIVE], dl ; store boot drive for later use because the BIOS stores the boot drive in dl
mov bp, 0x0550 ; set stack 
mov sp, bp ; out of the way at 0x0550, there should be almost 30 kb of stack space up until bootloader, note to self use this space for more stuff later
mov bx, 0x8000 ; Load 5 sectors to 0x0000(ES):0x8000(BX)
mov dh, 7 ; from the boot disk.
%assign len 7*512
%warning Loading len bytes of Kernel
mov dl, [BOOT_DRIVE]
call disk_load
mov si, msg
call print_str
;
; There is a 512 byte gap between the bootloader and kernel (0x7E00-0x8000)
;
jmp 0x0000:0x8000
hang:
jmp hang
define_stuff:
print_str:
lodsb
mov ah, 0x0E
cmp al, 0
je done
int 0x10
jmp print_str
done:
ret
disk_load:
; load DH sectors to ES:BX from drive DL
push dx ; Store DX on stack so later we can recall how many sectors were requested to be read even if it is altered
mov ah, 0x02 ; BIOS read sector function
mov al, dh ; Read DH sectors
mov ch, 0x00 ; Select cylinder 0
mov dh, 0x00 ; Select head 0
mov cl, 0x02 ; Start reading from second sector (i.e. after the boot sector)
int 0x13 ; BIOS Interrupt
jc disk_error ; jump if carry flag set
pop dx ; Restore DX
cmp dh, al ; if AL (sectors read) != DH (sectors expected)
jne disk_error
ret
disk_error:
mov si, disk_error_msg
call print_str
jmp $
data_stuff:
msg db 'Booted', 0
disk_error_msg db 'DISK ERROR', 0
BOOT_DRIVE db 0, 0
%assign len ($-$$)
%warning Bootloader is len bytes long pre-padding and magic number
times 510-($-$$) db 0
dw 0xaa55
%assign len ($-$$)
%warning Bootloader is len bytes long
