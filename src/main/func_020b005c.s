        .text
        .global func_020b005c
        .arm
func_020b005c:
    stmdb sp!, {r0, r1, r2, r3}
    add r2, sp, #0x0
    ldr r1, [r2, #0x4]
    ldr r0, [sp, #0x0]
    bic r1, r1, #0x80000000
    str r1, [r2, #0x4]
    add sp, sp, #0x10
    bx lr
