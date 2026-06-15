; func_ov004_021d6a10 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_02005ca0
        .extern func_02005e20
        .extern func_0208c884
        .extern func_ov004_021ca198
        .extern func_ov004_021ce1ec
        .extern func_ov004_021d6734
        .extern func_ov004_021d7910
        .extern func_ov004_021d83b0
        .extern func_ov004_021d8608
        .extern func_ov004_021d8d58
        .extern func_ov004_021d9134
        .extern func_ov004_021d9418
        .extern func_ov004_021d9d58
        .extern func_ov004_021d9ea4
        .extern func_ov004_021da36c
        .extern func_ov004_021db780
        .extern func_ov004_021db860
        .global func_ov004_021d6a10
        .arm
func_ov004_021d6a10:
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
    bl func_ov004_021d83b0
    b .L_348
.L_33c:
    bl func_ov004_021db780
    b .L_348
.L_344:
    bl func_ov004_021d9d58
.L_348:
    bl func_ov004_021d6734
    ldr r0, _LIT1
    bl func_ov004_021d8d58
    ldr r0, _LIT1
    bl func_ov004_021d9134
    bl func_ov004_021ca198
    bl func_ov004_021ce1ec
    ldr r1, [r4]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4]
    bl func_02005e20
    mov r0, #0x2
    bl func_02005e20
    mov r0, #0x1
    bl func_02005ca0
    mov r0, #0x2
    bl func_02005ca0
    ldr r0, _LIT2
    ldr r1, [r4, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r0, _LIT3
    ldr r1, [r4, #0x5c]
    rsb r1, r1, #0x0
    bl func_0208c884
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
    bl func_ov004_021d8608
    b .L_3f0
.L_3e4:
    bl func_ov004_021db860
    b .L_3f0
.L_3ec:
    bl func_ov004_021d9ea4
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
    bl func_ov004_021d7910
    b .L_43c
.L_424:
    bl func_ov004_021da36c
    b .L_43c
.L_42c:
    bl func_ov004_021d9418
    b .L_43c
.L_434:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_43c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
_LIT2: .word 0x0400006c
_LIT3: .word 0x0400106c
