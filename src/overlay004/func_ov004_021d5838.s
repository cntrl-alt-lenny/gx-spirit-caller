; func_ov004_021d5838 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_0203268c
        .extern func_02033488
        .extern func_02033544
        .extern func_0203354c
        .extern func_02033554
        .extern func_02034114
        .extern func_02034160
        .extern func_ov004_021ce1bc
        .extern func_ov004_021d3b74
        .extern func_ov004_021d8cd0
        .global func_ov004_021d5838
        .arm
func_ov004_021d5838:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldr r0, [r5, #0x38]
    ldr r4, _LIT0
    cmp r0, #0x0
    mov r0, #0x0
    strne r0, [r5, #0x38]
    movne r0, #0x1
    cmp r0, #0x0
    beq .L_188
    bl func_0203268c
    bl func_0203354c
    mov r7, r0
    bl func_0203268c
    bl func_02033544
    mov r6, r0
    mov r0, r7
    mov r1, r6
    bl func_02034114
    str r0, [r5, #0x48]
    ldr r0, [r4, #0x64]
    cmp r0, #0x0
    beq .L_170
    ldr r0, _LIT1
    bl func_ov004_021d8cd0
    mov r0, #0x0
    str r0, [r4, #0x64]
    b .L_188
.L_170:
    mov r2, #0x0
    str r2, [sp]
    ldr r3, [r5, #0x48]
    mov r0, r5
    mov r1, r6
    bl func_ov004_021d3b74
.L_188:
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x48]
    bl func_02034160
    cmp r0, #0x0
    beq .L_1d8
    bl func_0203268c
    bl func_02033488
    mov r0, #0x29
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_2c0
.L_1d8:
    ldr r0, [r4, #0x4c]
    ldr r1, _LIT2
    cmp r0, #0x0
    mvneq r0, #0x0
    streq r0, [r4, #0x88]
    mvn r2, #0x0
    mov r0, #0x0
    str r2, [r1, #0xbac]
    bl func_ov004_021ce1bc
    mov r0, #0x1
    bl func_ov004_021ce1bc
    bl func_0203268c
    bl func_0203354c
    cmp r0, #0x7
    addls pc, pc, r0, lsl #0x2
    b .L_2c0
    b .L_238
    b .L_254
    b .L_254
    b .L_270
    b .L_2c0
    b .L_2c0
    b .L_28c
    b .L_2a8
.L_238:
    mov r0, #0x18
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_2c0
.L_254:
    mov r0, #0x18
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_2c0
.L_270:
    mov r0, #0x22
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_2c0
.L_28c:
    mov r0, #0x29
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
    b .L_2c0
.L_2a8:
    mov r0, #0x28
    str r0, [r5, #0x30]
    mov r0, #0x1
    str r0, [r5, #0x38]
    mov r0, #0x0
    str r0, [r5, #0x3c]
.L_2c0:
    bl func_0203268c
    bl func_02033554
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_ov004_022915e8
_LIT2: .word data_021040ac
