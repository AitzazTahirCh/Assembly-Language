[org 0x100]

jmp start
input:dw 23,65,12,6,45,38,44,9,87,100

start:
xor ax, ax
mov dx, 1
mov cx, 0
mov bx, 0

fi:
mov ax, [input+bx]
mov si, [input+bx]

inner:
and si, dx  ;si contains carry
xor ax, dx
shl si, 1
mov dx, si
cmp dx, 0
jne inner

mov [input+bx], ax

add bx, 4
add cx, 1
cmp cx, 5
jne fi

xor ax, ax
xor si, si
mov dx, 1
mov cx, 0
mov bx, 2

sc:
mov ax, [input+bx]
mov si, [input+bx]

inner2:
not si
and si, dx  ;si contains borrow
xor ax, dx
shl si, 1
mov dx, si
cmp dx, 0
jne inner2

mov [input+bx], ax

add bx, 4
add cx, 1
cmp cx, 5
jne sc


mov ax, 0x4c00
int 0x21