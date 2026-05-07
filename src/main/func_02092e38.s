; func_02092e38: read CP15 c9/c1/0 (DTCM region register) and mask off
; the size/enable bits — return the base address (top 20 bits).
;
;     mrc p15, #0, r0, c9, c1, #0
;     ldr r1, .L_02092e48
;     and r0, r0, r1
;     bx  lr
;  .L_02092e48: .word 0xfffff000
;
; 4 ARM instructions + 1 pool word. Privileged `mrc` not accessible
; from C; ships as `.s`.

        .text

        .global func_02092e38
        .arm
func_02092e38:
        mrc     p15, 0, r0, c9, c1, 0
        ldr     r1, =0xfffff000
        and     r0, r0, r1
        bx      lr
