        .text
        .global func_020b1840
        .arm
func_020b1840:
    stmdb sp!, {r0, r1, r2, r3}
    ldr r0, [sp, #0x4]
    and r0, r0, #0x80000000
    add sp, sp, #0x10
    bx lr
