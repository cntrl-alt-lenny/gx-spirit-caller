; func_ov008_021aa6a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_0210594c
        .extern data_02105f4c
        .extern data_0210674c
        .extern data_ov008_021b2780
        .extern data_ov008_021b2790
        .extern data_ov008_021b2c80
        .extern func_02009a68
        .extern func_02009ab0
        .extern func_02009f50
        .extern func_02013998
        .extern func_02019034
        .extern func_02019124
        .extern func_ov008_021aa5f0
        .global func_ov008_021aa6a4
        .arm
func_ov008_021aa6a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r7, _LIT0
    mov r9, #0x0
    bl func_02019034
    str r0, [sp]
    bl func_02019124
    str r0, [sp, #0x4]
    bl func_02013998
    cmp r0, #0x8
    blt .L_110
    ldr r0, _LIT1
    ldrh r0, [r0, #0x5c]
    tst r0, #0x8000
    bne .L_110
    bl func_02009f50
    ldr r0, _LIT1
    ldrh r1, [r0, #0x5c]
    add r1, r1, #0x1
    strh r1, [r0, #0x5c]
    ldrh r1, [r0, #0x5c]
    orr r1, r1, #0x8000
    strh r1, [r0, #0x5c]
.L_110:
    ldr r0, [sp, #0x4]
    bl func_02013998
    cmp r0, #0xb
    blt .L_150
    ldr r0, _LIT1
    ldrh r0, [r0, #0x5c]
    tst r0, #0x4000
    bne .L_150
    bl func_02009f50
    ldr r0, _LIT1
    ldrh r1, [r0, #0x5c]
    add r1, r1, #0x1
    strh r1, [r0, #0x5c]
    ldrh r1, [r0, #0x5c]
    orr r1, r1, #0x4000
    strh r1, [r0, #0x5c]
.L_150:
    ldr sl, _LIT2
    ldr r5, _LIT3
    mov r8, #0x0
    mov r4, sl
    mov fp, #0x96
    mov r6, #0x1
.L_168:
    add r0, r8, #0x1
    bl func_02009a68
    ldr r0, [r5, #0xc]
    tst r0, r6, lsl r8
    beq .L_244
    add r0, r8, #0x1
    strh r0, [r7]
    strh fp, [r7, #0x8]
    ldr r0, [r4, #0xa64]
    and r0, r0, #0x1f00000
    mov r0, r0, lsr #0x14
    cmp r0, #0xa
    bne .L_1f0
    ldr r0, _LIT4
    mov r1, #0x0
    ldrh r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_1c4
    cmp r0, #0x1
    beq .L_1cc
    cmp r0, #0x2
    moveq r1, #0xf
    b .L_1d0
.L_1c4:
    mov r1, #0x4
    b .L_1d0
.L_1cc:
    mov r1, #0x9
.L_1d0:
    rsb r0, r1, #0x64
    ldrh r1, [r7, #0x8]
    mul r2, r1, r0
    ldr r0, _LIT5
    smull r1, r3, r0, r2
    mov r0, r2, lsr #0x1f
    add r3, r0, r3, asr #0x5
    strh r3, [r7, #0x8]
.L_1f0:
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
.L_244:
    add sl, sl, #0x1c
    add r8, r8, #0x1
    cmp r8, #0x1a
    blt .L_168
    ldr r0, _LIT6
    ldr r1, [r0, #0x848]
    ldr r0, [sp]
    cmp r0, r1
    beq .L_2c8
    ldr r6, _LIT0
    ldr r5, _LIT2
    ldr r8, _LIT3
    mov r7, #0x0
    mov r4, #0x1
.L_27c:
    ldr r0, [r8, #0xc]
    tst r0, r4, lsl r7
    beq .L_2b8
    add r0, r7, #0x1
    bl func_02009ab0
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
.L_2b8:
    add r7, r7, #0x1
    cmp r7, #0x1a
    add r5, r5, #0x1c
    blt .L_27c
.L_2c8:
    ldr r0, _LIT7
    strh r9, [r0, #0x5a]
    bl func_ov008_021aa5f0
    ldr r1, _LIT6
    ldr r0, [sp]
    str r0, [r1, #0x848]
    ldr r0, [sp, #0x4]
    str r0, [r1, #0x84c]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov008_021b2790
_LIT1: .word data_0210674c
_LIT2: .word data_02104f4c
_LIT3: .word data_ov008_021b2780
_LIT4: .word data_0210594c
_LIT5: .word 0x51eb851f
_LIT6: .word data_02105f4c
_LIT7: .word data_ov008_021b2c80
