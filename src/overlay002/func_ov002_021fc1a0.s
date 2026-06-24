; func_ov002_021fc1a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_0202e340
        .extern func_0203158c
        .extern func_ov002_021b34f4
        .extern func_ov002_021b3618
        .extern func_ov002_021fc818
        .extern func_ov002_021fd270
        .extern func_ov002_0225753c
        .global func_ov002_021fc1a0
        .arm
func_ov002_021fc1a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r2, [r8, #0x2]
    ldr r0, _LIT0
    mov r7, r1
    mov r1, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, #0x4]
    eor r1, r1, r2, lsr #0x1f
    cmp r1, r0
    ldreq r0, _LIT1
    moveq r1, #0x4
    streq r1, [r0, #0xd80]
    ldrh r0, [r8]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r8, #0x2]
    ldr r0, _LIT2
    ldr r3, _LIT3
    bic r1, r1, #0x3000
    orr r1, r1, #0x3000
    strh r1, [r8, #0x2]
    ldrh r2, [r8, #0x2]
    mov r1, #0x14
    mov r4, r2, lsl #0x1f
    mov r4, r4, lsr #0x1f
    mov r2, r2, lsl #0x1a
    and r4, r4, #0x1
    mov r2, r2, lsr #0x1b
    mul r1, r2, r1
    mla r0, r4, r0, r3
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r8]
    bl func_ov002_0225753c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    beq .L_cc
    ldrh r0, [r8]
    bl func_0203158c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_cc:
    ldrh r0, [r8]
    bl func_0202e234
    cmp r0, #0x0
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1a
    beq .L_160
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_170
    ldrh r0, [r8]
    bl func_0202e340
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r8, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3618
    ldr r1, _LIT4
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r8, #0x2]
    mov r4, r0, asr #0x8
    and r0, r0, #0xff
    mov r2, r1, lsl #0x1f
    mov r3, r1, lsl #0x1a
    and r1, r4, #0xff
    mov r2, r2, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_021b34f4
    cmp r0, #0xb
    beq .L_170
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_160:
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    movcc r0, #0x0
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_170:
    ldr r6, _LIT5
    ldr r0, [r6, #0x5d4]
    cmp r0, #0x0
    bne .L_1b0
    mov r0, r8
    mov r1, r7
    bl func_ov002_021fc818
    cmp r0, #0x0
    beq .L_228
    mov r0, r8
    mov r1, r7
    bl func_ov002_021fd270
    cmp r0, #0x0
    beq .L_228
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b0:
    cmp r0, #0x0
    mov r5, #0x0
    bls .L_228
    mov r4, r6
    mov r9, r6
.L_1c4:
    ldrh r2, [r8, #0x2]
    ldrb r1, [r6, #0x5dc]
    add r0, r4, r5, lsl #0x2
    bic r2, r2, #0xfc0
    mov r1, r1, lsl #0x1a
    orr r1, r2, r1, lsr #0x14
    strh r1, [r8, #0x2]
    ldr r2, [r0, #0x5fc]
    mov r0, r8
    mov r1, r7
    str r2, [r8, #0x14]
    bl func_ov002_021fc818
    cmp r0, #0x0
    beq .L_214
    mov r0, r8
    mov r1, r7
    bl func_ov002_021fd270
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_214:
    ldr r0, [r9, #0x5d4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x1
    bcc .L_1c4
.L_228:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word data_ov002_022d016c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word 0x0000ffff
_LIT5: .word data_ov002_022ce288
