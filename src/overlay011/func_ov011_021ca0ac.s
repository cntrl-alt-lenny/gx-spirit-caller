; func_ov011_021ca0ac: cross-overlay BL wall (C-32) — brief 192 recipe.
; 4 BLs: 2 cross-overlay (hand-encoded), 2 intra-overlay (resolvable).
;
;     bl 0x021b0b44   ; @0x021ca0b0 — module:none → hand-encoded
;       offset = -0x655d; encoding = 0xebff9aa3
;
;     bl 0x021b2420   ; @0x021ca0b4 — module:none → hand-encoded
;       offset = -0x5f27; encoding = 0xebffa0d9

        .text
        .extern func_ov011_021cb25c
        .extern func_ov011_021d18b0
        .global func_ov011_021ca0ac
        .arm
func_ov011_021ca0ac:
        stmdb   sp!, {r3, lr}
        .word   0xebff9aa3                      ; bl 0x021b0b44 (cross-overlay)
        .word   0xebffa0d9                      ; bl 0x021b2420 (cross-overlay)
        bl      func_ov011_021cb25c
        bl      func_ov011_021d18b0
        ldmia   sp!, {r3, pc}
