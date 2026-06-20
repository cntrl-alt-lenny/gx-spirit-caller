; func_ov002_02299b5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd524
        .extern data_ov002_022d016c
        .extern func_ov002_021d479c
        .extern func_ov002_02244fe4
        .extern func_ov002_02259f74
        .extern func_ov002_0225a0e0
        .extern func_ov002_022627ac
        .extern func_ov002_02285dd0
        .extern func_ov002_02297c80
        .global func_ov002_02299b5c
        .arm
func_ov002_02299b5c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0, #0x8]
    ldr r4, [r1, #0xcec]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_130
    b .L_30
    b .L_a8
    b .L_c8
    b .L_100
.L_30:
    mov r0, r4
    bl func_ov002_02259f74
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_0225a0e0
    cmp r0, #0x0
    beq .L_6c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_02285dd0
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
.L_6c:
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_02297c80
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r1, _LIT1
    mov r2, #0x0
    str r2, [r1, #0xd2c]
    ldr r0, _LIT0
    str r2, [r1, #0xd30]
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
    b .L_130
.L_a8:
    mov r0, #0x3
    mov r1, #0x0
    bl func_ov002_02244fe4
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
    b .L_130
.L_c8:
    mov r0, r4
    bl func_ov002_022627ac
    cmp r0, #0x0
    beq .L_130
    ldr r0, _LIT1
    ldr r0, [r0, #0xd34]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x8]
    add r1, r1, #0x1
    str r1, [r0, #0x8]
    b .L_130
.L_100:
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0x10
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_130:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd524
_LIT1: .word data_ov002_022d016c
