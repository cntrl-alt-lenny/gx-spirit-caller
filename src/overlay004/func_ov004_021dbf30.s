        .text
        .extern data_ov004_022923dc
        .global func_ov004_021dbf30
        .thumb
func_ov004_021dbf30:
    push {lr}
    sub sp, sp, #0x4
    mov r0, r1
    ldr r1, .L_021dbf44
    ldr r1, [r1, #0x0]
    blx r1
    add sp, #0x4
    pop {r3}
    bx r3
    mov r8, r8
.L_021dbf44: .word data_ov004_022923dc
