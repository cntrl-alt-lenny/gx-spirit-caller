        .text
        .extern data_021015e0
        .global func_02067654
        .arm
func_02067654:
    cmp r0, #0x0
    ldreq r0, .L_02067668
    ldreq r0, [r0, #0x0]
    str r1, [r0, #0xa4]
    bx lr
.L_02067668: .word data_021015e0
