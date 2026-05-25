        .text
        .extern data_ov004_022923dc
        .global func_ov004_021de23c
        .thumb
func_ov004_021de23c:
    push {lr}
    sub sp, sp, #0x4
    ldr r1, .L_021de24c
    ldr r1, [r1, #0x0]
    blx r1
    add sp, #0x4
    pop {r3}
    bx r3
.L_021de24c: .word data_ov004_022923dc
