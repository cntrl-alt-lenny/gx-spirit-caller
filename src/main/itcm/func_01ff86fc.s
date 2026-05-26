; func_01ff86fc — brief 221: medium-tier StyleA, ITCM DMA channel
; programmer with reset path. Vanilla brief 202 `.s` recipe.

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_01ff86fc
        .arm

func_01ff86fc:
        stmdb   sp!, {r4, r5, r6, r7, lr}
        sub     sp, sp, #0x4
        mov     r7, r0
        mov     r6, r1
        mov     r5, r2
        mov     r4, r3
        bl      OS_DisableIrq
        mov     r1, #0xc
        mul     r3, r7, r1
        add     r1, r3, #0x4000000
        ldr     r2, .L_01ff8768
        str     r6, [r1, #0xb0]
        add     r3, r3, r2
        str     r5, [r3, #0x4]
        str     r4, [r3, #0x8]
        ldr     r1, [r2, #0x0]
        cmp     r7, #0x0
        ldr     r1, [r2, #0x0]
        moveq   r2, #0x0
        streq   r2, [r3, #0x0]
        ldreq   r1, .L_01ff876c
        streq   r2, [r3, #0x4]
        streq   r1, [r3, #0x8]
        bl      OS_RestoreIrq
        add     sp, sp, #0x4
        ldmia   sp!, {r4, r5, r6, r7, lr}
        bx      lr
.L_01ff8768:
        .word   0x40000b0
.L_01ff876c:
        .word   0x81400001
