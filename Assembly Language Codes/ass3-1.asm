[org 0x0100]

jmp start

array: dw 3, 9, 56, 43, 1, 2, 23
ev: dw 0
od: dw 0

fodd:
push bx
mov bx, 1
add [od], bx
pop bx
ret

feven:
push bx
mov bx, 1
add [ev], bx
pop bx
ret

task:
push bp             ;value passed by parameter
mov bp, sp          ;
push ax             ;
mov ax, [bp+4]      ;dividend
xor dx, dx          ;to store value of remainder in dl

mov cx, 2           ;divisor
div cx               ;qoutient goes to ax
                    ;remainder goes to dl
cmp  dx, 0
jnz odd

call feven          ;for even
jmp next
       odd:         ;for odd
       call fodd
next:
pop ax
mov sp, bp
pop bp
ret

start:
mov si, 0
floop:
mov ax, [array+si]     ;dividend
push ax
call task
add si, 2
cmp si, 14
pop ax
jne floop

mov ax, 0x4c00
int 0x21