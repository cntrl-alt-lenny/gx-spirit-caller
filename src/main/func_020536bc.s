; func_020536bc: 2-u32 setter at offsets 0x4 and 0x8.
; Ships as .s because mwcc fuses adjacent stores into stmia.

        .text
        .global func_020536bc
        .arm
func_020536bc:
        str     r1, [r0, #0x4]
        str     r2, [r0, #0x8]
        bx      lr
