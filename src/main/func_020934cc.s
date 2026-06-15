; func_020934cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a66d4
        .extern func_020930b0
        .extern func_02093684
        .extern func_020b3808
        .global func_020934cc
        .arm
func_020934cc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r4, [r8, #0x1c]
    ldr r3, [r8, #0x20]
    mov r0, #0x0
    cmp r3, r0
    mov r7, r1
    mov r6, r2
    cmpeq r4, r0
    beq .L_2a4
    bl func_020930b0
    ldr r6, [r8, #0x28]
    ldr r7, [r8, #0x24]
    cmp r6, r1
    cmpeq r7, r0
    bcs .L_2a4
    ldr r5, [r8, #0x1c]
    ldr r4, [r8, #0x20]
    subs r0, r0, r7
    mov r2, r5
    mov r3, r4
    sbc r1, r1, r6
    bl func_020b3808
    mov r2, #0x1
    adds r2, r0, r2
    adc r0, r1, #0x0
    umull r3, r1, r5, r2
    mla r1, r5, r0, r1
    mla r1, r4, r2, r1
    adds r7, r7, r3
    adc r6, r6, r1
.L_2a4:
    str r7, [r8, #0xc]
    ldr r0, _LIT0
    str r6, [r8, #0x10]
    ldr r4, [r0]
    cmp r4, #0x0
    beq .L_324
    mov r1, #0x0
.L_2c0:
    ldr r2, [r4, #0xc]
    ldr r0, [r4, #0x10]
    subs r3, r7, r2
    sbc r2, r6, r0
    subs r0, r3, r1
    sbcs r0, r2, r1
    bge .L_318
    ldr r0, [r4, #0x14]
    str r0, [r8, #0x14]
    str r8, [r4, #0x14]
    str r4, [r8, #0x18]
    ldr r0, [r8, #0x14]
    cmp r0, #0x0
    strne r8, [r0, #0x18]
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    ldr r1, _LIT0
    mov r0, r8
    str r8, [r1]
    bl func_02093684
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_318:
    ldr r4, [r4, #0x18]
    cmp r4, #0x0
    bne .L_2c0
.L_324:
    ldr r1, _LIT0
    mov r0, #0x0
    str r0, [r8, #0x18]
    ldr r0, [r1, #0x4]
    str r8, [r1, #0x4]
    str r0, [r8, #0x14]
    cmp r0, #0x0
    strne r8, [r0, #0x18]
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    mov r0, r8
    str r8, [r1, #0x4]
    str r8, [r1]
    bl func_02093684
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a66d4
