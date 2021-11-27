[org 0x0100]

jmp start

val: dw 1,4,7,3,2,5,4,2,8,4
max: dw 0
min: dw 0
output: dw 0

start:
      xor ax, ax
      mov cx, 4
      
      mov bx, val
      mov dx, [bx]
      mov [max], dx
max_loop:
         mov ax, [bx]
         cmp [bx+2], ax
         jnge max_find
         
         mov dx, [bx+2]
         mov [max], dx
                    
    max_find:
             add bx, 2
             sub cx, 1
             jnz max_loop

      xor ax,ax
      mov dx, [bx]
      mov [min], bx
      mov cx, 4
min_loop:
         mov ax, [bx]
         cmp [bx+2], ax
         jnle min_find

         mov dx, [bx+2]
         mov [min], dx

     min_find:
              add bx, 2
              sub cx, 1
              jnz min_loop

mov ax, [max]
add ax, [min]
mov [output], ax


mov ax, 0x4c00
int 0x21
