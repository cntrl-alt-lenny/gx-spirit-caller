; func_ov002_02240ab0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_0223dcc0
        .extern func_ov002_02240a10
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0228c81c
        .global func_ov002_02240ab0
        .arm
func_ov002_02240ab0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    ldr r2, _LIT0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r2, [r2, r1, lsl #0x2]
    cmp r2, #0x1
    bne .L_ec
    mvn r2, #0x0
    mov r3, r2
    str r2, [sp]
    bl func_ov002_0228c81c
    movs r5, r0
    movmi r0, #0x1
    ldmmiia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dcc0
    str r5, [sp]
    ldrh r1, [r4, #0x2]
    mvn r2, #0x0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r3, r2
    mov r1, r1, lsr #0x1f
    bl func_ov002_0228c81c
    movs r2, r0
    movmi r0, #0x1
    ldmmiia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_0223dcc0
    mvn r0, #0x0
    str r0, [sp]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    mov r3, #0x0
    bl func_ov002_0228c81c
    movs r2, r0
    movmi r0, #0x1
    ldmmiia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_0223dcc0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_ec:
    ldr r0, _LIT1
    ldr r0, [r0, #0x5b8]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_224
    b .L_118
    b .L_1cc
    b .L_154
    b .L_1cc
    b .L_190
    b .L_1cc
.L_118:
    mov r0, r1
    mov r1, #0x82
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_154:
    mov r0, r1
    mov r1, #0x83
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_190:
    mov r0, r1
    mov r1, #0x84
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1cc:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_20c
    ldr r1, _LIT3
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_20c:
    ldr r1, _LIT1
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_224:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd744
_LIT1: .word data_ov002_022ce288
_LIT2: .word func_ov002_02240a10
_LIT3: .word data_ov002_022d016c
