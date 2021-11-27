[org 0x0100]

xor dx, dx ;to store value of remainder in dl
mov ax, [dividend] ;dividend
mov bx, [divisor] ;divisor

div bx  ;qoutient goes to ax
        ;remainder goes to dl
mov ax, 0x4c00
int 0x21

divisor: dw 3
dividend: dw 10