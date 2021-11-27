[org 0x100]

jmp start
input: dw 512
shifts: dw 0

start:

xor ax, ax
xor bx, bx
xor cx, cx
xor dx, dx

mov ax, [input]
floop:
      shr ax, 1
      add cx, 1
      cmp ax, 0
      jne floop

xor ax, ax
mov ax, [input]
sloop:
      shl ax, 1
      add bx, 1
      cmp ax, 0
      jne sloop

cmp cx, bx
jge next

mov [shifts], cx
                 
                next:
                     mov [shifts], bx

mov ax, 0x4c00
int 0x21
