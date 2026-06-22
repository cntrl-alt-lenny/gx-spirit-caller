; func_ov002_022223b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021d7970
        .extern func_ov002_021e104c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0226af94
        .global func_ov002_022223b8
        .arm
func_ov002_022223b8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1, #0x5a8]
    ldr ip, [r2, #0xcec]
    sub r2, r3, #0x7c
    ldr r3, [r1, #0x5ac]
    mov r4, r0
    cmp r2, #0x4
    eor r0, ip, r3
    addls pc, pc, r2, lsl #0x2
    b .L_110
    b .L_d4
    b .L_b4
    b .L_88
    b .L_74
    b .L_44
.L_44:
    ldr r0, _LIT2
    ldr r2, [r0, #0xc]
    cmp r2, #0x0
    ldrne r0, [r0, #0x874]
    cmpne r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_74:
    ldrh r1, [r4]
    mov r2, #0x1
    bl func_ov002_0226af94
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_88:
    ldrh r1, [r4, #0x2]
    rsb r0, r0, #0x1
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    ldr r1, _LIT3
    movne r2, #0x1
    ldrh r1, [r1, #0xb0]
    moveq r2, #0x0
    bl func_ov002_021d7970
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_b4:
    add r0, r3, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r4, pc}
    bl func_ov002_021e2c5c
    mov r0, #0x7c
    ldmia sp!, {r4, pc}
.L_d4:
    bl func_ov002_021e2b3c
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e104c
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e104c
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_110:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022d0e6c
