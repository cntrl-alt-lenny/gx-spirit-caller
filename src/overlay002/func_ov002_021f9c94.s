; func_ov002_021f9c94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021deb84
        .extern func_ov002_022575c8
        .extern func_ov002_022593a8
        .extern func_ov002_022593f4
        .global func_ov002_021f9c94
        .arm
func_ov002_021f9c94:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_2c
    cmp r0, #0x1
    beq .L_58
    cmp r0, #0x2
    beq .L_88
    b .L_104
.L_2c:
    ldrh r0, [r4, #0x2]
    mov r1, #0x12
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_58:
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT1
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022593a8
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_88:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_ec
    ldrh r3, [r4, #0x2]
    ldr r2, _LIT2
    mov r1, #0x1
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov ip, r3, lsl #0x1a
    mov r3, r0, lsl #0x4
    add r3, r3, ip, lsr #0x1b
    ldr r4, [r2, #0xd74]
    ldr lr, [r2, #0xd78]
    ldr ip, [r2, #0xd70]
    add r4, r4, lr
    mov r2, r1, lsl r3
    add r3, r4, ip, lsl #0x4
    orr r1, r2, r1, lsl r3
    bl func_ov002_021deb84
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_ec:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    sub r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_104:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_022575c8
_LIT2: .word data_ov002_022d016c
