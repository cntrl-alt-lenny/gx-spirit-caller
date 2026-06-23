; func_ov004_021d6924 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_02005c84
        .extern func_02005e04
        .extern func_0208c79c
        .extern func_ov004_021ca0b8
        .extern func_ov004_021ce10c
        .extern func_ov004_021d6648
        .extern func_ov004_021d7824
        .extern func_ov004_021d82c4
        .extern func_ov004_021d851c
        .extern func_ov004_021d8c6c
        .extern func_ov004_021d9000
        .extern func_ov004_021d9204
        .extern func_ov004_021d9b44
        .extern func_ov004_021d9c90
        .extern func_ov004_021da158
        .extern func_ov004_021db56c
        .extern func_ov004_021db64c
        .global func_ov004_021d6924
        .arm
func_ov004_021d6924:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    ldr r1, [r4, #0x48]
    ldr r0, [r4, #0x4c]
    cmp r1, r0
    ldr r0, [r4, #0x5c]
    beq .L_308
    cmp r0, #0x10
    addlt r0, r0, #0x1
    strlt r0, [r4, #0x5c]
    b .L_314
.L_308:
    cmp r0, #0x0
    subne r0, r0, #0x1
    strne r0, [r4, #0x5c]
.L_314:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_33c
    cmp r0, #0x1
    beq .L_334
    cmp r0, #0x2
    beq .L_344
    b .L_348
.L_334:
    bl func_ov004_021d82c4
    b .L_348
.L_33c:
    bl func_ov004_021db56c
    b .L_348
.L_344:
    bl func_ov004_021d9b44
.L_348:
    bl func_ov004_021d6648
    ldr r0, _LIT1
    bl func_ov004_021d8c6c
    ldr r0, _LIT1
    bl func_ov004_021d9000
    bl func_ov004_021ca0b8
    bl func_ov004_021ce10c
    ldr r1, [r4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4]
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
    ldr r0, _LIT2
    ldr r1, [r4, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r0, _LIT3
    ldr r1, [r4, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r0, [r4, #0x5c]
    cmp r0, #0x10
    bne .L_43c
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_3e4
    cmp r0, #0x1
    beq .L_3dc
    cmp r0, #0x2
    beq .L_3ec
    b .L_3f0
.L_3dc:
    bl func_ov004_021d851c
    b .L_3f0
.L_3e4:
    bl func_ov004_021db64c
    b .L_3f0
.L_3ec:
    bl func_ov004_021d9c90
.L_3f0:
    ldr r1, [r4, #0x4c]
    ldr r0, [r4, #0x48]
    str r1, [r4, #0x50]
    str r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_424
    cmp r0, #0x1
    beq .L_41c
    cmp r0, #0x2
    beq .L_42c
    b .L_434
.L_41c:
    bl func_ov004_021d7824
    b .L_43c
.L_424:
    bl func_ov004_021da158
    b .L_43c
.L_42c:
    bl func_ov004_021d9204
    b .L_43c
.L_434:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_43c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_02291388
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
