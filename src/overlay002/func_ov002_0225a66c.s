; func_ov002_0225a66c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd4e0
        .extern data_ov002_022d016c
        .extern func_020a7440
        .extern func_ov002_021b3ecc
        .extern func_ov002_021be2d8
        .extern func_ov002_021be384
        .extern func_ov002_021bf294
        .extern func_ov002_021c031c
        .extern func_ov002_021c034c
        .extern func_ov002_021d479c
        .extern func_ov002_021e2d94
        .extern func_ov002_0225a578
        .extern func_ov002_0229ade0
        .global func_ov002_0225a66c
        .arm
func_ov002_0225a66c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x48
    add r0, sp, #0x4
    mov r4, #0x0
    bl func_ov002_0225a578
    ldr r1, _LIT0
    ldr r0, [sp, #0x4]
    ldr r2, [r1, #0xec]
    cmp r2, r0
    ldreq r2, [r1, #0xf0]
    ldreq r0, [sp, #0x8]
    cmpeq r2, r0
    beq .L_14c
    ldr r0, _LIT0
    mov r2, #0x0
    str r2, [r0, #0x8]
    ldr r1, _LIT1
    mov r0, #0x1
    str r2, [r1, #0xd30]
    str r0, [r1, #0xd2c]
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
.L_14c:
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    mov r2, r4
    bl func_ov002_021be384
    cmp r0, #0x0
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x44
    moveq r4, #0x1
    bl func_020a7440
    cmp r0, #0x0
    ldr r3, _LIT0
    movne r4, #0x1
    ldr r0, [r3, #0x8]
    cmp r0, #0x0
    beq .L_1c0
    ldr r0, [r3]
    ldr r1, [r3, #0x1c]
    bl func_ov002_021c031c
    cmp r0, #0x0
    bne .L_1e0
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c034c
    cmp r0, #0x0
    moveq r4, #0x1
    b .L_1e0
.L_1c0:
    mov r0, #0x0
    str r0, [sp]
    ldr r1, [r3, #0x1c]
    ldmia r3, {r0, r2}
    ldr r3, [r3, #0x20]
    bl func_ov002_021bf294
    cmp r0, #0x0
    moveq r4, #0x1
.L_1e0:
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr r0, [r0, #0x4]
    mov r1, #0xb
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    movne r4, #0x1
    cmp r4, #0x0
    beq .L_2e0
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021be2d8
    cmp r0, #0x0
    bne .L_280
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT0
    orr r2, r1, #0x1b
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d479c
    ldr r0, _LIT0
    mov r2, #0x0
    str r2, [r0, #0x8]
    ldr r1, _LIT1
    mov r0, #0x1
    str r2, [r1, #0xd30]
    str r0, [r1, #0xd2c]
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
.L_280:
    ldr r1, _LIT0
    mov r2, #0x0
    ldr r0, _LIT1
    str r2, [r1, #0x8]
    str r2, [r0, #0xd30]
    mov r2, #0x2
    str r2, [r0, #0xd2c]
    mov r0, #0x1
    str r0, [r1, #0x18]
    ldr r2, [r1]
    mov r0, #0xb
    ldr r1, [r1, #0x1c]
    rsb r2, r2, #0x1
    sub r3, r0, #0xc
    bl func_ov002_0229ade0
    ldr r1, _LIT0
    mov r2, #0x15
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    mov r3, #0x1
    bl func_ov002_021e2d94
    add sp, sp, #0x48
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_2e0:
    mov r0, #0x0
    add sp, sp, #0x48
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022cd4e0
_LIT3: .word 0x0000177a
