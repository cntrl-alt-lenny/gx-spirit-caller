; func_ov010_021b6a00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02106804
        .extern data_ov010_021b9884
        .extern data_ov010_021b9890
        .extern func_ov005_021ab260
        .extern func_ov005_021ab384
        .extern func_ov005_021ab3a0
        .extern func_ov005_021ab3b4
        .global func_ov010_021b6a00
        .arm
func_ov010_021b6a00:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r3, _LIT0
    mov r6, r0
    ldr r0, [r3, #0x90]
    mov r5, r1
    mov r1, r6
    mov r4, r2
    ldr r9, _LIT1
    bl func_ov005_021ab3a0
    ldr r1, _LIT0
    mov r8, r0
    ldr r0, [r1, #0x90]
    mov r1, r6
    bl func_ov005_021ab3b4
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x90]
    mov r1, r6
    bl func_ov005_021ab3b4
    mov r0, r0, lsl #0x10
    cmp r8, #0x0
    mov sl, r0, lsr #0x10
    addeq r0, r9, r7, lsl #0x2
    ldreq r1, [r9, #0x354]
    ldreq r0, [r0, #0x348]
    beq .L_7c
    ldr r0, _LIT2
    ldr r1, [r9, #0x344]
    add r0, r8, r0
    add r0, r9, r0, lsl #0x2
    ldr r0, [r0, #0x210]
.L_7c:
    add r7, r1, r0
    cmp r5, #0x0
    beq .L_ac
    ldr r0, [r9, #0x84]
    mov r1, r6
    mov r2, #0x8
    bl func_ov005_021ab384
    cmp r0, #0x0
    movne r0, #0x4
    strne r0, [r5]
    ldreq r0, _LIT3
    streq r0, [r5]
.L_ac:
    cmp r4, #0x0
    beq .L_13c
    ldr r0, [r9, #0x84]
    mov r1, r6
    bl func_ov005_021ab260
    cmp r0, #0x0
    ldr r0, [r9, #0x84]
    mov r1, r6
    bne .L_120
    mov r2, #0x8
    bl func_ov005_021ab384
    cmp r0, #0x0
    bne .L_114
    ldr r0, _LIT4
    mov r1, sl, asr #0x5
    ldr r0, [r0, r1, lsl #0x2]
    and r1, sl, #0x1f
    mov r2, #0x1
    tst r0, r2, lsl r1
    moveq r2, #0x0
    cmp r2, #0x1
    moveq r0, #0x2
    streq r0, [r4]
    movne r0, #0x3
    strne r0, [r4]
    b .L_13c
.L_114:
    ldr r0, _LIT3
    str r0, [r4]
    b .L_13c
.L_120:
    mov r2, #0x2
    bl func_ov005_021ab384
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4]
    moveq r0, #0x1
    streq r0, [r4]
.L_13c:
    mov r0, r7
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov010_021b9884
_LIT1: .word data_ov010_021b9890
_LIT2: .word 0xfffff81c
_LIT3: .word 0x00003fff
_LIT4: .word data_02106804
