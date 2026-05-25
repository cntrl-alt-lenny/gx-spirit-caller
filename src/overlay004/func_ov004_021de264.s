        .text
        .extern data_ov004_022923d4
        .global func_ov004_021de264
        .thumb
func_ov004_021de264:
    push {lr}
    sub sp, sp, #0x4
    ldr r1, .L_021de27c
    ldr r1, [r1, #0x0]
    cmp r1, #0x0
    beq .L_021de272
    blx r1
.L_021de272:
    mov r0, #0x0
    add sp, #0x4
    pop {r3}
    bx r3
    mov r8, r8
.L_021de27c: .word data_ov004_022923d4
