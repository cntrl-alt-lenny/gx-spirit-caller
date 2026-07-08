; func_ov002_021f2388 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b9dc4
        .extern func_ov002_021c194c
        .extern func_ov002_021c1e10
        .extern func_ov002_021c8400
        .extern func_ov002_02253600
        .global func_ov002_021f2388
        .arm
func_ov002_021f2388:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r3, [r6, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r5, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, _LIT0
    and r7, r5, #0x1
    mov ip, #0x14
    mul r3, r7, r3
    ldr r7, _LIT1
    mul ip, r4, ip
    add r7, r7, r3
    add r7, r7, ip
    ldr r7, [r7, #0x30]
    mov r7, r7, lsl #0x13
    movs r7, r7, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r7, _LIT2
    add r3, r7, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r6]
    ldr r1, _LIT3
    cmp r2, r1
    beq .L_b8
    ldr r0, _LIT4
    cmp r2, r0
    beq .L_d4
    add r0, r1, #0x2ec
    cmp r2, r0
    beq .L_158
    b .L_190
.L_b8:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8400
    cmp r0, #0x1
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_d4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8400
    strh r0, [r6, #0xc]
    ldrh r0, [r6, #0x2]
    ldr r5, _LIT0
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r3, r2, r5
    ldr r1, [r1, r3]
    mov r4, #0x0
    cmp r1, #0x0
    bls .L_150
    ldr r7, _LIT1
.L_114:
    ldrh r1, [r6]
    mov r2, r4
    bl func_ov002_02253600
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r0, [r6, #0x2]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r5, r7
    ldr r1, [r1, #0xc]
    cmp r4, r1
    bcc .L_114
.L_150:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_158:
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dc4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c194c
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_190:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x000017b0
_LIT4: .word 0x0000192b
_LIT5: .word data_ov002_022cf098
