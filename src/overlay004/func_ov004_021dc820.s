        .text
        .global func_ov004_021dc820
        .thumb
func_ov004_021dc820:
    mov r2, #0x0
    mov r1, #0x10
    and r0, r1
    cmp r0, #0x0
    beq .L_021dc82c
    mov r2, #0x1
.L_021dc82c:
    mov r0, r2
    bx lr
