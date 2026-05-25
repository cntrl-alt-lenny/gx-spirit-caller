; func_020a584c: bit-0 extract from *(int *)(p + 4), normalised to 0/1.
;
;     ldr   r0, [r0, #0x4]
;     mov   r0, r0, lsl #0x1f          ; bit-0 → bit-31
;     movs  r0, r0, lsr #0x1f          ; back to bit-0, set flags
;     movne r0, #0x1                   ; redundant — value already 0/1
;     moveq r0, #0x0                   ; ditto
;     bx    lr
;
; mwcc 2.0 collapses the `(x & 1) ? 1 : 0` C form to `tst r0, #1` (which
; saves an insn). The orig sequence is what an inline-bitfield or
; explicit `(unsigned)x << 31 >> 31 != 0` source produces. Until the
; precise source idiom is pinned down, ship as `.s` per brief 210.

        .text
        .global func_020a584c
        .arm
func_020a584c:
        ldr     r0, [r0, #0x4]
        mov     r0, r0, lsl #0x1f
        movs    r0, r0, lsr #0x1f
        movne   r0, #0x1
        moveq   r0, #0x0
        bx      lr
