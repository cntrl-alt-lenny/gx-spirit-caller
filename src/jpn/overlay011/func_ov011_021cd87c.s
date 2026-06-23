; func_ov011_021cd87c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_ov011_021cd63c
        .extern func_ov011_021d2b9c
        .extern func_ov011_021d2ba4
        .extern func_ov011_021d2bb8
        .extern func_ov011_021d2c14
        .extern func_ov011_021d2c28
        .extern func_ov011_021d2c38
        .extern func_ov011_021d2c4c
        .extern func_ov011_021d2c54
        .global func_ov011_021cd87c
        .arm
func_ov011_021cd87c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r3, [r1, #0x2ac]
    ldr r8, [r1, #0x2dc]
    bic r3, r3, #0x20000
    str r3, [r1, #0x2ac]
    str r2, [r1, #0x254]
    str r2, [r1, #0x268]
    mov r4, r0
    ldr r1, [r1, #0x258]
    ldr r0, [r4]
    ldr r7, _LIT1
    cmp r1, r0
    ldreq r1, [r7, #0x220]
    ldreq r0, [r4, #0x4]
    cmpeq r1, r0
    addeq sp, sp, #0x34
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r7, #0x2a0]
    ldr r1, [r7, #0x21c]
    ldr r2, [r7, #0x220]
    bl func_ov011_021d2b9c
    ldr r0, [r7, #0x2a0]
    ldmia r4, {r1, r2}
    bl func_ov011_021d2bb8
    mov r0, r8
    bl func_ov011_021d2c38
    mov r0, r8
    bl func_ov011_021d2c28
    cmp r0, #0x0
    addeq sp, sp, #0x34
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r7, #0x270]
    mov r0, r8
    orr r1, r1, #0x20000
    str r1, [r7, #0x270]
    bl func_ov011_021d2c4c
    mov r9, r0
    cmp r9, #0x1
    cmpne r9, #0x2
    bne .L_348
    add r0, r7, #0x214
    mov r1, #0x3
    .word 0xebff9734
    add r1, sp, #0x28
    add r2, sp, #0x2c
    mov r0, r8
    bl func_ov011_021d2ba4
    add r1, sp, #0x10
    add r2, sp, #0x14
    mov r0, r8
    bl func_ov011_021d2c14
    mov r0, #0x0
    str r0, [sp, #0x30]
    str r0, [sp, #0x18]
    str r0, [sp, #0x24]
    ldr r1, [sp, #0x28]
    ldr r0, [sp, #0x10]
    ldr r2, [sp, #0x2c]
    add r0, r1, r0
    ldr r1, [sp, #0x14]
    mov r0, r0, asr #0x1
    str r0, [sp, #0x1c]
    mov r0, #0x1000
    add r1, r2, r1
    str r0, [sp]
    mov r0, r1, asr #0x1
    add r1, sp, #0x28
    str r0, [sp, #0x20]
    ldr r0, [r7, #0x214]
    ldmia r1, {r1, r2, r3}
    .word 0xebff9730
    mov r0, #0x1000
    str r0, [sp]
    add r1, sp, #0x1c
    ldr r0, [r7, #0x214]
    ldmia r1, {r1, r2, r3}
    .word 0xebff972a
    mov r0, #0x1000
    str r0, [sp]
    add r1, sp, #0x10
    ldr r0, [r7, #0x214]
    ldmia r1, {r1, r2, r3}
    .word 0xebff9724
    b .L_404
.L_348:
    mov r1, r9
    add r0, r7, #0x214
    .word 0xebff9708
    cmp r9, #0x0
    mov sl, #0x0
    ble .L_404
    sub r6, r9, #0x1
    add r5, sp, #0x4
    add r4, sp, #0x8
    mov fp, sl
.L_370:
    cmp sl, r6
    bne .L_38c
    mov r0, r8
    mov r1, r5
    mov r2, r4
    bl func_ov011_021d2c14
    b .L_3e0
.L_38c:
    cmp sl, #0x0
    mov r0, r8
    bne .L_3a8
    mov r1, r5
    mov r2, r4
    bl func_ov011_021d2ba4
    b .L_3e0
.L_3a8:
    mov r1, sl
    mov r2, r5
    mov r3, r4
    bl func_ov011_021d2c54
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0x4
    mov r0, r0, lsl #0x4
    add r1, r1, #0x8
    add r0, r0, #0x8
    mov r1, r1, lsl #0xc
    mov r0, r0, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_3e0:
    str fp, [sp, #0xc]
    mov r0, #0x1000
    str r0, [sp]
    ldr r0, [r7, #0x214]
    ldmia r5, {r1, r2, r3}
    .word 0xebff96f7
    add sl, sl, #0x1
    cmp sl, r9
    blt .L_370
.L_404:
    ldr r0, [r7, #0x214]
    mov r1, #0x1
    .word 0xebff96f9
    bl func_ov011_021cd63c
    str r0, [r7, #0x22c]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
