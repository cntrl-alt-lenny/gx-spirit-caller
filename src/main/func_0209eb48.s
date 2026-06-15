; func_0209eb48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094688
        .extern func_0209db88
        .extern func_0209dcb8
        .extern func_0209de5c
        .global func_0209eb48
        .arm
func_0209eb48:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x3c
    mov r5, r0
    mov r0, #0x3
    mov r4, r1
    mov r2, r0
    mov r1, #0x2
    mov r3, #0x5
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0x3c
    ldmneia sp!, {r4, r5, lr}
    bxne lr
    cmp r4, #0x0
    addeq sp, sp, #0x3c
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldr r0, [r4]
    cmp r0, #0x0
    addeq sp, sp, #0x3c
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, lr}
    bxeq lr
    ldrh r0, [r4, #0x4]
    cmp r0, #0x400
    addhi sp, sp, #0x3c
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, lr}
    bxhi lr
    ldrh r0, [r4, #0x12]
    cmp r0, #0x20
    addhi sp, sp, #0x3c
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, lr}
    bxhi lr
    ldrh r1, [r4, #0x10]
    cmp r1, #0x0
    beq .L_c0
    cmp r1, #0x1
    beq .L_c0
    cmp r1, #0x2
    beq .L_c0
    cmp r1, #0x3
    addne sp, sp, #0x3c
    movne r0, #0x6
    ldmneia sp!, {r4, r5, lr}
    bxne lr
.L_c0:
    ldr r0, _LIT0
    add r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_f0
    ldrh r0, [r4, #0x34]
    cmp r0, #0x20
    addhi sp, sp, #0x3c
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, lr}
    bxhi lr
.L_f0:
    mov r1, r5
    mov r0, #0x26
    bl func_0209de5c
    mov r0, #0x26
    strh r0, [sp]
    ldrh r2, [r4, #0x6]
    add r1, sp, #0xc
    add r0, r4, #0xa
    strh r2, [sp, #0x2]
    ldr r3, [r4]
    mov r2, #0x6
    str r3, [sp, #0x4]
    ldrh r3, [r4, #0x4]
    strh r3, [sp, #0x8]
    ldrh r3, [r4, #0x8]
    strh r3, [sp, #0xa]
    bl func_02094688
    ldrh r2, [r4, #0x10]
    add r1, sp, #0x16
    add r0, r4, #0x14
    strh r2, [sp, #0x12]
    ldrh r3, [r4, #0x34]
    mov r2, #0x20
    strh r3, [sp, #0x36]
    ldrh r3, [r4, #0x12]
    strh r3, [sp, #0x14]
    bl func_02094688
    add r0, sp, #0x0
    mov r1, #0x3c
    bl func_0209dcb8
    cmp r0, #0x0
    moveq r0, #0x2
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word 0x0000fffe
