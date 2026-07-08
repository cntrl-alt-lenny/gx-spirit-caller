; func_ov002_02238774 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd220
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae320
        .extern func_ov002_021e26d0
        .extern func_ov002_022591d0
        .extern func_ov002_0226afa4
        .extern func_ov002_0226ea6c
        .extern func_ov002_02271988
        .extern func_ov002_02290b8c
        .global func_ov002_02238774
        .arm
func_ov002_02238774:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r2, [r8, #0x2]
    ldr r0, _LIT0
    mov r1, r2, lsl #0x11
    ldr r0, [r0, #0x5a8]
    mov r2, r2, lsl #0x1f
    sub r0, r0, #0x77
    mov r1, r1, lsr #0x1f
    cmp r0, #0x9
    eor r4, r1, r2, lsr #0x1f
    addls pc, pc, r0, lsl #0x2
    b .L_1e0
    b .L_1cc
    b .L_1b8
    b .L_1e0
    b .L_1e0
    b .L_1e0
    b .L_1e0
    b .L_19c
    b .L_150
    b .L_108
    b .L_5c
.L_5c:
    ldrh r0, [r8, #0x8]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT1
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_f4
    ldr r0, _LIT3
    mov r9, #0x1
    add r7, r0, r1
    add r6, r7, #0x120
.L_9c:
    ldr r1, [r6]
    ldrh r3, [r8, #0x8]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov ip, r1, lsl #0x12
    mov r1, r0, lsl #0x1
    mov r0, r4
    mov r2, r9
    add r1, r1, ip, lsr #0x1f
    bl func_ov002_0226ea6c
    cmp r0, #0x0
    beq .L_e0
    mov r0, r4
    mov r1, #0x27
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_e0:
    ldr r0, [r7, #0xc]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_9c
.L_f4:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021e26d0
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_108:
    ldr r0, _LIT4
    ldrh r2, [r8, #0x8]
    ldrh r3, [r0, #0x16]
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1e
    bic r3, r3, #0x30
    orr r2, r3, r2, lsr #0x1a
    strh r2, [r0, #0x16]
    ldr r0, [r1, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_140
    mov r0, r4
    bl func_ov002_02290b8c
    b .L_148
.L_140:
    mov r0, #0x6
    bl func_ov002_022591d0
.L_148:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_150:
    ldr r0, _LIT6
    ldr r1, [r0, #0xd50]
    cmp r1, #0x0
    moveq r0, #0x80
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r0, #0xd64]
    cmp r0, #0x4
    cmpne r0, #0x6
    movne r0, #0x7f
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r2, [r8, #0x8]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    mov r1, #0x0
    add r2, r2, #0x1
    bl func_ov002_02271988
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_19c:
    ldr r0, _LIT4
    ldrh r0, [r0, #0x16]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    movne r0, #0x7f
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1b8:
    ldrh r1, [r8]
    rsb r0, r4, #0x1
    bl func_ov002_0226afa4
    mov r0, #0x77
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1cc:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021e26d0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1e0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022cd220
_LIT5: .word data_ov002_022cd664
_LIT6: .word data_ov002_022d008c
