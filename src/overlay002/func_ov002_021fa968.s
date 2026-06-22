; func_ov002_021fa968 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021decdc
        .extern func_ov002_021f40f4
        .extern func_ov002_022575c8
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0226aea8
        .global func_ov002_021fa968
        .arm
func_ov002_021fa968:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b4]
    cmp r1, #0x0
    beq .L_2c
    cmp r1, #0x1
    beq .L_70
    cmp r1, #0x2
    beq .L_c8
    b .L_f0
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
    ldmia sp!, {r4, pc}
.L_70:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_b0
    ldr r1, _LIT2
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021decdc
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_b0:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_c8:
    bl func_ov002_021f40f4
    ldrh r3, [r4, #0x2]
    mov r1, r0
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r3, r2
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226aea8
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_f0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_022575c8
_LIT2: .word data_ov002_022d016c
