; func_ov005_021ab3e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_PostLocked
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov005_021b1ddc
        .extern func_02001bc8
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_0208dd9c
        .extern func_0208de4c
        .extern func_0208deec
        .extern func_0208df40
        .extern func_0208df94
        .extern func_0208e0a0
        .extern func_0208e1ac
        .extern func_0208e200
        .extern func_02094504
        .extern func_020945f4
        .extern func_ov005_021ab0fc
        .extern func_ov005_021ab6ac
        .extern func_ov005_021abc88
        .global func_ov005_021ab3e8
        .arm
func_ov005_021ab3e8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r5, r0
    mov r4, r2
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x70
    mov r6, r3
    bl Fill32
    ldr r0, [sp, #0x1c]
    str r7, [r5]
    str r0, [r5, #0x6c]
    ldrh r2, [r5, #0x5c]
    mov r1, #0x0
    mov r0, r6, lsl #0x10
    bic r2, r2, #0x3c0
    orr r2, r2, #0x40
    strh r2, [r5, #0x5c]
    str r1, [r5, #0x4]
    str r1, [r5, #0x8]
    ldrsh r2, [r4]
    mov r0, r0, lsr #0x10
    ldr r1, [sp, #0x18]
    strh r2, [r5, #0xc]
    ldrsh r2, [r4, #0x2]
    and r0, r0, #0x3
    strh r2, [r5, #0xe]
    ldrsh r2, [r4, #0x4]
    strh r2, [r5, #0x10]
    ldrsh r2, [r4, #0x6]
    strh r2, [r5, #0x12]
    strh r1, [r5, #0x24]
    ldrsh r2, [r4, #0x4]
    ldrsh r1, [r4]
    sub r1, r2, r1
    add r1, r1, #0x7
    mov r1, r1, asr #0x3
    strh r1, [r5, #0x14]
    ldrsh r2, [r4, #0x6]
    ldrsh r1, [r4, #0x2]
    sub r1, r2, r1
    add r1, r1, #0x7
    mov r1, r1, asr #0x3
    add r1, r1, #0x4
    strh r1, [r5, #0x16]
    ldrh r1, [r5, #0x5c]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r5, #0x5c]
    ldrh r0, [r5, #0x5c]
    mov r0, r0, lsl #0x1e
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_148
    b .L_ec
    b .L_104
    b .L_11c
    b .L_134
.L_ec:
    bl func_0208df40
    add r0, r0, #0x20
    str r0, [r5, #0x18]
    bl func_0208e200
    str r0, [r5, #0x20]
    b .L_148
.L_104:
    bl func_0208deec
    add r0, r0, #0x20
    str r0, [r5, #0x18]
    bl func_0208e1ac
    str r0, [r5, #0x20]
    b .L_148
.L_11c:
    bl func_0208de4c
    add r0, r0, #0x20
    str r0, [r5, #0x18]
    bl func_0208e0a0
    str r0, [r5, #0x20]
    b .L_148
.L_134:
    bl func_0208dd9c
    add r0, r0, #0x20
    str r0, [r5, #0x18]
    bl func_0208df94
    str r0, [r5, #0x20]
.L_148:
    ldrh r0, [r5, #0x5c]
    mov r3, #0xc
    mov r1, #0x4
    bic r0, r0, #0x8
    strh r0, [r5, #0x5c]
    ldrh r0, [r5, #0x16]
    mov r2, #0x0
    mov r4, r0, lsl #0x3
    mov r0, r4, asr #0x3
    add r0, r4, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r4, r0, #0x2
    mul r0, r4, r3
    bl Task_PostLocked
    str r0, [r5, #0x28]
    ldrh r1, [r5, #0x16]
    mov r2, #0xc
    mov r3, r1, lsl #0x3
    mov r1, r3, asr #0x3
    add r1, r3, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    add r1, r1, #0x2
    mul r2, r1, r2
    mov r1, #0x0
    bl func_020945f4
    ldrh r0, [r5, #0x16]
    mov r1, #0x4
    mov r2, #0x0
    mov r3, r0, lsl #0x3
    mov r0, r3, asr #0x3
    add r0, r3, r0, lsr #0x1c
    mov r0, r0, asr #0x4
    add r0, r0, #0x2
    mov r0, r0, lsl #0x2
    bl Task_PostLocked
    str r0, [r5, #0x2c]
    ldrh r2, [r5, #0x16]
    mov r1, #0x0
    mov r3, r2, lsl #0x3
    mov r2, r3, asr #0x3
    add r2, r3, r2, lsr #0x1c
    mov r2, r2, asr #0x4
    add r2, r2, #0x2
    mov r2, r2, lsl #0x2
    bl func_020945f4
    ldr r0, [r5]
    bl func_ov005_021ab0fc
    add r0, r0, #0x1
    mov r0, r0, lsl #0x4
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [r5, #0x60]
    mov r0, r5
    bl func_ov005_021ab6ac
    ldrh r1, [r5, #0x14]
    ldrh r2, [r5, #0x16]
    ldr r0, _LIT1
    bl func_02001d0c
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, r5
    mov r1, #0x0
    bl func_ov005_021abc88
    mov r0, r5
    mov r1, #0x1
    bl func_ov005_021abc88
    ldr r1, [r5, #0x20]
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldrh r0, [r5, #0x24]
    ldr r1, _LIT3
    mov r2, #0x0
    mov r0, r0, lsl #0x5
    add r0, r0, #0x400
    add r0, r0, #0x5000000
    bl func_02001bc8
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    mov r0, #0x0
    str r0, [r5, #0x54]
    str r0, [r5, #0x50]
    str r0, [r5, #0x4c]
    mov r0, #0xe
    strh r0, [r5, #0x3a]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov005_021b1ddc
_LIT1: .word data_02102c90
_LIT2: .word data_02104f4c
_LIT3: .word 0x00007fff
