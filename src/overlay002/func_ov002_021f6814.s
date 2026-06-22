; func_ov002_021f6814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021decdc
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_022575c8
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_021f6814
        .arm
func_ov002_021f6814:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_2c
    cmp r0, #0x1
    beq .L_70
    cmp r0, #0x2
    beq .L_a8
    b .L_f4
.L_2c:
    ldrh r0, [r4, #0x2]
    mov r1, #0x3a
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_70:
    bl func_ov002_022593f4
    cmp r0, #0x0
    mov r0, #0x0
    beq .L_94
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_94:
    ldr r1, _LIT0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_a8:
    ldr r0, _LIT2
    ldr r7, [r0, #0xd70]
    ldr r6, [r0, #0xd74]
    ldr r5, [r0, #0xd78]
    bl func_ov002_021e2b3c
    mov r0, r4
    mov r1, r7
    add r2, r6, r5
    bl func_ov002_021decdc
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021decdc
    bl func_ov002_021e2c5c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_022575c8
_LIT2: .word data_ov002_022d016c
