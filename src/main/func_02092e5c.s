; func_02092e5c: clear bit 0 of CP15 c1/c0/0 — disables the MMU.
; Sibling of func_02092e4c.
;
;     mrc p15, #0, r0, c1, c0, #0
;     bic r0, r0, #0x1
;     mcr p15, #0, r0, c1, c0, #0
;     bx  lr
;
; 4 ARM instructions, 0x10 bytes.

        .text

        .global func_02092e5c
        .arm
func_02092e5c:
        mrc     p15, 0, r0, c1, c0, 0
        bic     r0, r0, #0x1
        mcr     p15, 0, r0, c1, c0, 0
        bx      lr
