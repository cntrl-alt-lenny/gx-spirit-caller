        .text
        .extern data_021a8438
        .global func_0209b534
        .arm
func_0209b534:
    ldr ip, .L_0209b548
.L_0209b538:
    ldr r0, [ip, #0x0]
    cmp r0, #0x1
    beq .L_0209b538
    bx lr
.L_0209b548: .word data_021a8438
