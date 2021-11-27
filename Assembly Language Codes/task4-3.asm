[org 0x0100]

xor ax, ax
xor bx, bx

mov ax, 2 ;multiplicand
mov bx, 4 ;multiplier

mul bx ;stores result value in ax

mov ax, 0x4c00
int 0x21