; func_02041520: clear bit 15 if set, using `ands` + `bicne`.
; mwcc emits `tst` (test-only) for the natural `if (x & 0x8000)` C
; form; `ands` writes to a scratch reg AND sets flags — unusual
; codegen not reachable from C.

        .text
        .global func_02041520
        .arm
func_02041520:
        ands    r1, r0, #0x8000
        bicne   r0, r0, #0x8000
        bx      lr
