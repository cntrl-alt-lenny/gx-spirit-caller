; func_ov002_0228bcd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce58a
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_0202b8c0
        .extern func_0203158c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c3ae4
        .extern func_ov002_021c3b60
        .extern func_ov002_021fc1a0
        .extern func_ov002_021fc3e8
        .extern func_ov002_02259774
        .extern func_ov002_022819d4
        .extern func_ov002_02297050
        .global func_ov002_0228bcd0
        .arm
func_ov002_0228bcd0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x60
    ldr fp, [r1]
    mov sl, r0
    mov r0, fp
    str r1, [sp]
    mov r9, r2
    bl func_0202b878
    cmp r0, #0x17
    bne .L_1dc
    ldr r3, _LIT0
    mov r1, #0x0
    ldr r4, [r3, #0x480]
    cmp r4, #0x0
    ble .L_78
    ldr r2, _LIT1
.L_40:
    ldrh r0, [r2]
    mov r0, r0, lsl #0x1f
    cmp sl, r0, lsr #0x1f
    addeq r0, r3, #0x300
    ldreqh r0, [r0]
    cmpeq fp, r0
    addeq sp, sp, #0x60
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r1, r1, #0x1
    cmp r1, r4
    add r2, r2, #0x18
    add r3, r3, #0x18
    blt .L_40
.L_78:
    mov r0, fp
    bl func_0202b8c0
    cmp r0, #0x4
    bne .L_1dc
    ldr r1, _LIT2
    mov r0, sl
    bl func_ov002_021c3ae4
    cmp r0, #0x0
    beq .L_1dc
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    mov r1, sl, lsl #0x10
    add r6, r0, #0x64
    add r7, r0, #0x94
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    str r0, [sp, #0x8]
    and r0, r1, #0x1
    mov r5, #0x5
    str r0, [sp, #0xc]
    add r4, sp, #0x48
    mov r8, #0x0
.L_dc:
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp fp, r0
    ldreqh r0, [r6, #0x38]
    cmpeq r0, #0x0
    bne .L_1c8
    str r8, [r4]
    ldrh r1, [sp, #0x4a]
    ldr r0, [r7]
    str r8, [r4, #0x4]
    bic r2, r1, #0x1
    ldr r1, [sp, #0xc]
    str r8, [r4, #0x8]
    orr r1, r2, r1
    ldr r2, [sp, #0x8]
    strh r1, [sp, #0x4a]
    ldrh r1, [sp, #0x4a]
    strh r2, [sp, #0x48]
    mov r2, r5, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r1, r1, #0x3e
    mov r2, r2, lsl #0x1b
    orr r1, r1, r2, lsr #0x1a
    strh r1, [sp, #0x4a]
    mov r1, r0, lsl #0x2
    mov r2, r0, lsl #0x12
    mov r0, r1, lsr #0x18
    mov r0, r0, lsl #0x1
    add r0, r0, r2, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    ldrh r2, [sp, #0x4c]
    ldr r0, _LIT5
    str r8, [r4, #0xc]
    and r2, r2, r0
    mov r0, r1, lsl #0x17
    ldrh r1, [sp, #0x4a]
    orr r0, r2, r0, lsr #0x11
    strh r0, [sp, #0x4c]
    bic r1, r1, #0x4000
    strh r1, [sp, #0x4a]
    mov r0, r4
    mov r1, r9
    str r8, [r4, #0x10]
    str r8, [r4, #0x14]
    bl func_ov002_021fc3e8
    cmp r0, #0x0
    beq .L_1c8
    ldr r4, _LIT6
    mov r0, sl
    mov r1, r5
    mov r2, #0x0
    mov r3, #0x3
    str sl, [r4, #0xd6c]
    bl func_ov002_02259774
    add sp, sp, #0x60
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c8:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r6, r6, #0x14
    add r7, r7, #0x14
    blt .L_dc
.L_1dc:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_1e4:
    ldr r0, [sp, #0x4]
    ldr r2, _LIT3
    eor r5, sl, r0
    ldr r0, _LIT4
    and r1, r5, #0x1
    mla r6, r1, r0, r2
    mov r1, r5, lsl #0x10
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    str r0, [sp, #0x10]
    and r0, r1, #0x1
    add r7, r6, #0x30
    mov r8, #0x0
    str r0, [sp, #0x14]
    add r4, sp, #0x30
.L_224:
    mov r0, r5
    mov r1, r8
    bl func_ov002_021b9ecc
    cmp fp, r0
    bne .L_388
    cmp r5, sl
    beq .L_258
    mov r0, fp
    bl func_0203158c
    cmp r0, #0x0
    ldrneh r0, [r6, #0x38]
    cmpne r0, #0x0
    beq .L_388
.L_258:
    mov r0, #0x0
    str r0, [r4]
    ldrh r2, [sp, #0x32]
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    str r0, [r4, #0xc]
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    ldr r0, [sp, #0x10]
    bic r2, r2, #0x1
    strh r0, [sp, #0x30]
    mov r0, r8, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, [sp, #0x14]
    cmp r5, sl
    orr r0, r2, r0
    strh r0, [sp, #0x32]
    ldrh r3, [sp, #0x32]
    mov r0, r1, lsl #0x1b
    ldrh r1, [sp, #0x34]
    bic r3, r3, #0x3e
    orr r0, r3, r0, lsr #0x1a
    strh r0, [sp, #0x32]
    ldr r0, _LIT5
    ldr r2, [r7]
    and r1, r1, r0
    mov r0, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r0, r2, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp, #0x34]
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x10
    ldrh r2, [sp, #0x32]
    mov r0, r0, lsr #0x10
    mov r1, r0, lsl #0x1f
    ldrh r0, [r6, #0x38]
    bic r2, r2, #0x4000
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp, #0x32]
    cmp r0, #0x0
    mov r0, r4
    mov r1, r9
    beq .L_328
    bl func_ov002_021fc1a0
    b .L_32c
.L_328:
    bl func_ov002_021fc3e8
.L_32c:
    cmp r0, #0x0
    beq .L_388
    mov r0, r4
    bl func_ov002_02297050
    cmp r0, #0x0
    bne .L_388
    ldr r2, [sp]
    mov r0, r4
    ldr r2, [r2, #0x4]
    mov r1, r9
    blx r2
    cmp r0, #0x0
    beq .L_388
    ldr r4, _LIT6
    mov r0, r5
    mov r1, r8
    mov r2, #0x0
    mov r3, #0x3
    str sl, [r4, #0xd6c]
    bl func_ov002_02259774
    add sp, sp, #0x60
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_388:
    add r6, r6, #0x14
    add r7, r7, #0x14
    add r8, r8, #0x1
    cmp r8, #0xa
    ble .L_224
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_1e4
    ldr r0, [sp]
    ldr r1, [r0]
    mov r0, sl
    bl func_ov002_021c3b60
    movs r4, r0
    bmi .L_4d8
    mov r0, sl
    bl func_ov002_022819d4
    cmp r0, #0x0
    beq .L_4d8
    ldr r2, _LIT3
    ldr r0, _LIT4
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x120
    ldr r5, [r0, r4, lsl #0x2]
    mov r0, sl, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r5, lsl #0x2
    mov r2, r0, lsr #0x18
    add r0, sp, #0x18
    mov r3, #0x0
    str r3, [r0]
    ldrh r6, [sp, #0x1a]
    and r1, r1, #0x1
    mov r5, r5, lsl #0x12
    bic r6, r6, #0x1
    orr r1, r6, r1
    strh r1, [sp, #0x1a]
    ldrh r1, [sp, #0x1a]
    mov r2, r2, lsl #0x1
    str r3, [r0, #0x4]
    add r2, r2, r5, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r5, r2, lsr #0x10
    bic r1, r1, #0x3e
    orr r2, r1, #0x16
    ldrh r6, [sp, #0x1c]
    ldr r1, _LIT5
    mov r5, r5, lsl #0x17
    and r1, r6, r1
    orr r5, r1, r5, lsr #0x11
    mov r1, r9
    str r3, [r0, #0x8]
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    str r3, [r0, #0x14]
    strh fp, [sp, #0x18]
    strh r2, [sp, #0x1a]
    strh r5, [sp, #0x1c]
    bl func_ov002_021fc3e8
    cmp r0, #0x0
    beq .L_4d8
    add r0, sp, #0x18
    bl func_ov002_02297050
    cmp r0, #0x0
    bne .L_4d8
    ldr r0, [sp]
    mov r1, r9
    ldr r2, [r0, #0x4]
    add r0, sp, #0x18
    blx r2
    cmp r0, #0x0
    beq .L_4d8
    ldr r5, _LIT6
    mov r0, sl
    mov r2, r4
    mov r1, #0xb
    mov r3, #0x3
    str sl, [r5, #0xd6c]
    bl func_ov002_02259774
    add sp, sp, #0x60
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4d8:
    mov r0, #0x0
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022ce58a
_LIT2: .word 0x000019a3
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
_LIT5: .word 0xffff803f
_LIT6: .word data_ov002_022d016c
