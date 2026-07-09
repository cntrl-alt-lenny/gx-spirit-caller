; func_ov002_021de044 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202e274
        .extern func_ov002_021b2fcc
        .extern func_ov002_021b3dec
        .extern func_ov002_021ca43c
        .extern func_ov002_021dbe24
        .extern func_ov002_021dbea8
        .extern func_ov002_021dd860
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021fe2e4
        .global func_ov002_021de044
        .arm
func_ov002_021de044:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    ldr r6, _LIT0
    mov fp, r3
    mov r5, r0
    ldr r0, [r6, #0xd4]
    mov r4, r2
    ands r7, fp, #0x2
    movne r3, #0x1
    str r0, [sp, #0x10]
    moveq r3, #0x0
    mov r0, r5
    mov r2, r4
    bl func_ov002_021dbe24
    mov r8, r0
    cmp r7, #0x0
    mov r9, #0x0
    beq .L_22a0
    str r9, [sp, #0x14]
.L_21e8:
    ldr r0, _LIT0
    mov r7, #0x0
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x14]
    eor r6, r1, r0
    mov sl, r6, lsl #0x4
    str sl, [sp, #0xc]
.L_2204:
    mov r0, #0x1
    tst r8, r0, lsl sl
    beq .L_222c
    ldr r2, _LIT1
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b2fcc
    cmp r0, #0x0
    movne r0, #0x1
    orrne r9, r9, r0, lsl sl
.L_222c:
    add sl, sl, #0x1
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_2204
    ldrh r0, [r5]
    cmp r0, #0x0
    beq .L_228c
    ldr r0, [sp, #0xc]
    mov sl, #0x5
    add r7, r0, #0x5
.L_2254:
    mov r0, #0x1
    tst r8, r0, lsl r7
    beq .L_227c
    ldr r2, _LIT2
    mov r0, r6
    mov r1, sl
    bl func_ov002_021b3dec
    cmp r0, #0x0
    movne r0, #0x1
    orrne r9, r9, r0, lsl r7
.L_227c:
    add r7, r7, #0x1
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_2254
.L_228c:
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x2
    blt .L_21e8
.L_22a0:
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_22a8:
    ldr r0, _LIT0
    mov sl, #0x0
    ldr r1, [r0, #0xcec]
    ldr r0, [sp, #0x4]
    eor r7, r1, r0
    mov r6, r7, lsl #0x4
.L_22c0:
    mov r0, #0x1
    tst r8, r0, lsl r6
    beq .L_22f8
    ldrh r0, [r5, #0x2]
    mov r1, sl
    mov r2, fp
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r0, #0x1
    moveq r0, #0x0
    str r0, [sp]
    ldrh r3, [r5]
    mov r0, r7
    bl func_ov002_021dbea8
.L_22f8:
    add r6, r6, #0x1
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_22c0
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_22a8
    ldr r0, _LIT0
    ldr r0, [r0, #0xd4]
    cmp r0, #0x0
    beq .L_2444
    bl func_ov002_021fe2e4
    bl func_ov002_021ca43c
    ldr r1, _LIT0
    str r0, [r1, #0xd8]
    bl func_ov002_021e2a4c
    ldr r0, [sp, #0x10]
    eor r2, r8, r9
    ldr r1, _LIT0
    orr r0, r0, r2
    str r0, [r1, #0xd4]
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_235c:
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x8]
    ldr r1, _LIT4
    eor r9, r3, r0
    and r0, r9, #0x1
    mla r1, r0, r1, r2
    mov r6, r9, lsl #0x4
    add r7, r1, #0x30
    mov sl, #0x0
.L_2388:
    mov r0, #0x1
    tst r8, r0, lsl r6
    beq .L_2418
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e274
    cmp r0, #0x0
    beq .L_23bc
    cmp r4, #0xb
    cmpne r4, #0xd
    moveq r2, #0xc
    beq .L_23c0
.L_23bc:
    mov r2, r4
.L_23c0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd4]
    mov r0, #0x1
    mvn r0, r0, lsl r6
    and r1, r1, r0
    ldr r0, _LIT0
    str r1, [r0, #0xd4]
    ldrh r0, [r5, #0x2]
    ldrh ip, [r5]
    mov r1, r0, lsl #0x1f
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    cmp r9, r0
    movne r0, #0x1
    moveq r0, #0x0
    add r0, fp, r0
    add r3, r0, #0x10000
    mov r0, r9
    mov r1, sl
    str ip, [sp]
    bl func_ov002_021dd860
.L_2418:
    add r6, r6, #0x1
    add r7, r7, #0x14
    add sl, sl, #0x1
    cmp sl, #0xa
    ble .L_2388
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x2
    blt .L_235c
    bl func_ov002_021e2b6c
.L_2444:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd4]
    ldr r0, [sp, #0x10]
    eor r0, r1, r0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00001825
_LIT2: .word 0x00001513
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00000868
