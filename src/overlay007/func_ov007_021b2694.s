; func_ov007_021b2694 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c9694
        .extern data_02104bac
        .extern data_ov007_0223352c
        .extern func_02022234
        .extern func_0202224c
        .extern func_02037208
        .extern func_ov007_021b299c
        .extern func_ov007_021b2b74
        .extern func_ov007_021b2c44
        .extern func_ov007_021b2c58
        .extern func_ov007_021b2cf8
        .global func_ov007_021b2694
        .arm
func_ov007_021b2694:
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
    beq .L_b0
    mov r0, r5
    bl func_0202224c
    orr r1, r0, #0x8000
    mov r0, r5
    bl func_02022234
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_b0:
    tst r2, #0x1
    beq .L_f8
    ldr r1, [r6, #0x48]
    ldr r0, _LIT1
    str r1, [sp]
    ldr r1, [r6, #0x3c]
    ldr r2, [r6, #0x40]
    ldr r3, [r6, #0x44]
    bl func_ov007_021b2c58
    ldr r1, [r6, #0x3c]
    ldr r2, [r6, #0x40]
    ldr r0, _LIT1
    bl func_ov007_021b2cf8
    mvn r1, #0x0
    mov r2, r5
    mov r3, #0x1
    bl func_02037208
    b .L_248
.L_f8:
    tst r2, #0x400
    beq .L_128
    ldr r0, [r6, #0x44]
    add r0, r0, #0x1
    str r0, [r6, #0x44]
    cmp r0, #0x3
    strge r5, [r6, #0x44]
    ldr r1, [r6, #0x44]
    ldr r0, _LIT1
    bl func_ov007_021b2c44
    mov r5, #0x1
    b .L_248
.L_128:
    tst r2, #0x800
    beq .L_144
    ldr r0, [r6, #0x48]
    mov r5, #0x1
    rsb r0, r0, #0x1
    str r0, [r6, #0x48]
    b .L_248
.L_144:
    tst r0, #0x4
    beq .L_1b8
    tst r1, #0x30
    beq .L_1b8
    ldr r2, _LIT2
.L_158:
    ldrsh r0, [r2]
    cmp r0, #0x0
    addge r2, r2, #0x18
    addge r5, r5, #0x1
    bge .L_158
    tst r1, #0x20
    beq .L_18c
    ldr r0, [r6, #0x4c]
    subs r0, r0, #0x1
    str r0, [r6, #0x4c]
    submi r0, r5, #0x1
    strmi r0, [r6, #0x4c]
    b .L_1ac
.L_18c:
    tst r1, #0x10
    beq .L_1ac
    ldr r0, [r6, #0x4c]
    add r0, r0, #0x1
    str r0, [r6, #0x4c]
    cmp r0, r5
    movge r0, #0x0
    strge r0, [r6, #0x4c]
.L_1ac:
    mov r5, #0x1
    mov r4, r5
    b .L_248
.L_1b8:
    tst r1, #0xf0
    beq .L_248
    tst r1, #0x20
    beq .L_1e0
    ldr r0, [r6, #0x3c]
    subs r0, r0, #0x1
    str r0, [r6, #0x3c]
    movmi r0, #0x12
    strmi r0, [r6, #0x3c]
    b .L_244
.L_1e0:
    tst r1, #0x10
    beq .L_204
    ldr r0, [r6, #0x3c]
    add r0, r0, #0x1
    str r0, [r6, #0x3c]
    cmp r0, #0x13
    movge r0, #0x0
    strge r0, [r6, #0x3c]
    b .L_244
.L_204:
    tst r1, #0x40
    beq .L_224
    ldr r0, [r6, #0x40]
    subs r0, r0, #0x1
    str r0, [r6, #0x40]
    movmi r0, #0x2
    strmi r0, [r6, #0x40]
    b .L_244
.L_224:
    tst r1, #0x80
    beq .L_244
    ldr r0, [r6, #0x40]
    add r0, r0, #0x1
    str r0, [r6, #0x40]
    cmp r0, #0x3
    movge r0, #0x0
    strge r0, [r6, #0x40]
.L_244:
    mov r5, #0x1
.L_248:
    cmp r5, #0x0
    beq .L_258
    mov r0, r6
    bl func_ov007_021b299c
.L_258:
    cmp r4, #0x0
    beq .L_27c
    ldr r1, [r6, #0x4c]
    mov r0, #0x18
    mul r2, r1, r0
    ldr r1, _LIT2
    ldr r0, _LIT1
    ldrsh r1, [r1, r2]
    bl func_ov007_021b2b74
.L_27c:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104bac
_LIT1: .word data_ov007_0223352c
_LIT2: .word data_020c9694
