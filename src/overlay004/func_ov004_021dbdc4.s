; func_ov004_021dbdc4: mwldarm interwork veneer (C-31) — brief 191 recipe,
; Thumb 12-byte form with `strb` prefix.
;
;     strb r2, [r1, #0]              ; side-effect prefix
;     ldr  r3, [pc, #4]              ; load via PC-aligned address
;     bx   r3
;     mov  r8, r8                     ; nop pad to 4-byte align literal pool
;     .word 0x0206eea0
;
; The `mov r8, r8` (encoding 0x46c0) is mwasmarm's idiomatic Thumb NOP
; — needed because after the 6 bytes of code (strb + ldr + bx), the
; PC is at 4-aligned + 2, so a 2-byte pad lands the .word at the
; PC-relative slot the ldr targets (PC alignment for Thumb LDR).

        .text
        .global func_ov004_021dbdc4
        .thumb
func_ov004_021dbdc4:
        strb    r2, [r1, #0]
        ldr     r3, [pc, #4]
        bx      r3
        mov     r8, r8
        .word   0x0206eea0
