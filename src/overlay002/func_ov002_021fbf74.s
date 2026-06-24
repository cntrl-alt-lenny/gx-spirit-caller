; func_ov002_021fbf74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021fc1a0
        .extern func_ov002_021fc3e8
        .global func_ov002_021fbf74
        .arm
func_ov002_021fbf74:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r5, r2
    mov r6, r1
    mov r7, r0
    add ip, sp, #0x0
    mov r2, #0x0
    mov r0, r6
    mov r1, r5
    mov r4, r3
    str r2, [ip]
    str r2, [ip, #0x4]
    str r2, [ip, #0x8]
    str r2, [ip, #0xc]
    str r2, [ip, #0x10]
    str r2, [ip, #0x14]
    bl func_ov002_021b9ecc
    cmp r0, #0x0
    addeq sp, sp, #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [sp, #0x2]
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    strh r1, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    mov r1, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    strh r0, [sp]
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x2]
    ldr r0, _LIT0
    and r1, r6, #0x1
    mul r0, r1, r0
    mov r1, #0x14
    mul r1, r5, r1
    ldr r2, _LIT1
    cmp r7, r6
    add r2, r2, r0
    add r2, r2, #0x30
    ldr r7, [r2, r1]
    movne r3, #0x1
    ldr r5, _LIT2
    moveq r3, #0x0
    mov r2, r7, lsl #0x2
    mov r6, r2, lsr #0x18
    ldrh r2, [sp, #0x2]
    mov r3, r3, lsl #0x10
    add r5, r5, r0
    mov r0, r3, lsr #0x10
    ldrh r3, [r1, r5]
    mov r1, r6, lsl #0x1
    mov r5, r7, lsl #0x12
    add r1, r1, r5, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r5, r1, lsr #0x10
    ldrh r6, [sp, #0x4]
    ldr r1, _LIT3
    bic r2, r2, #0x4000
    mov r0, r0, lsl #0x1f
    orr r2, r2, r0, lsr #0x11
    and r1, r6, r1
    mov r0, r5, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp, #0x4]
    strh r2, [sp, #0x2]
    cmp r3, #0x0
    add r0, sp, #0x0
    mov r1, r4
    beq .L_138
    bl func_ov002_021fc1a0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_138:
    bl func_ov002_021fc3e8
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0xffff803f
