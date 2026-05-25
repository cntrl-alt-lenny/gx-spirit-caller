        .text
        .extern data_ov004_022923d0
        .global func_ov004_021de250
        .thumb
func_ov004_021de250:
    push {lr}
    sub sp, sp, #0x4
    ldr r1, .L_021de260
    ldr r1, [r1, #0x0]
    blx r1
    add sp, #0x4
    pop {r3}
    bx r3
.L_021de260: .word data_ov004_022923d0
