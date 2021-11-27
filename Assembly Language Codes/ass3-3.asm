[org 0x0100]

jmp start

add2:
push bp
mov bp, sp
push ax
push bx
push cx
mov ax, [bp+8]
mov bx, [bp+6]
mov cx, [bp+4]
sub sp, 2      ;local variable
mov [bp-8], ax
add [bp-8], bx
add [bp-8], cx
mov dx, [bp-8] ;final sum value
add sp, 2
pop cx
pop bx
pop ax
mov sp, bp
pop bp
ret

add1:
push bp
mov bp, sp
push ax
push bx
mov ax, [bp+6]
mov bx, [bp+4]
sub sp, 2      ;local variable
mov [bp-6], ax
add [bp-6], bx

call add2

add sp, 2
pop bx
pop ax
mov sp, bp
pop bp
ret

start:
mov ax, 1
mov bx, 2
push ax
push bx
call add1
pop bx
pop ax

mov ax, 0x4c00
int 0x21