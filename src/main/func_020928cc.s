; func_020928cc: cache-line invalidate loop — invalidate data-cache
; lines covering the address range `[r0, r0+r1)` (rounded down to
; 32-byte boundaries).
;
;     add r1, r1, r0
;     bic r0, r0, #0x1f
;  .L_020928d4:
;     mcr p15, #0, r0, c7, c6, #1     ; invalidate D-cache line by MVA
;     add r0, r0, #0x20                ; next 32-byte line
;     cmp r0, r1
;     blt .L_020928d4
;     bx  lr
;
; Per codegen-walls.md C-8: privileged `mcr` not accessible from C;
; ships as `.s`.

        .text

        .global func_020928cc
        .arm
func_020928cc:
        add     r1, r1, r0
        bic     r0, r0, #0x1f
.L_020928d4:
        mcr     p15, 0, r0, c7, c6, 1
        add     r0, r0, #0x20
        cmp     r0, r1
        blt     .L_020928d4
        bx      lr
