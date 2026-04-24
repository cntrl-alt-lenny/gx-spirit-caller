; func_ov004_021dbc78: Thumb 4-insn setter — obj[0] = arg0, obj[4] = 1.
;
;     str  r0, [r1, #0x0]
;     mov  r0, #0x1
;     strh r0, [r1, #0x4]
;     bx   lr

        .text
        .global func_ov004_021dbc78
        .thumb
func_ov004_021dbc78:
        str     r0, [r1, #0x0]
        mov     r0, #0x1
        strh    r0, [r1, #0x4]
        bx      lr
