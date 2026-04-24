; func_0201aaf4: clear bit (arg - 0x75) in byte 0 of state[0x900].

        .text
        .extern GetSystemWork
        .global func_0201aaf4
        .arm
func_0201aaf4:
        stmdb   sp!, {r4, lr}
        mov     r4, r0
        bl      GetSystemWork
        ldr     r3, [r0, #0x900]
        sub     r1, r4, #0x75
        mov     r2, #0x1
        mvn     r1, r2, lsl r1
        mov     r2, r3, lsl #0x18
        and     r1, r1, r2, lsr #0x18
        bic     r2, r3, #0xff
        and     r1, r1, #0xff
        orr     r1, r2, r1
        str     r1, [r0, #0x900]
        ldmia   sp!, {r4, pc}
