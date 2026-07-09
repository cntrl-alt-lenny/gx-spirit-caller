; func_ov002_021fc728 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d008c
        .extern func_02030c28
        .extern func_ov002_021b45a4
        .extern func_ov002_021b4a84
        .global func_ov002_021fc728
        .arm
func_ov002_021fc728:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldrh r2, [r6, #0x2]
    movs r5, r1
    mov r0, r2, lsl #0x11
    mov r1, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r4, r0, r1, lsr #0x1f
    ldrh r0, [r6]
    beq .L_728
    bl func_02030c28
    mov r7, r0
    ldrh r0, [r5]
    bl func_02030c28
    cmp r7, r0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6]
    bl func_02030c28
    cmp r0, #0x2
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x1a
    mov ip, r1, lsr #0x1b
    cmp ip, #0x5
    bcc .L_7f4
    cmp ip, #0xa
    bhi .L_7f4
    mov r0, r0, lsl #0x1f
    mov r3, r0, lsr #0x1f
    mov r1, #0x14
    ldr r0, _LIT0
    ldr r2, _LIT1
    and r3, r3, #0x1
    mul r1, ip, r1
    mla r0, r3, r0, r2
    ldr r1, [r1, r0]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    beq .L_7f4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_728:
    bl func_02030c28
    cmp r0, #0x2
    bge .L_7f4
    ldrh r1, [r6]
    ldr r0, _LIT2
    cmp r1, r0
    ldrne r0, _LIT3
    cmpne r1, r0
    addne r0, r0, #0x75
    cmpne r1, r0
    beq .L_7f4
    ldrh r0, [r6, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x5
    bls .L_7b4
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x4
    mov r0, #0x0
    bhi .L_78c
    cmp r1, #0x6
    cmpne r1, #0x7
    cmpne r1, #0x8
    moveq r0, #0x1
.L_78c:
    cmp r0, #0x0
    bne .L_7b4
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp r4, r0
    ldreq r0, _LIT5
    moveq r1, #0x16
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7b4:
    ldr r0, _LIT5
    ldr r1, [r0, #0xcec]
    cmp r1, r4
    bne .L_7d4
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    cmpne r0, #0x4
    beq .L_7f4
.L_7d4:
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp r4, r0
    ldreq r0, _LIT5
    moveq r1, #0x16
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7f4:
    ldr r0, _LIT5
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    beq .L_840
    ldrh r1, [r6, #0x2]
    ldrh r0, [r6]
    mov r1, r1, lsl #0x14
    mov r1, r1, lsr #0x1a
    bl func_ov002_021b45a4
    cmp r0, #0x0
    bne .L_840
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    cmp r4, r0
    ldreq r0, _LIT5
    moveq r1, #0x15
    streq r1, [r0, #0xd80]
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_840:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1f
    cmpne r0, #0x20
    cmpne r0, #0x21
    bne .L_878
    cmp r5, #0x0
    bne .L_878
    ldrh r0, [r6]
    bl func_ov002_021b4a84
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_878:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word 0x0000131e
_LIT3: .word 0x000014d7
_LIT4: .word data_ov002_022cd65c
_LIT5: .word data_ov002_022d008c
