; func_ov012_021c9d8c: cross-overlay BL wall (C-32) — brief 192 recipe.
; Sibling of func_ov013_021c9d60 (same shape, different host addr).
;
;     bl 0x021b0b44   ; @0x021c9d90 — module:none → hand-encoded
;       offset = (0x021b0b44 - (0x021c9d90 + 8)) / 4 = -0x6495
;       encoding = 0xebff9b6b
;
;     bl 0x021b2420   ; @0x021c9d94 — module:none → hand-encoded
;       offset = (0x021b2420 - (0x021c9d94 + 8)) / 4 = -0x5e5f
;       encoding = 0xebffa1a1

        .text
        .extern func_ov012_021ca6dc
        .global func_ov012_021c9d8c
        .arm
func_ov012_021c9d8c:
        stmdb   sp!, {r3, lr}
        .word   0xebff9b6b                      ; bl 0x021b0b44 (cross-overlay)
        .word   0xebffa1a1                      ; bl 0x021b2420 (cross-overlay)
        bl      func_ov012_021ca6dc
        ldmia   sp!, {r3, pc}
