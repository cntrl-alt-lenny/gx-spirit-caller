; func_ov004_021dbc80: Thumb 5-insn zero-init — obj[0] = 0,
; obj[4] = (u16)0, obj[6] = (u16)0. Ends at 0xa bytes.

        .text
        .global func_ov004_021dbc80
        .thumb
func_ov004_021dbc80:
        mov     r1, #0x0
        str     r1, [r0, #0x0]
        strh    r1, [r0, #0x4]
        strh    r1, [r0, #0x6]
        bx      lr
