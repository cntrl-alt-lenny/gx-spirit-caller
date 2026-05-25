        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208d1e4
        .arm
func_0208d1e4:
    ldr r1, .L_0208d1fc
    ldr ip, .L_0208d200
    ldrh r2, [r1, #0x0]
    orr r2, r2, r0
    strh r2, [r1, #0x0]
    bx ip
.L_0208d1fc: .word data_021a6304
.L_0208d200: .word func_0208dce4
