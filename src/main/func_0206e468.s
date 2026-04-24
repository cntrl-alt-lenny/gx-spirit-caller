; func_0206e468: 4-byte round up — `(x + 3) & ~3`.
; mwcc emits `bic r0, r0, #3; add r0, r0, #3` (different order) or
; different instruction choice; .s pins the exact sequence.

        .text
        .global func_0206e468
        .arm
func_0206e468:
        add     r0, r0, #0x3
        bic     r0, r0, #0x3
        bx      lr
