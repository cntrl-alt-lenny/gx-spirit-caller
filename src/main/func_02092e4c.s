; func_02092e4c: set bit 0 of CP15 c1/c0/0 (System Control Register) —
; enables the MMU.
;
;     mrc p15, #0, r0, c1, c0, #0
;     orr r0, r0, #0x1
;     mcr p15, #0, r0, c1, c0, #0
;     bx  lr
;
; 4 ARM instructions, 0x10 bytes. Privileged coprocessor access; ships
; as `.s`.

        .text

        .global func_02092e4c
        .arm
func_02092e4c:
        mrc     p15, 0, r0, c1, c0, 0
        orr     r0, r0, #0x1
        mcr     p15, 0, r0, c1, c0, 0
        bx      lr
