; func_020270d0 — brief 205 / Phase 2: C-34 candidate (data_0219a924
; family). Same duplicate-pool-slot wall as E-07/E-08; same `.s`
; recipe. The second `.word` uses a literal value (`0x0219a924`)
; instead of a symbol relocation to defeat the patcher's trim
; heuristic — see PR #115 / brief 204's trim-protect fix.

        .text
        .extern data_0219a924
        .extern Fill32
        .global func_020270d0
        .arm

func_020270d0:
        stmdb   sp!, {r4, r5, r6, lr}
        ldr     r1, .L_POOL_A           ; r1 = &data_0219a924 (slot A)
        mov     r4, r0
        ldr     r5, [r1, #0x4]
        ldr     r1, .L_POOL_B           ; r1 = &data_0219a924 (slot B)
        cmp     r5, #0x0
        mov     r3, #0x0
        ble     .L_after
        ldr     r2, [r1, #0x0]
.L_loop:
        ldr     r0, [r2, #0x0]
        cmp     r0, #0x0
        beq     .L_after
        add     r3, r3, #0x1
        cmp     r3, r5
        add     r2, r2, #0xe0
        blt     .L_loop
.L_after:
        cmp     r3, r5
        mov     r0, #0x0
        ldmgeia sp!, {r4, r5, r6, pc}
        mov     r2, #0xe0
        mul     r5, r3, r2
        ldr     r6, [r1, #0x0]
        add     r1, r6, r5
        bl      Fill32
        str     r4, [r6, r5]
        add     r0, r6, r5
        ldmia   sp!, {r4, r5, r6, pc}
.L_POOL_A:
        .word   data_0219a924
.L_POOL_B:
        .word   0x0219a924
