[org 0x0100]

xor ax, ax
xor bx, bx

mov ax, [multiplicand] ;multiplicand
mov bx, [multiplier] ;multiplier

mul bx ;stores result value in ax

mov ax, 0x4c00
int 0x21

multiplier: dw 5
multiplicand: dw 10