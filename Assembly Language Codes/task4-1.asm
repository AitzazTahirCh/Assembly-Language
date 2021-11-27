[org 0x0100]

xor dx, dx ;to store value of remainder in dl
mov ax, 4 ;dividend
mov bx, 2 ;divisor

div bx  ;qoutient goes to ax
        ;remainder goes to dl
mov ax, 0x4c00
int 0x21