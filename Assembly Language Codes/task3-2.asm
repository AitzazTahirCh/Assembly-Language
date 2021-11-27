[org 0x0100]

jmp start

val: dw 78,27,65,27,89,65
result: dw 0

start:
     xor bx, bx
     mov cx, 5
     mov di, 5
outerloop:
         mov dx, [val+bx]
         mov si, 2

         inerloop:
                 cmp dx, [val+bx+si]
                 jne next

                         mov ax, dx
             next:
                 add si, 2
                 dec di
                 jnz inerloop

         add bx, 2
         dec cx
         mov di, cx
         cmp cx, 0
         jnz outerloop

mov [result], ax

mov ax, 0x4c00
int 0x21
