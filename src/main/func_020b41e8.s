; func_020b41e8: SVC #0x123456 with selector 0x18 + arg 0. Sibling of
; brief-029 func_020b41c0/d4 with different selector. No stack frame —
; uses `mov pc, lr` for return rather than the `str lr/ldr pc` pair.
;
;     mov r1, #0x0
;     mov r0, #0x18
;     swi #0x123456
;     mov pc, lr
;
; 4 ARM instructions, 0x10 bytes.

        .text

        .global func_020b41e8
        .arm
func_020b41e8:
        mov     r1, #0x0
        mov     r0, #0x18
        swi     0x123456
        mov     pc, lr
