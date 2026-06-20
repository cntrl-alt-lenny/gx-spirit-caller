; func_ov002_02262804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022d016c
        .extern func_ov002_021d479c
        .extern func_ov002_021e2cd4
        .extern func_ov002_021e2d20
        .extern func_ov002_022627ac
        .global func_ov002_02262804
        .arm
func_ov002_02262804:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r3, [r2, #0xd9c]
    mov r4, r1
    cmp r3, #0x0
    beq .L_28
    cmp r3, #0x1
    beq .L_b4
    b .L_d0
.L_28:
    mov r0, #0x6
    str r0, [r2, #0xd2c]
    mov r1, #0x1
    mov r0, #0x0
    str r1, [r2, #0xd30]
    bl func_ov002_021e2cd4
    mov r0, r5
    mov r1, #0x13
    mov r2, #0x1
    bl func_ov002_021e2d20
    cmp r4, #0x0
    beq .L_94
    ldr r0, _LIT1
    mov r3, #0x0
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT1
    orr r2, r1, #0x1b
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021d479c
.L_94:
    ldr r1, _LIT1
    mov r2, #0x1
    ldr r0, _LIT0
    str r2, [r1, #0x14]
    ldr r1, [r0, #0xd9c]
    add r1, r1, #0x1
    str r1, [r0, #0xd9c]
    b .L_d0
.L_b4:
    bl func_ov002_022627ac
    ldr r0, _LIT0
    ldr r0, [r0, #0xd2c]
    cmp r0, #0x9
    movcs r0, #0x1
    movcc r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_d0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd3f4
