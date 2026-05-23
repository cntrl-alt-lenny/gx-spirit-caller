; func_ov011_021ca03c: cross-overlay BL wall (C-32) — brief 192 recipe.
; 4 BLs: 2 cross-overlay (hand-encoded), 2 to GetSystemWork (resolvable).
; The function body has a band-1 bitfield manipulation between the BLs.
;
;     bl 0x021b142c   ; @0x021ca040 — module:none → hand-encoded
;       offset = (0x021b142c - (0x021ca040 + 8)) / 4 = -0x6307
;       encoding = 0xebff9cf9
;
;     bl 0x021b284c   ; @0x021ca08c — module:none → hand-encoded
;       offset = (0x021b284c - (0x021ca08c + 8)) / 4 = -0x5e12
;       encoding = 0xebffa1ee

        .text
        .extern GetSystemWork
        .global func_ov011_021ca03c
        .arm
func_ov011_021ca03c:
        stmdb   sp!, {r3, lr}
        .word   0xebff9cf9                      ; bl 0x021b142c (cross-overlay)
        cmp     r0, #0
        ldmeqia sp!, {r3, pc}
        bl      GetSystemWork
        ldr     r0, [r0, #0x900]
        mov     r0, r0, lsl #21
        mov     r0, r0, lsr #30
        tst     r0, #1
        beq     .L_021ca08c
        bl      GetSystemWork
        ldr     r2, [r0, #0x900]
        mov     r1, r2, lsl #21
        mov     r1, r1, lsr #30
        bic     r1, r1, #1
        bic     r2, r2, #1536
        mov     r1, r1, lsl #30
        orr     r1, r2, r1, lsr #21
        str     r1, [r0, #0x900]
        ldmia   sp!, {r3, pc}
.L_021ca08c:
        .word   0xebffa1ee                      ; bl 0x021b284c (cross-overlay)
        ldmia   sp!, {r3, pc}
