        .text
        .global func_ov004_021dbd08
        .thumb
func_ov004_021dbd08:
    mov r2, #0x0
    ldrsb r1, [r0, r2]
    cmp r1, #0x0
    beq .L_021dbd18
.L_021dbd10:
    add r2, r2, #0x1
    ldrsb r1, [r0, r2]
    cmp r1, #0x0
    bne .L_021dbd10
.L_021dbd18:
    mov r0, r2
    bx lr
