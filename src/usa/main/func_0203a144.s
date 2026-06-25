; func_0203a144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b234
        .extern data_0219b248
        .extern data_0219b2a4
        .extern data_0219c3a0
        .extern func_02038eec
        .extern func_0203a584
        .extern func_0203a88c
        .extern func_0203a900
        .extern func_02088f3c
        .extern func_02089178
        .extern func_020891dc
        .extern func_020892a4
        .extern func_02092660
        .extern func_020926d0
        .global func_0203a144
        .arm
func_0203a144:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r0
    mov r6, r1
    mov r5, r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, [sl, #0x4]
    ldr r1, _LIT1
    mov r0, r4, lsl #0x10
    ldr r2, [r1]
    mov r1, r0, lsr #0x10
    mov r0, #0xc
    mla r7, r1, r0, r2
    ldrh r0, [r7, #0x2]
    bl func_020892a4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r7, [r7, #0x4]
    mov r0, r7
    bl func_020891dc
    movs fp, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [fp]
    bl func_02088f3c
    cmp r5, #0x0
    beq .L_170
    ldr r1, _LIT2
    mov r2, #0x1
    ldr r0, _LIT3
    str r2, [r1]
    bl func_020926d0
    mov r0, sl
    bl func_0203a900
    mov r7, #0x0
.L_a4:
    add r0, fp, r7, lsl #0x1
    ldrh r0, [r0, #0x4]
    ldr r1, _LIT4
    cmp r0, r1
    beq .L_148
    bl func_02089178
    movs r8, r0
    bne .L_dc
    ldr r0, _LIT3
    bl func_02092660
    ldr r1, _LIT2
    mov r0, #0x0
    str r0, [r1]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dc:
    mov r9, #0x0
    ldr r4, _LIT4
    mov r6, #0x1
    mov r5, r9
.L_ec:
    add r1, sl, r9, lsl #0x2
    ldr r2, [r1, #0x14]
    cmp r2, r4
    beq .L_148
    ldr r0, [r8]
    mov r0, r0, lsl #0x8
    cmp r2, r0, lsr #0x8
    bne .L_140
    ldr r0, [r1, #0x34]
    cmp r0, #0x0
    beq .L_140
    ldrh r2, [sl, #0x54]
    orr r2, r2, r6, lsl r9
    strh r2, [sl, #0x54]
    str r5, [r1, #0x34]
    ldrb r1, [r0, #0x1c]
    sub r1, r1, #0x1
    strb r1, [r0, #0x1c]
    tst r1, #0xff
    bne .L_140
    bl func_0203a88c
.L_140:
    add r9, r9, #0x1
    b .L_ec
.L_148:
    add r7, r7, #0x1
    cmp r7, #0x4
    bcc .L_a4
    ldr r0, _LIT3
    bl func_02092660
    ldr r0, _LIT2
    mov r1, #0x0
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_170:
    ldrh r0, [sl, #0x54]
    mov r1, #0x0
.L_178:
    tst r0, #0x1
    beq .L_1b0
    mov r0, sl
    mov r2, r4
    bl func_02038eec
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_0203a584
    cmp r0, #0x0
    mov r0, #0x0
    strneh r0, [sl, #0x54]
    movne r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b0:
    add r1, r1, #0x1
    cmp r1, #0x8
    mov r0, r0, lsr #0x1
    bcc .L_178
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219c3a0
_LIT1: .word data_0219b234
_LIT2: .word data_0219b248
_LIT3: .word data_0219b2a4
_LIT4: .word 0x0000ffff
