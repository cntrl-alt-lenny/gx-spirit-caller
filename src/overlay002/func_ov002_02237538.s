; func_ov002_02237538 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_0202eac8
        .extern func_ov002_021b90a8
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d5a08
        .extern func_ov002_02218068
        .global func_ov002_02237538
        .arm
func_ov002_02237538:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    bl func_ov002_02218068
    movs fp, r0
    bne .L_cc
    mov r8, #0x0
    ldr r7, _LIT0
    ldr r4, _LIT1
    mov r9, r8
    mov r6, #0x2
    mov r5, r8
.L_30:
    ldrh r0, [sl, #0x2]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b9ecc
    cmp r0, #0x0
    beq .L_bc
    ldrh r1, [sl, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and r2, r1, #0x1
    mla r1, r2, r4, r7
    add r1, r9, r1
    ldrh r1, [r1, #0x38]
    cmp r1, #0x0
    beq .L_bc
    bl func_0202eac8
    cmp r0, #0x0
    beq .L_bc
    ldrh r0, [sl, #0x2]
    mov r1, r8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b90a8
    cmp r0, #0x0
    beq .L_bc
    str r6, [sp]
    str r5, [sp, #0x4]
    ldrh r1, [sl, #0x2]
    ldrh r3, [sl]
    mov r0, sl
    mov r1, r1, lsl #0x1f
    mov r2, r8
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d5a08
.L_bc:
    add r8, r8, #0x1
    cmp r8, #0x4
    add r9, r9, #0x14
    ble .L_30
.L_cc:
    mov r0, fp
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
