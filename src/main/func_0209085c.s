; func_0209085c: mwldarm interwork veneer (C-31) — brief 191 recipe,
; ARM variant. 12-byte ARM-mode long-distance veneer bridging an ARM
; caller to ARM target func_020909b0.
;
;     ldr   r1, [pc, #0]
;     bx    r1
;     .word 0x020909b0
;
; Uses r1 (not the linker's default `ip`/r12) — encoded into the
; orig binary. Brief 191 § "ARM 12-byte form" template.

        .text
        .global func_0209085c
        .arm
func_0209085c:
        ldr     r1, [pc, #0]
        bx      r1
        .word   0x020909b0
