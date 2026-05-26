; func_0208b1c8 — brief 219: Thumb-mode leaf, stmia-style init.

        .text
        .global func_0208b1c8
        .thumb

func_0208b1c8:
        stmia   r0!, {r2}
        mov     r3, #0x0
        stmia   r0!, {r1, r3}
        neg     r1, r1
        stmia   r0!, {r1, r2}
        mov     r1, #0x1
        lsl     r1, r1, #0xc
        str     r3, [r0, #0x0]
        str     r3, [r0, #0x4]
        str     r3, [r0, #0x8]
        str     r1, [r0, #0xc]
        bx      lr
