; func_ov011_021d2de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c64
        .extern data_ov011_021d480c
        .extern func_ov011_021d20e8
        .extern func_ov011_021d2118
        .global func_ov011_021d2de4
        .arm
func_ov011_021d2de4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    str r0, [sp]
    str r1, [sp, #0x4]
    ldr r0, _LIT0
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_ov011_021d2118
    mov r8, #0x0
    ldr r5, _LIT0
    ldr r4, _LIT1
    mov r7, r8
    mov r6, r8
    mov fp, r8
.L_38:
    ldr r1, [r4]
    ldmib r4, {r0, r2}
    umull r9, r3, r2, r1
    mla r3, r2, r0, r3
    ldr r0, [r4, #0xc]
    ldr sl, [sp, #0xc]
    mla r3, r0, r1, r3
    ldr r2, [r4, #0x10]
    ldr r0, [r4, #0x14]
    adds r1, r2, r9
    sub sl, sl, #0x4
    adc r0, r0, r3
    cmp sl, #0x0
    moveq r9, r0
    umullne r2, r9, r0, sl
    mlane r9, r0, r7, r9
    str r1, [r4]
    str r0, [r4, #0x4]
    mlane r9, r8, sl, r9
    ldr sl, [r4, #0x8]
    ldr ip, [sp, #0x8]
    umull r3, r2, sl, r1
    mla r2, sl, r0, r2
    sub r0, ip, #0x4
    ldr ip, [r4, #0x10]
    ldr sl, [r4, #0x14]
    adds r3, ip, r3
    ldr ip, [r4, #0xc]
    mla r2, ip, r1, r2
    adc sl, sl, r2
    stmia r4, {r3, sl}
    cmp r0, #0x0
    beq .L_cc
    umull r2, r1, sl, r0
    mla r1, sl, fp, r1
    mla r1, r6, r0, r1
    mov sl, r1
.L_cc:
    mov r0, r5
    add r1, r9, #0x2
    add r2, sl, #0x2
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_38
    mov r0, r5
    add r1, r9, #0x3
    add r2, sl, #0x2
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_38
    mov r0, r5
    add r1, r9, #0x1
    add r2, sl, #0x2
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_38
    mov r0, r5
    add r1, r9, #0x2
    add r2, sl, #0x3
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_38
    mov r0, r5
    add r1, r9, #0x2
    add r2, sl, #0x1
    bl func_ov011_021d20e8
    cmp r0, #0x0
    bne .L_38
    ldr r0, [sp]
    add r1, r9, #0x2
    str r1, [r0]
    ldr r0, [sp, #0x4]
    add r1, sl, #0x2
    str r1, [r0]
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov011_021d480c
_LIT1: .word data_02102c64
