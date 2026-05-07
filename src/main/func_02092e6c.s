; func_02092e6c: read-modify-write CP15 c5/c0/2 (instruction-cache
; access permissions) — clear bits in r0 and set bits in r1.
;
;     mrc p15, #0, r2, c5, c0, #2
;     bic r2, r2, r0
;     orr r2, r2, r1
;     mcr p15, #0, r2, c5, c0, #2
;     bx  lr
;
; 5 ARM instructions, 0x14 bytes. Privileged coprocessor access; ships
; as `.s`.

        .text

        .global func_02092e6c
        .arm
func_02092e6c:
        mrc     p15, 0, r2, c5, c0, 2
        bic     r2, r2, r0
        orr     r2, r2, r1
        mcr     p15, 0, r2, c5, c0, 2
        bx      lr
