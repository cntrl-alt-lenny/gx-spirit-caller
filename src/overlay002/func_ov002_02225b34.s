; func_ov002_02225b34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021d59cc
        .extern func_ov002_021e1aec
        .extern func_ov002_021e286c
        .extern func_ov002_0225368c
        .global func_ov002_02225b34
        .arm
func_ov002_02225b34:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x7e
    beq .L_3cc
    cmp r0, #0x7f
    beq .L_3a4
    cmp r0, #0x80
    bne .L_498
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    bne .L_384
    ldrh r1, [r5, #0x4]
    add sp, sp, #0x4
    mov r0, #0x0
    orr r1, r1, #0x8
    strh r1, [r5, #0x4]
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_384:
    ldrh r0, [r5, #0x2]
    mov r1, #0x5e
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_3a4:
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_3cc:
    bl func_ov002_021afb74
    mov r4, r0
    bl func_ov002_021afb74
    ldr r0, [r0]
    ldr r2, [r4]
    mov r1, r0, lsl #0x2
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r4, r1, r2, lsr #0x1f
    mov r0, r0, lsl #0x1f
    mov r1, r4
    mov r0, r0, lsr #0x1f
    mov r2, #0x80
    bl func_ov002_021e1aec
    ldrh r1, [r5, #0x2]
    ldrh r2, [r5, #0x4]
    ldr r6, _LIT1
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r1, r1, lsr #0x1b
    mov r0, r0, lsr #0x1f
    mov ip, r2, lsl #0x11
    and lr, r0, #0x1
    ldr r2, _LIT2
    mov r3, #0x14
    mla r2, lr, r2, r6
    add r6, r2, #0x30
    mul r2, r1, r3
    ldr r2, [r6, r2]
    mov r3, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    cmp r2, ip, lsr #0x17
    bne .L_47c
    mov r2, r4, lsl #0x10
    mov r2, r2, lsr #0x10
    str r2, [sp]
    ldrh r2, [r5]
    mov r3, #0x3
    bl func_ov002_021d59cc
.L_47c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_498:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
