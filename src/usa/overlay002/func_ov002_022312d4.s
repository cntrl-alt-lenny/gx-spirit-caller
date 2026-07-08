; func_ov002_022312d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae320
        .extern func_ov002_021de3c0
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021e952c
        .extern func_ov002_02257790
        .extern func_ov002_02259274
        .extern func_ov002_0225930c
        .extern func_ov002_0226b13c
        .global func_ov002_022312d4
        .arm
func_ov002_022312d4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7c
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_488
    b .L_47c
    b .L_424
    b .L_3cc
    b .L_38c
    b .L_364
.L_364:
    ldrh r0, [r4, #0x2]
    mov r2, #0x3
    mov r3, #0x1
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b13c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_38c:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT2
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021e2a4c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_3cc:
    ldr r1, _LIT2
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x7c
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    bne .L_404
    ldrh r0, [r4, #0x2]
    mov r1, #0x6d
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
.L_404:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259274
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_424:
    bl func_ov002_0225930c
    cmp r0, #0x0
    beq .L_474
    ldr r1, _LIT3
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de3c0
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r2, [r1, #0x5ac]
    add r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldrh r0, [r0, #0xb2]
    cmp r2, r0
    movlt r0, #0x7e
    movge r0, #0x7c
    ldmia sp!, {r4, pc}
.L_474:
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_47c:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_488:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
_LIT2: .word func_ov002_021e952c
_LIT3: .word data_ov002_022d008c
