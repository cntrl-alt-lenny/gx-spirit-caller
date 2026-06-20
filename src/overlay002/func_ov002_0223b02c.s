; func_ov002_0223b02c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf184
        .extern func_ov002_021b00d0
        .extern func_ov002_021d8904
        .extern func_ov002_021e16a4
        .global func_ov002_0223b02c
        .arm
func_ov002_0223b02c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    ldr r3, _LIT0
    ldr r0, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r5, r2, r3
    ldr r0, [r0, r5]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r1, #0x4]
    ldr r5, _LIT2
    mov r2, #0x14
    orr lr, r0, #0x2
    mov r0, lr, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic ip, lr, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, ip, r0, lsr #0x1d
    strh r0, [r1, #0x4]
    ldrh ip, [r1, #0x4]
    mov r0, ip, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic ip, ip, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, ip, r0, lsr #0x1c
    strh r0, [r1, #0x4]
    ldrh lr, [r1, #0x2]
    ldrh ip, [r1, #0x4]
    mov r0, lr, lsl #0x1f
    mov r1, lr, lsl #0x1a
    mov r0, r0, lsr #0x1f
    and lr, r0, #0x1
    mov r1, r1, lsr #0x1b
    mla r3, lr, r3, r5
    mul r2, r1, r2
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    mov ip, ip, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, ip, lsr #0x17
    mov r2, ip, lsr #0x17
    bne .L_cc
    bl func_ov002_021d8904
.L_cc:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    bl func_ov002_021b00d0
    ldrh r2, [r4, #0x2]
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r2, _LIT2
    and r3, r0, #0x1
    mla r1, r3, r1, r2
    add r1, r1, r4, lsl #0x2
    ldr r1, [r1, #0x3a0]
    mov r2, #0x0
    mov r1, r1, lsl #0x13
    mov r3, r2
    mov r1, r1, lsr #0x13
    bl func_ov002_021e16a4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf184
_LIT2: .word data_ov002_022cf16c
