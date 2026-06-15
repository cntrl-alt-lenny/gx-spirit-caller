; func_02044eec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02044610
        .extern func_020450d0
        .extern func_020930b0
        .extern func_020931e8
        .extern func_02093a20
        .extern func_0209bb60
        .extern func_0209bc20
        .extern func_0209bcdc
        .extern func_0209bea0
        .global func_02044eec
        .arm
func_02044eec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x28
    mov r8, r0
    bl func_02044610
    bl func_0209bcdc
    add r0, sp, #0x8
    bl func_0209bc20
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x18
    bl func_0209bb60
    cmp r0, #0x0
    addne sp, sp, #0x28
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, sp, #0x8
    add r1, sp, #0x18
    bl func_0209bea0
    mov r4, r0
    mov r0, #0x0
    subs r2, r4, r0
    sbcs r2, r1, r0
    addlt sp, sp, #0x28
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_020931e8
    cmp r0, #0x0
    beq .L_844
    ldr r0, _LIT0
    adds r4, r4, r0
.L_844:
    add r0, sp, #0x0
    bl func_02093a20
    ldrb r1, [sp]
    ldr r9, _LIT1
    ldr sl, _LIT2
    ldrb r0, [sp, #0x1]
    mla r5, r4, r9, sl
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsl #0x8
    ldrb r2, [sp, #0x2]
    ldr r0, _LIT3
    ldrb r6, [sp, #0x3]
    orr r1, r2, r1
    cmp r1, r0
    movne r1, #0x1
    moveq r1, #0x0
    mov r2, r5, lsr #0x10
    mov r0, #0x3e8
    mul r3, r2, r0
    mov r2, r3, lsr #0x10
    ldrb r0, [sp, #0x5]
    ldrb r4, [sp, #0x4]
    mov r3, r6, lsl #0x10
    and r7, r1, #0xff
    orr r3, r3, r4, lsl #0x8
    strh r2, [r8, #0x10]
    mov r4, #0x0
    str r4, [r8]
    str r4, [r8, #0x4]
    ldrh r2, [r8, #0x12]
    orr r6, r0, r3
    cmp r2, #0x0
    bne .L_934
    str r4, [r8, #0x8]
    str r4, [r8, #0xc]
    ldr r0, [r8, #0xc]
    ldr r1, [r8, #0x8]
    cmp r0, r4
    cmpeq r1, r4
    bne .L_990
.L_8e4:
    mul r0, r5, r9
    adds r5, r0, sl
    bne .L_8fc
.L_8f0:
    mul r0, r5, r9
    adds r5, r0, sl
    beq .L_8f0
.L_8fc:
    strh r5, [r8, #0x12]
    ldrh r0, [r8, #0x12]
    mov r1, r6
    mov r2, r7
    mov r3, r4
    bl func_020450d0
    str r0, [r8, #0x8]
    str r1, [r8, #0xc]
    ldr r0, [r8, #0xc]
    ldr r1, [r8, #0x8]
    cmp r0, r4
    cmpeq r1, #0x0
    beq .L_8e4
    b .L_990
.L_934:
    str r4, [r8, #0x8]
    str r4, [r8, #0xc]
    ldr r0, [r8, #0xc]
    ldr r1, [r8, #0x8]
    cmp r0, r4
    cmpeq r1, r4
    bne .L_990
    add r5, r8, #0x12
.L_954:
    ldrh r0, [r5]
    mov r1, r6
    mov r2, r7
    add r0, r0, #0x1
    strh r0, [r5]
    ldrh r0, [r8, #0x12]
    mov r3, r4
    bl func_020450d0
    str r0, [r8, #0x8]
    str r1, [r8, #0xc]
    ldr r0, [r8, #0xc]
    ldr r1, [r8, #0x8]
    cmp r0, r4
    cmpeq r1, r4
    beq .L_954
.L_990:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word func_020930b0
_LIT1: .word 0x5d588b65
_LIT2: .word 0x00269ec3
_LIT3: .word 0x000009bf
