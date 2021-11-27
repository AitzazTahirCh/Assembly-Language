[org 0x0100]

jmp start

input: dw 47, 72, 31
result: dw 0

divi:
push bp
mov bp, sp
push ax 
mov ax, [bp+4]  ;value passed by parameter
xor dx, dx ;to store value of remainder in dl
mov bx, 10 ;divisor
div bx  ;qoutient goes to ax
        ;remainder goes to dl
add ax, dx
cmp ax, [result]
jge next
pop ax
mov sp, bp
pop bp
ret
        next:
        mov [result], ax
        pop ax
        mov sp, bp
        pop bp
        ret

start:
mov si, 0

lo:
mov ax, [input+si] ;dividend
push ax
call divi
pop ax
add si, 2
cmp si, 6
jne lo

mov ax, 0x4c00
int 0x21