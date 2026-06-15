; func_02044cb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .global func_02044cb8
        .arm
func_02044cb8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x28
    add r2, sp, #0x0
    mov r1, #0x0
    strb r1, [r2]
    strb r1, [r2, #0x1]
    strb r1, [r2, #0x2]
    strb r1, [r2, #0x3]
    strb r1, [r2, #0x4]
    mov r5, r0
    strb r1, [r2, #0x5]
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
    beq .L_630
    ldr r0, _LIT0
    adds r4, r4, r0
.L_630:
    add r0, sp, #0x0
    bl func_02093a20
    ldrb r1, [sp]
    ldr r6, _LIT1
    ldr r7, _LIT2
    ldrb r0, [sp, #0x1]
    mla r9, r4, r6, r7
    mov r1, r1, lsl #0x10
    orr r1, r1, r0, lsl #0x8
    ldrb r2, [sp, #0x2]
    ldr r0, _LIT3
    ldrb r8, [sp, #0x3]
    orr r1, r2, r1
    cmp r1, r0
    movne r1, #0x1
    mov r2, r9, lsr #0x10
    mov r0, #0x3e8
    mul r3, r2, r0
    mov r2, r3, lsr #0x10
    mov r3, r8, lsl #0x10
    ldrb r4, [sp, #0x4]
    ldrb r0, [sp, #0x5]
    mov r8, #0x0
    orr sl, r3, r4, lsl #0x8
    strh r2, [r5, #0x10]
    str r8, [r5, #0x8]
    str r8, [r5, #0xc]
    moveq r1, #0x0
    ldr r2, [r5, #0xc]
    ldr r3, [r5, #0x8]
    cmp r2, r8
    cmpeq r3, r8
    and r4, r1, #0xff
    orr sl, r0, sl
    bne .L_718
.L_6bc:
    mla r9, r6, r9, r7
    b .L_6c8
.L_6c4:
    mla r9, r6, r9, r7
.L_6c8:
    cmp r9, #0x0
    beq .L_6c4
    ldrh r1, [r5, #0x12]
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r1, r0
    beq .L_6c4
    strh r0, [r5, #0x12]
    ldrh r0, [r5, #0x12]
    mov r1, sl
    mov r2, r4
    mov r3, r8
    bl func_020450d0
    str r0, [r5, #0x8]
    str r1, [r5, #0xc]
    ldr r0, [r5, #0xc]
    ldr r1, [r5, #0x8]
    cmp r0, r8
    cmpeq r1, r8
    beq .L_6bc
.L_718:
    mov r0, #0x1
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word func_020930b0
_LIT1: .word 0x5d588b65
_LIT2: .word 0x00269ec3
_LIT3: .word 0x000009bf
