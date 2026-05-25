        .text
        .extern data_021015e0
        .global func_0206766c
        .arm
func_0206766c:
    cmp r0, #0x0
    ldreq r0, .L_02067680
    ldreq r0, [r0, #0x0]
    str r1, [r0, #0xa0]
    bx lr
.L_02067680: .word data_021015e0
