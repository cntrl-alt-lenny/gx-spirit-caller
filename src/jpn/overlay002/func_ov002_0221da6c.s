; func_ov002_0221da6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021d70f0
        .extern func_ov002_021de8e4
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e277c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .global func_ov002_0221da6c
        .arm
func_ov002_0221da6c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r2, [r1, #0x5a8]
    sub r2, r2, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_194
    b .L_178
    b .L_13c
    b .L_d0
    b .L_44
.L_44:
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_c8
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r4
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021de8e4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r2, [r1, r0]
    ldr r0, _LIT0
    mov r1, #0x0
    str r2, [r0, #0x5ac]
    str r1, [r0, #0x5b0]
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d0:
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT1
    ldr r2, _LIT2
    mov r3, r3, lsl #0x1f
    mov lr, r3, lsr #0x1f
    and r3, lr, #0x1
    mul ip, r3, r0
    ldr r0, [r2, ip]
    cmp r0, #0x0
    beq .L_134
    ldr r0, _LIT3
    mov r2, #0x1
    add r0, r0, ip
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x12
    cmp lr, r0, lsr #0x1f
    movne r0, #0x1
    strne r0, [r1, #0x5b0]
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d70f0
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_134:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_13c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b0]
    cmp r0, #0x0
    beq .L_170
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
.L_170:
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_178:
    ldrh r0, [r4, #0x2]
    ldr r1, [r1, #0x5ac]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e0f5c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_194:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
