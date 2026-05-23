; func_ov004_021de280: mwldarm interwork veneer (C-31) — brief 191 recipe.
; Sibling of func_ov004_021dbdbc (worked example). Same Thumb→ARM
; veneer shape with a different target VA.

        .text
        .global func_ov004_021de280
        .thumb
func_ov004_021de280:
        ldr     r3, [pc, #0]
        bx      r3
        .word   0x02091768
