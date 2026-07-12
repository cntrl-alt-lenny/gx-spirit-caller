; func_ov000_021ae590 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov000_021b55c0
        .extern data_ov000_021c74ac
        .extern data_ov000_021c74e4
        .extern func_020060f4
        .extern func_02006148
        .extern func_02006160
        .extern func_020371b8
        .extern func_ov000_021ac680
        .extern func_ov000_021ac690
        .extern func_ov000_021ae3cc
        .extern func_ov000_021ae548
        .global func_ov000_021ae590
        .arm
func_ov000_021ae590:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0x2a4]
    ldr r1, [r0, #0x2a8]
    mov r0, r3, lsl #0x9
    mov r3, r0, lsr #0x1e
    mov r0, #0x28
    mla r2, r3, r0, r2
    mov r0, r1, lsl #0x10
    add r7, r2, #0x8
    mov r4, r0, lsr #0x1c
    add r9, r3, #0x2
    ldr r6, _LIT2
    bl func_02006160
    cmp r0, #0x0
    bne .L_54
    bl func_02006148
    cmp r0, #0x0
    beq .L_188
.L_54:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_020060f4
    cmp r9, #0x0
    mov sl, #0x0
    ble .L_13c
    mov r5, #0x3a
    mvn r4, #0x0
    mov fp, sl
.L_78:
    add r0, r7, sl, lsl #0x3
    ldrsh r3, [r0, #0x2]
    ldr r2, [sp]
    mov r8, sl, lsl #0x3
    cmp r2, r3
    blt .L_130
    ldrsh r1, [r0, #0x6]
    add r1, r3, r1
    cmp r2, r1
    bge .L_130
    ldrsh r2, [r7, r8]
    ldr r1, [sp, #0x4]
    cmp r1, r2
    blt .L_130
    ldrsh r0, [r0, #0x4]
    add r0, r2, r0
    cmp r1, r0
    bge .L_130
    ldr r0, [r6, #0x26c]
    add r8, sl, #0x1
    orr r0, r0, #0x800
    str r0, [r6, #0x26c]
    bl func_ov000_021ae3cc
    bl func_02006160
    cmp r0, #0x0
    beq .L_118
    ldr r1, [r6, #0x270]
    and r0, r8, #0xff
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x1c
    bne .L_118
    ldr r1, [r6, #0x26c]
    mov r0, r5
    orr r8, r1, #0x1000
    mov r1, r4
    mov r2, fp
    mov r3, #0x1
    str r8, [r6, #0x26c]
    bl func_020371b8
    b .L_130
.L_118:
    ldr r1, [r6, #0x270]
    and r0, r8, #0xff
    bic r1, r1, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    str r0, [r6, #0x270]
.L_130:
    add sl, sl, #0x1
    cmp sl, r9
    blt .L_78
.L_13c:
    add r0, r6, #0x154
    bl func_ov000_021ac680
    cmp r0, #0x0
    beq .L_280
    ldr r1, [r6, #0x270]
    add r0, r6, #0x154
    bic r1, r1, #0xf000
    bic r1, r1, #0xff0000
    orr r1, r1, #0xff0000
    bic r1, r1, #-16777216
    orr r1, r1, #0x6000000
    str r1, [r6, #0x270]
    bl func_ov000_021ac690
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    b .L_280
.L_188:
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x40
    beq .L_1bc
    ldr r0, [r6, #0x26c]
    cmp r4, #0x1
    sub r4, r4, #0x1
    orr r0, r0, #0x800
    moveq r4, r9
    str r0, [r6, #0x26c]
    bl func_ov000_021ae3cc
    bl func_ov000_021ae548
    b .L_268
.L_1bc:
    tst r0, #0x80
    beq .L_1ec
    add r4, r4, #0x1
    add r0, r9, #0x1
    cmp r4, r0
    ldr r0, [r6, #0x26c]
    moveq r4, #0x1
    orr r0, r0, #0x800
    str r0, [r6, #0x26c]
    bl func_ov000_021ae3cc
    bl func_ov000_021ae548
    b .L_268
.L_1ec:
    tst r0, #0x1
    beq .L_204
    ldr r0, [r6, #0x26c]
    orr r0, r0, #0x1000
    str r0, [r6, #0x26c]
    b .L_268
.L_204:
    tst r0, #0x2
    beq .L_268
    ldr r0, [r6, #0x26c]
    mov r1, r0, lsl #0x9
    movs r1, r1, lsr #0x1e
    beq .L_228
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1e
    beq .L_268
.L_228:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r1, [r6, #0x270]
    ldr r0, [r6, #0x26c]
    bic r1, r1, #-16777216
    orr r1, r1, #0x6000000
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x15
    orr r1, r1, #0xff0000
    movs r0, r0, lsr #0x1e
    movne r4, #0x0
    str r1, [r6, #0x270]
    moveq r4, #0x2
.L_268:
    ldr r1, [r6, #0x270]
    and r0, r4, #0xff
    bic r1, r1, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    str r0, [r6, #0x270]
.L_280:
    ldr r0, [r6, #0x26c]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    ldr r0, [r6, #0x270]
    bic r0, r0, #0xff0000
    orr r1, r0, #0xff0000
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r6, #0x270]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov000_021c74ac
_LIT1: .word data_ov000_021b55c0
_LIT2: .word data_ov000_021c74e4
_LIT3: .word data_02104acc
