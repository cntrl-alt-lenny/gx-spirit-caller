; func_ov002_022432b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_021b9ecc
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223de94
        .extern func_ov002_0223f684
        .extern func_ov002_022575c8
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0228df3c
        .extern func_ov002_0229ce5c
        .global func_ov002_022432b4
        .arm
func_ov002_022432b4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x100
    mov r4, r0
    ldrh r2, [r4, #0xc]
    cmp r2, #0x1
    beq .L_28
    cmp r2, #0x2
    beq .L_180
    cmp r2, #0x3
    bne .L_18c
.L_28:
    ldr r0, _LIT0
    ldr r0, [r0, #0x5b8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_18c
    b .L_4c
    b .L_4c
    b .L_78
    b .L_130
.L_4c:
    mov r2, #0x1
    mov r0, r4
    strh r2, [r4, #0xc]
    bl func_ov002_0223f684
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x2
    strne r1, [r0, #0x5b8]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_78:
    mov r0, #0x3
    strh r0, [r4, #0xc]
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    ldr r0, [r0, r2, lsl #0x2]
    cmp r0, #0x1
    bne .L_b0
    ldrh r2, [r4]
    mov r0, r4
    bl func_ov002_0228df3c
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
.L_b0:
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021b9ecc
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x45
    bl func_ov002_0229ce5c
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_130:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_164
    ldr r1, _LIT3
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_164:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, pc}
.L_180:
    bl func_ov002_0223f684
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
.L_18c:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word func_ov002_022575c8
_LIT3: .word data_ov002_022d016c
