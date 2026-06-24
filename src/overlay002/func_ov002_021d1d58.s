; func_ov002_021d1d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf168
        .extern data_ov002_022cf180
        .extern func_0202e2c8
        .extern func_ov002_021b91c4
        .extern func_ov002_021baa04
        .extern func_ov002_021bab38
        .extern func_ov002_021c93f0
        .extern func_ov002_0229ade0
        .global func_ov002_021d1d58
        .arm
func_ov002_021d1d58:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    movne r6, #0x1
    ldr r0, [r1, #0x810]
    moveq r6, #0x0
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r0, _LIT1
    and r2, r6, #0x1
    mul r5, r2, r0
    ldr r4, _LIT2
    ldr r2, [r4, r5]
    cmp r2, #0x0
    beq .L_1b4
    mov r0, r6
    sub r2, r2, #0x1
    mov r1, #0xe
    bl func_ov002_021c93f0
    mov r1, r0
    ldr r0, _LIT3
    bl func_ov002_021b91c4
    ldrh r2, [sp, #0x2]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    ldr r1, [r4, r5]
    bic r2, r2, #0x1
    and r0, r0, #0x1
    orr r2, r2, r0
    strh r2, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    sub r1, r1, #0x1
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    bic r2, r2, #0x3e
    orr r2, r2, #0x1c
    strh r2, [sp, #0x2]
    ldrh ip, [sp, #0x2]
    ldr r1, _LIT0
    ldrh r2, [sp]
    ldr r1, [r1, #0x818]
    bic ip, ip, #0x3fc0
    mov r3, r3, lsl #0x18
    orr r3, ip, r3, lsr #0x12
    strh r3, [sp, #0x2]
    ldrh r3, [sp, #0x2]
    bic r2, r2, #0x1
    orr r2, r2, r0
    bic r3, r3, #0x8000
    strh r3, [sp, #0x2]
    mov r1, r1, lsl #0x13
    ldrh r3, [sp, #0x2]
    mov r0, r1, lsr #0x13
    strh r2, [sp]
    orr r1, r3, #0x4000
    strh r1, [sp, #0x2]
    bl func_0202e2c8
    cmp r0, #0x0
    movne r0, #0xc
    moveq r0, #0xd
    ldrh r1, [sp]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp]
    ldrh r2, [sp]
    ldr r1, [r4, r5]
    mov r0, r6
    bic r2, r2, #0x3fc0
    strh r2, [sp]
    ldrh r3, [sp]
    sub r2, r1, #0x1
    mov r1, #0xe
    bic r3, r3, #0x8000
    strh r3, [sp]
    ldrh r3, [sp]
    bic r3, r3, #0x4000
    strh r3, [sp]
    bl func_ov002_021baa04
    ldrh r0, [sp]
    ldr r3, _LIT3
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x12
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x18
    bl func_ov002_021bab38
    ldr r0, _LIT0
    ldrh r2, [sp, #0x2]
    ldr r1, [r0, #0x818]
    ldrh r3, [sp]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x18
    bl func_ov002_0229ade0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_1b4:
    mov r0, #0x0
    str r0, [r1, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf180
_LIT3: .word data_ov002_022cf168
