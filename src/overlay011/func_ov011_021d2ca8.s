; func_ov011_021d2ca8 — brief 221: medium-tier P-11. Vanilla brief 202
; `.s` recipe.

        .text
        .extern Task_InvokeLocked
        .global func_ov011_021d2ca8
        .arm

func_ov011_021d2ca8:
        stmdb   sp!, {r4, lr}
        sub     sp, sp, #0x10
        mov     r4, r0
        str     r1, [r4, #0x2c]
        str     r2, [r4, #0x30]
        ldr     r0, [r4, #0x34]
        str     r1, [sp, #0x8]
        bic     r0, r0, #0x1
        str     r0, [r4, #0x34]
        ldr     r0, [r4, #0x20]
        str     r2, [sp, #0xc]
        str     r1, [sp, #0x0]
        str     r2, [sp, #0x4]
        cmp     r0, #0x0
        beq     .L_021d2cf0
        bl      Task_InvokeLocked
        mov     r0, #0x0
        str     r0, [r4, #0x20]
.L_021d2cf0:
        ldr     r0, [r4, #0x40]
        bic     r0, r0, #0x100
        str     r0, [r4, #0x40]
        add     sp, sp, #0x10
        ldmia   sp!, {r4, pc}
