; func_020684b4: u32 setter at 0x8 + u16 setter at 0xc.

        .text
        .global func_020684b4
        .arm
func_020684b4:
        str     r1, [r0, #0x8]
        strh    r2, [r0, #0xc]
        bx      lr
