        .text
        .extern data_021015e0
        .global func_0206763c
        .arm
func_0206763c:
    cmp r0, #0x0
    ldreq r0, .L_02067650
    ldreq r0, [r0, #0x0]
    str r1, [r0, #0xa8]
    bx lr
.L_02067650: .word data_021015e0
