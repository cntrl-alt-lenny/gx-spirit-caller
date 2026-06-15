; func_ov004_021cda8c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_0201ca88
        .extern func_0201d030
        .extern func_0201d0e8
        .extern func_0201d34c
        .extern func_0201d398
        .extern func_0202c0c0
        .extern func_ov004_021c9dd4
        .extern func_ov004_021ca0a4
        .extern func_ov004_021ca198
        .extern func_ov004_021cbf38
        .extern func_ov004_021cbf84
        .extern func_ov004_021cc0e0
        .extern func_ov004_021cc63c
        .extern func_ov004_021cc97c
        .extern func_ov004_021cca30
        .extern func_ov004_021cd6c4
        .extern func_ov004_021cd924
        .extern func_ov004_021d8798
        .extern func_ov004_021d8d58
        .extern func_ov004_021d9134
        .global func_ov004_021cda8c
        .arm
func_ov004_021cda8c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    bne .L_12ec
    bl func_0201ca88
.L_12ec:
    bl func_ov004_021cd924
    cmp r0, #0x0
    bne .L_14c8
    bl func_0201d34c
    cmp r0, #0x0
    bne .L_14c8
    ldr r0, [r4, #0x54]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_14c8
    b .L_1324
    b .L_1370
    b .L_13ec
    b .L_144c
.L_1324:
    mov r0, #0x0
    bl func_ov004_021cbf38
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    ldreq r0, [r4, #0x64]
    cmpeq r0, #0x0
    bne .L_1360
    mov r0, #0xd6
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x12
    bl func_ov004_021d8798
    mov r0, #0x1
    str r0, [r4, #0x58]
.L_1360:
    mov r0, #0x0
    str r0, [r4, #0x64]
    bl func_ov004_021cc97c
    b .L_14c8
.L_1370:
    bl func_0201d030
    cmp r0, #0x0
    beq .L_1390
    cmp r0, #0x1
    beq .L_13b4
    cmp r0, #0x3
    beq .L_13c4
    b .L_13c8
.L_1390:
    ldr r0, [r4, #0x70]
    add r0, r0, #0x1
    str r0, [r4, #0x70]
    cmp r0, #0x8
    blt .L_13c8
    mov r0, #0x0
    str r0, [r4, #0x70]
    bl func_0201d398
    b .L_13c8
.L_13b4:
    mov r0, #0x0
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    b .L_13c8
.L_13c4:
    bl func_ov004_021cca30
.L_13c8:
    bl func_0201d0e8
    cmp r0, #0x0
    beq .L_13e0
    mov r0, #0x2
    bl func_ov004_021cbf38
    b .L_14c8
.L_13e0:
    mov r0, #0x1
    bl func_ov004_021cbf38
    b .L_14c8
.L_13ec:
    bl func_0201d030
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_14c8
    b .L_143c
    b .L_143c
    b .L_14c8
    b .L_143c
    b .L_1414
    b .L_1424
.L_1414:
    bl func_ov004_021cc63c
    mov r0, #0x3
    bl func_ov004_021cbf38
    b .L_14c8
.L_1424:
    mov r0, #0x0
    bl func_ov004_021cc0e0
    ldr r0, [r4, #0x54]
    add r0, r0, #0x1
    str r0, [r4, #0x54]
    b .L_14c8
.L_143c:
    mov r0, #0x0
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    b .L_14c8
.L_144c:
    bl func_0201d030
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_14c8
    b .L_14bc
    b .L_14bc
    b .L_14c8
    b .L_14bc
    b .L_1474
    b .L_147c
.L_1474:
    bl func_ov004_021cc63c
    b .L_14c8
.L_147c:
    ldr r0, [r4, #0x78]
    cmp r0, #0x1
    beq .L_149c
    cmp r0, #0x2
    moveq r0, #0x0
    streq r0, [r4, #0x54]
    streq r0, [r4, #0x58]
    b .L_14b0
.L_149c:
    ldr r0, [r4, #0x54]
    mov r1, #0x1
    add r0, r0, #0x1
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
.L_14b0:
    mov r0, #0x4
    bl func_ov004_021cbf38
    b .L_14c8
.L_14bc:
    mov r0, #0x0
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
.L_14c8:
    ldr r0, _LIT1
    bl func_ov004_021d8d58
    bl func_ov004_021ca198
    bl func_ov004_021cd6c4
    ldr r0, _LIT1
    bl func_ov004_021d9134
    mov r1, #0x2
    str r1, [sp]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    add r0, r4, #0xf90
    add r0, r0, #0x5000
    mov r2, #0x0
    mov r3, r2
    bl func_ov004_021ca0a4
    bl func_ov004_021cbf84
    mov r1, #0x2
    str r1, [sp]
    ldr r2, [r4, #0xa0]
    add r0, r4, #0xf90
    str r2, [sp, #0x4]
    add r0, r0, #0x5000
    mov r2, #0xe4
    mov r3, #0x3
    bl func_ov004_021ca0a4
    add r0, r4, #0xef0
    add r1, r0, #0x5000
    ldr r0, _LIT2
    mov r2, #0x4
    ldr r3, _LIT3
    bl func_ov004_021c9dd4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
_LIT2: .word 0x05000638
_LIT3: .word 0x00600100
