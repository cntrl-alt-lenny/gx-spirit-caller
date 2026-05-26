; func_0208b1ac — brief 219: Thumb-mode leaf, struct-init variant.

        .text
        .global func_0208b1ac
        .thumb

func_0208b1ac:
        str     r2, [r0, #0x0]
        str     r2, [r0, #0x20]
        mov     r3, #0x0
        str     r3, [r0, #0x4]
        str     r3, [r0, #0xc]
        str     r3, [r0, #0x14]
        str     r3, [r0, #0x1c]
        neg     r2, r1
        mov     r3, #0x1
        lsl     r3, r3, #0xc
        str     r1, [r0, #0x18]
        str     r2, [r0, #0x8]
        str     r3, [r0, #0x10]
        bx      lr
