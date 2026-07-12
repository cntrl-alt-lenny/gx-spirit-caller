; func_ov008_021aa5c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_0210586c
        .extern data_02105e6c
        .extern data_0210666c
        .extern data_ov008_021b2660
        .extern data_ov008_021b2670
        .extern data_ov008_021b2b60
        .extern func_02009a4c
        .extern func_02009a94
        .extern func_02009f34
        .extern func_02013964
        .extern func_02019000
        .extern func_020190f0
        .extern func_ov008_021aa510
        .global func_ov008_021aa5c4
        .arm
func_ov008_021aa5c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r7, _LIT0
    mov r9, #0x0
    bl func_02019000
    str r0, [sp]
    bl func_020190f0
    str r0, [sp, #0x4]
    bl func_02013964
    cmp r0, #0x8
    blt .L_5c
    ldr r0, _LIT1
    ldrh r0, [r0, #0x5c]
    tst r0, #0x8000
    bne .L_5c
    bl func_02009f34
    ldr r0, _LIT1
    ldrh r1, [r0, #0x5c]
    add r1, r1, #0x1
    strh r1, [r0, #0x5c]
    ldrh r1, [r0, #0x5c]
    orr r1, r1, #0x8000
    strh r1, [r0, #0x5c]
.L_5c:
    ldr r0, [sp, #0x4]
    bl func_02013964
    cmp r0, #0xb
    blt .L_9c
    ldr r0, _LIT1
    ldrh r0, [r0, #0x5c]
    tst r0, #0x4000
    bne .L_9c
    bl func_02009f34
    ldr r0, _LIT1
    ldrh r1, [r0, #0x5c]
    add r1, r1, #0x1
    strh r1, [r0, #0x5c]
    ldrh r1, [r0, #0x5c]
    orr r1, r1, #0x4000
    strh r1, [r0, #0x5c]
.L_9c:
    ldr sl, _LIT2
    ldr r5, _LIT3
    mov r8, #0x0
    mov r4, sl
    mov fp, #0x96
    mov r6, #0x1
.L_b4:
    add r0, r8, #0x1
    bl func_02009a4c
    ldr r0, [r5, #0xc]
    tst r0, r6, lsl r8
    beq .L_190
    add r0, r8, #0x1
    strh r0, [r7]
    strh fp, [r7, #0x8]
    ldr r0, [r4, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0xa
    bne .L_13c
    ldr r0, _LIT4
    mov r1, #0x0
    ldrh r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_110
    cmp r0, #0x1
    beq .L_118
    cmp r0, #0x2
    moveq r1, #0xf
    b .L_11c
.L_110:
    mov r1, #0x4
    b .L_11c
.L_118:
    mov r1, #0x9
.L_11c:
    rsb r0, r1, #0x64
    ldrh r1, [r7, #0x8]
    mul r2, r1, r0
    ldr r0, _LIT5
    smull r1, r3, r0, r2
    mov r0, r2, lsr #0x1f
    add r3, r0, r3, asr #0x5
    strh r3, [r7, #0x8]
.L_13c:
    add r0, sl, #0x1000
    ldrb r3, [r0, #0x56d]
    ldrb r2, [r0, #0x56c]
    ldr r1, [r0, #0x570]
    strh r3, [r7, #0xc]
    strh r2, [r7, #0xa]
    str r1, [r7, #0x18]
    ldr r2, [r0, #0x574]
    ldr r1, [r0, #0x578]
    str r2, [r7, #0x1c]
    str r1, [r7, #0x20]
    ldr r1, [r0, #0x57c]
    ldrb r0, [r0, #0x56f]
    str r1, [r7, #0x24]
    add r9, r9, #0x1
    str r0, [r7, #0x28]
    ldrh r0, [r7, #0xc]
    add r7, r7, #0x34
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r5, #0x564]
.L_190:
    add sl, sl, #0x1c
    add r8, r8, #0x1
    cmp r8, #0x1a
    blt .L_b4
    ldr r0, _LIT6
    ldr r1, [r0, #0x848]
    ldr r0, [sp]
    cmp r0, r1
    beq .L_214
    ldr r6, _LIT0
    ldr r5, _LIT2
    ldr r8, _LIT3
    mov r7, #0x0
    mov r4, #0x1
.L_1c8:
    ldr r0, [r8, #0xc]
    tst r0, r4, lsl r7
    beq .L_204
    add r0, r7, #0x1
    bl func_02009a94
    add r0, r5, #0x1000
    ldr r1, [r0, #0x570]
    ldr r2, [r0, #0x574]
    str r1, [r6, #0x18]
    ldr r1, [r0, #0x578]
    str r2, [r6, #0x1c]
    ldr r0, [r0, #0x57c]
    str r1, [r6, #0x20]
    str r0, [r6, #0x24]
    add r6, r6, #0x34
.L_204:
    add r7, r7, #0x1
    cmp r7, #0x1a
    add r5, r5, #0x1c
    blt .L_1c8
.L_214:
    ldr r0, _LIT7
    strh r9, [r0, #0x5a]
    bl func_ov008_021aa510
    ldr r1, _LIT6
    ldr r0, [sp]
    str r0, [r1, #0x848]
    ldr r0, [sp, #0x4]
    str r0, [r1, #0x84c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2670
_LIT1: .word data_0210666c
_LIT2: .word data_02104e6c
_LIT3: .word data_ov008_021b2660
_LIT4: .word data_0210586c
_LIT5: .word 0x51eb851f
_LIT6: .word data_02105e6c
_LIT7: .word data_ov008_021b2b60
