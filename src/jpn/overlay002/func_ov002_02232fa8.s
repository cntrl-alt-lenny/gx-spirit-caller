; func_ov002_02232fa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021d70f0
        .extern func_ov002_021e277c
        .extern func_ov002_02257a60
        .extern func_ov002_0226aec4
        .global func_ov002_02232fa8
        .arm
func_ov002_02232fa8:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_154
    b .L_108
    b .L_ac
    b .L_70
    b .L_30
.L_30:
    bl func_ov002_02257a60
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x1f
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    strh r1, [r4, #0xa]
    strh r1, [r4, #0x8]
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_70:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4]
    bl func_ov002_0226aec4
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_ac:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT3
    mov r2, #0x0
    mov r3, r1, lsl #0x1f
    ldrh r1, [r0, #0xb0]
    mov r0, r3, lsr #0x1f
    bl func_ov002_021d70f0
    ldr r0, _LIT3
    add r3, r4, #0x8
    ldrh r1, [r0, #0xb2]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x1f
    mov r2, r1, lsr #0x1e
    ldrh r1, [r3, r2]
    add r1, r1, #0x1
    strh r1, [r3, r2]
    ldr r1, [r0, #0x5ac]
    add r1, r1, #0x1
    str r1, [r0, #0x5ac]
    cmp r1, #0x2
    movlt r0, #0x7f
    movge r0, #0x7d
    ldmia sp!, {r4, pc}
.L_108:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r1, r4, r0, lsl #0x1
    ldrh r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_128
    bl func_ov002_021e277c
.L_128:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    add r1, r4, r0, lsl #0x1
    ldrh r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_14c
    bl func_ov002_021e277c
.L_14c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_154:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022d0d8c
