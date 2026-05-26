; func_01ff8770 — brief 221: medium-tier StyleA, ITCM DMA channel
; programmer. Vanilla brief 202 `.s` recipe.

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_01ff8770
        .arm

func_01ff8770:
        stmdb   sp!, {r4, r5, r6, r7, lr}
        sub     sp, sp, #0x4
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        bl      OS_DisableIrq
        mov     r1, #0xc
        mul     r3, r7, r1
        ldr     r1, .L_01ff87bc
        add     r2, r3, #0x4000000
        str     r6, [r2, #0xb0]
        add     r1, r3, r1
        str     r5, [r1, #0x4]
        str     r4, [r1, #0x8]
        bl      OS_RestoreIrq
        add     sp, sp, #0x4
        ldmia   sp!, {r4, r5, r6, r7, lr}
        bx      lr
.L_01ff87bc:
        .word   0x40000b0
