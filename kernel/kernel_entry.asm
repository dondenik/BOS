[bits 32]
[extern main] ; Define calling point. Must have same name as kernel.c 'main' function
call main ; Calls the C function. The linker will know where it is placed in memory
hlt ; `hlt` is better than a infinite loop because it doesn't murder my host cpu lol
