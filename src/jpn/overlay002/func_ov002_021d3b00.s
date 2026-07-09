; func_ov002_021d3b00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0cc
        .extern data_ov002_022d0170
        .extern func_ov002_021b9130
        .extern func_ov002_021b9174
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021d3b00
        .arm
func_ov002_021d3b00:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    ldr r0, _LIT0
    ldrh r3, [r1, #0x2]
    ldrh r0, [r0]
    ldr r2, [r1, #0x810]
    ldrh r7, [r1, #0x4]
    mov r1, r3, asr #0x8
    and r5, r1, #0xff
    tst r0, #0x8000
    movne r8, #0x1
    moveq r8, #0x0
    and r3, r5, #0xf0
    and r1, r5, #0x2
    mov r0, r8
    cmp r2, #0x0
    mov r4, r3, asr #0x4
    and r5, r5, #0x1
    mov r6, r1, asr #0x1
    beq .L_658
    cmp r2, #0x1
    beq .L_7a8
    cmp r2, #0x2
    beq .L_820
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_658:
    ldr r2, _LIT1
    ldr ip, _LIT2
    cmp r7, r2
    addne r1, r2, #0x1
    cmpne r7, r1
    addne r1, r2, #0x2
    cmpne r7, r1
    mov r1, #0x0
    sub r3, r1, #0x2000
    and lr, r3, #0x0
    and r3, r7, ip
    orr r3, lr, r3
    add r2, sp, #0x4
    rsbeq r0, r8, #0x1
    bic ip, r3, #0x2000
    mov r3, r0, lsl #0x1f
    str r1, [r2]
    orr r1, ip, r3, lsr #0x12
    str r1, [sp, #0x4]
    bl func_ov002_021b9130
    ldr r1, [sp, #0x4]
    mov r2, #0x2000
    rsb r2, r2, #0x0
    mov r0, r0, lsl #0x18
    bic r1, r1, #0x3fc00000
    orr r3, r1, r0, lsr #0x2
    mov r0, r3, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r3, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    str r3, [sp, #0x4]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x2
    ldrh lr, [r1, r0]
    mov r3, r7, lsl #0x10
    mov ip, r2, lsr #0x13
    and lr, lr, r2
    and r2, ip, r3, lsr #0x10
    orr r2, lr, r2
    strh r2, [r1, r0]
    add r2, sp, #0x4
    mov r0, r8
    mov r1, r4
    mov r3, r6
    str r5, [sp]
    bl func_ov002_021b9174
    mov r1, #0x14
    mul r3, r4, r1
    and r0, r8, #0x1
    mov r1, r4, lsl #0x1b
    mov r5, r5, lsl #0x1f
    orr r1, r0, r1, lsr #0x1a
    mov r6, r6, lsl #0x1f
    orr r1, r1, r5, lsr #0x11
    orr r4, r1, r6, lsr #0x10
    ldr r1, _LIT4
    mov r4, r4, lsl #0x10
    mul r6, r0, r1
    ldr r0, _LIT5
    mov r1, r4, lsr #0x10
    add r5, r0, r6
    ldr r4, [r5, r3]
    ldr r0, _LIT6
    orr r4, r4, #0x200000
    add r0, r0, r6
    orr r4, r4, #0x10
    add r0, r0, #0x30
    str r4, [r5, r3]
    ldr r4, [r0, r3]
    mov r2, r7
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    mov r0, #0x1b
    add r3, r3, r4, lsr #0x1f
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_7a8:
    ldr r1, _LIT6
    ldr r0, _LIT4
    and r3, r8, #0x1
    mla r2, r3, r0, r1
    mov r0, #0x14
    mov r1, r4, lsl #0x1b
    mul r0, r4, r0
    add r2, r2, #0x30
    ldr r2, [r2, r0]
    mov r4, r5, lsl #0x1f
    orr r3, r3, r1, lsr #0x1a
    mov r0, r2, lsl #0x2
    mov r1, r0, lsr #0x18
    orr r0, r3, r4, lsr #0x11
    mov r5, r6, lsl #0x1f
    orr r0, r0, r5, lsr #0x10
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    add r2, r2, r3, lsr #0x1f
    mov r0, #0x34
    mov r3, #0x0
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_820:
    mov r0, #0x34
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00001670
_LIT2: .word 0x00001fff
_LIT3: .word data_ov002_022d0170
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf0cc
_LIT6: .word data_ov002_022cf08c
