        .text
        .global func_0207d304
        .arm
func_0207d304:
    ldrh r0, [r0, #-0xe]
    and r0, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
