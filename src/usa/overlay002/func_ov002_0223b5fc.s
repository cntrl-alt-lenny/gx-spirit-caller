; func_ov002_0223b5fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce85c
        .extern data_ov002_022cf08c
        .extern func_02031594
        .extern func_ov002_021b9dec
        .extern func_ov002_0223b340
        .global func_ov002_0223b5fc
        .arm
func_ov002_0223b5fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    mov sl, r0
    ldr r7, [r4, #0x69c]
    ldr r3, _LIT1
    mvn r0, #0x0
    cmp r7, r3
    str r0, [sp, #0x4]
    moveq r0, r2
    mov r5, #0x0
    cmpeq r0, #0x2
    ldr r7, [r4, #0x6a4]
    moveq r0, #0x7
    streq r0, [r4, #0x6b8]
    moveq r7, #0x2
    mov r9, r1
    str r2, [sp]
    mov r6, r5
    cmp r7, #0x0
    mov r4, #0x0
    ble .L_f0
    ldr r2, _LIT2
    ldr r0, _LIT3
    and r1, sl, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mla fp, r9, r0, r2
.L_70:
    ldr r0, _LIT0
    mov r1, sl
    add r0, r0, r4, lsl #0x2
    ldr r8, [r0, #0x6b4]
    mov r2, r9
    mov r0, r8
    bl func_ov002_0223b340
    cmp r0, #0x0
    strne r4, [sp, #0x4]
    addne r5, r5, #0x1
    bne .L_e4
    cmp r8, #0x14
    ble .L_e4
    ldr r0, _LIT0
    ldr r0, [r0, #0x6b0]
    cmp r0, #0x0
    bne .L_e4
    mov r0, sl
    mov r1, r9
    bl func_ov002_021b9dec
    bl func_02031594
    cmp r0, #0x0
    beq .L_e4
    ldr r0, [fp, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    streq r4, [sp, #0x4]
    addeq r5, r5, #0x1
    addeq r6, r6, #0x1
.L_e4:
    add r4, r4, #0x1
    cmp r4, r7
    blt .L_70
.L_f0:
    cmp r5, #0x0
    beq .L_158
    ldr r0, [sp]
    cmp r0, #0x0
    beq .L_14c
    cmp r5, #0x1
    ble .L_12c
    ldr r0, _LIT0
    cmp r5, r6
    ldr r1, [r0, #0x6a8]
    add r1, r1, #0x1
    str r1, [r0, #0x6a8]
    moveq r1, #0x1
    streq r1, [r0, #0x6b0]
    b .L_14c
.L_12c:
    ldr r1, _LIT4
    ldr r0, [sp, #0x4]
    mov r2, #0x0
    str r2, [r1, r0, lsl #0x2]
    cmp r6, #0x0
    ldrne r0, _LIT0
    movne r1, #0x1
    strne r1, [r0, #0x6b0]
.L_14c:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_158:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001a4e
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022ce85c
