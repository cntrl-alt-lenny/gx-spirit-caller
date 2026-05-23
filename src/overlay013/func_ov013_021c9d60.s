; func_ov013_021c9d60: cross-overlay BL wall (C-32) — brief 192 recipe.
;
; Three BLs: two cross-overlay (module:none, hand-encoded `.word`),
; one intra-overlay (resolvable).
;
;     bl 0x021b0b44   ; @0x021c9d64 — module:none → hand-encoded
;       offset = (0x021b0b44 - (0x021c9d64 + 8)) / 4 = -0x648a
;       encoding = 0xeb000000 | 0xff9b76 = 0xebff9b76
;
;     bl 0x021b2420   ; @0x021c9d68 — module:none → hand-encoded
;       offset = (0x021b2420 - (0x021c9d68 + 8)) / 4 = -0x5e54
;       encoding = 0xeb000000 | 0xffa1ac = 0xebffa1ac

        .text
        .extern func_ov013_021ca024
        .global func_ov013_021c9d60
        .arm
func_ov013_021c9d60:
        stmdb   sp!, {r3, lr}
        .word   0xebff9b76                      ; bl 0x021b0b44 (cross-overlay)
        .word   0xebffa1ac                      ; bl 0x021b2420 (cross-overlay)
        bl      func_ov013_021ca024
        ldmia   sp!, {r3, pc}
