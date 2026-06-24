; func_ov002_02231094 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021bc618
        .extern func_ov002_021ca2b8
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b054
        .extern func_ov002_0227adb8
        .global func_ov002_02231094
        .arm
func_ov002_02231094:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x6e
    bgt .L_28
    bge .L_174
    cmp r0, #0x64
    beq .L_190
    b .L_1a8
.L_28:
    sub r0, r0, #0x7c
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_1a8
    b .L_11c
    b .L_fc
    b .L_1a8
    b .L_d8
    b .L_4c
.L_4c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca2b8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc618
    cmp r0, #0x2
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x2
    ldrh r0, [r4, #0x2]
    bge .L_c0
    mov r0, r0, lsl #0x1f
    mov r1, #0x15
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x6e
    ldmia sp!, {r4, pc}
.L_c0:
    mov r0, r0, lsl #0x1f
    ldr r1, _LIT1
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_d8:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_fc:
    mov r1, #0x0
    ldr r0, _LIT2
    strh r1, [r4, #0x8]
    ldr r0, [r0, #0xd44]
    strh r0, [r4, #0xa]
    bl func_ov002_021e2b3c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_11c:
    ldrh r1, [r4, #0x8]
    ldrh r0, [r4, #0xa]
    cmp r1, r0
    bcs .L_168
    add r0, r1, #0x1
    bl func_ov002_021b004c
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227adb8
    ldrh r1, [r4, #0x8]
    mov r0, #0x7c
    add r1, r1, #0x1
    strh r1, [r4, #0x8]
    ldmia sp!, {r4, pc}
.L_168:
    bl func_ov002_021e2c5c
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_174:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_190:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_1a8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x0000011d
_LIT2: .word data_ov002_022d016c
