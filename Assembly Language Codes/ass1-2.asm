[org 0x100]

jmp start

input: dw 2,3,6,4,8,67,32
evens: dw 0
odds: dw 0

start:

xor ax, ax
xor cx, cx
mov bx, 0
mov dx, 1

in:
mov ax, [input+bx]

test ax, 00000001
jz next

add [odds], dx

add bx, 2
add cx, 1
cmp cx, 7
jne in

mov ax, 0xc400
int 0x21
        
        next:
            add [evens], dx
              
add bx, 2
add cx, 1
cmp cx, 7
jne in

mov ax, 0x4c00
int 0x21