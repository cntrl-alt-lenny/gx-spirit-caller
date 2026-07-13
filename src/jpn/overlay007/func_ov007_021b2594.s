; func_ov007_021b2594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c95b4
        .extern data_02104acc
        .extern data_ov007_0223342c
        .extern func_020221e0
        .extern func_020221f8
        .extern func_020371b8
        .extern func_ov007_021b289c
        .extern func_ov007_021b2a74
        .extern func_ov007_021b2b44
        .extern func_ov007_021b2b58
        .extern func_ov007_021b2bf8
        .global func_ov007_021b2594
        .arm
func_ov007_021b2594:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, #0x0
    ldrh r2, [r1, #0x54]
    mov r6, r0
    mov r4, r5
    tst r2, #0x2
    ldrh r0, [r1, #0x52]
    ldrh r1, [r1, #0x58]
    beq .L_148
    mov r0, r5
    bl func_020221f8
    orr r1, r0, #0x8000
    mov r0, r5
    bl func_020221e0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_148:
    tst r2, #0x1
    beq .L_190
    ldr r1, [r6, #0x48]
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r6, #0x3c]
    ldr r2, [r6, #0x40]
    ldr r3, [r6, #0x44]
    bl func_ov007_021b2b58
    ldr r1, [r6, #0x3c]
    ldr r2, [r6, #0x40]
    ldr r0, _LIT1
    bl func_ov007_021b2bf8
    mvn r1, #0x0
    mov r2, r5
    mov r3, #0x1
    bl func_020371b8
    b .L_2e0
.L_190:
    tst r2, #0x400
    beq .L_1c0
    ldr r0, [r6, #0x44]
    add r0, r0, #0x1
    str r0, [r6, #0x44]
    cmp r0, #0x3
    strge r5, [r6, #0x44]
    ldr r1, [r6, #0x44]
    ldr r0, _LIT1
    bl func_ov007_021b2b44
    mov r5, #0x1
    b .L_2e0
.L_1c0:
    tst r2, #0x800
    beq .L_1dc
    ldr r0, [r6, #0x48]
    mov r5, #0x1
    rsb r0, r0, #0x1
    str r0, [r6, #0x48]
    b .L_2e0
.L_1dc:
    tst r0, #0x4
    beq .L_250
    tst r1, #0x30
    beq .L_250
    ldr r2, _LIT2
.L_1f0:
    ldrsh r0, [r2]
    cmp r0, #0x0
    addge r2, r2, #0x18
    addge r5, r5, #0x1
    bge .L_1f0
    tst r1, #0x20
    beq .L_224
    ldr r0, [r6, #0x4c]
    subs r0, r0, #0x1
    str r0, [r6, #0x4c]
    submi r0, r5, #0x1
    strmi r0, [r6, #0x4c]
    b .L_244
.L_224:
    tst r1, #0x10
    beq .L_244
    ldr r0, [r6, #0x4c]
    add r0, r0, #0x1
    str r0, [r6, #0x4c]
    cmp r0, r5
    movge r0, #0x0
    strge r0, [r6, #0x4c]
.L_244:
    mov r5, #0x1
    mov r4, r5
    b .L_2e0
.L_250:
    tst r1, #0xf0
    beq .L_2e0
    tst r1, #0x20
    beq .L_278
    ldr r0, [r6, #0x3c]
    subs r0, r0, #0x1
    str r0, [r6, #0x3c]
    movmi r0, #0x12
    strmi r0, [r6, #0x3c]
    b .L_2dc
.L_278:
    tst r1, #0x10
    beq .L_29c
    ldr r0, [r6, #0x3c]
    add r0, r0, #0x1
    str r0, [r6, #0x3c]
    cmp r0, #0x13
    movge r0, #0x0
    strge r0, [r6, #0x3c]
    b .L_2dc
.L_29c:
    tst r1, #0x40
    beq .L_2bc
    ldr r0, [r6, #0x40]
    subs r0, r0, #0x1
    str r0, [r6, #0x40]
    movmi r0, #0x2
    strmi r0, [r6, #0x40]
    b .L_2dc
.L_2bc:
    tst r1, #0x80
    beq .L_2dc
    ldr r0, [r6, #0x40]
    add r0, r0, #0x1
    str r0, [r6, #0x40]
    cmp r0, #0x3
    movge r0, #0x0
    strge r0, [r6, #0x40]
.L_2dc:
    mov r5, #0x1
.L_2e0:
    cmp r5, #0x0
    beq .L_2f0
    mov r0, r6
    bl func_ov007_021b289c
.L_2f0:
    cmp r4, #0x0
    beq .L_314
    ldr r1, [r6, #0x4c]
    mov r0, #0x18
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, _LIT1
    ldrsh r1, [r1, r2]
    bl func_ov007_021b2a74
.L_314:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104acc
_LIT1: .word data_ov007_0223342c
_LIT2: .word data_020c95b4
