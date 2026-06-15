; func_0204d284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff980
        .extern func_020498f0
        .extern func_0204ead0
        .extern func_020689b8
        .extern func_020689dc
        .extern func_02068a20
        .extern func_02068cc8
        .extern func_020930b0
        .global func_0204d284
        .arm
func_0204d284:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r5, r0
    cmp r1, #0x0
    bne .L_21e8
    bl func_020498f0
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_221c
    bl func_020498f0
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    bne .L_221c
.L_21e8:
    bl func_020498f0
    mov r1, #0x1
    str r1, [r0, #0x1bc]
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1c0]
    str r1, [r4, #0x1c4]
    bl func_020498f0
    str r5, [r0, #0xf4]
    add sp, sp, #0x14
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_221c:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_22a0
    bl func_020498f0
    ldr r0, [r0, #0xe4]
    mov r1, #0x0
    bl func_02068cc8
    mov r6, r0
    bl func_020498f0
    mov r4, r0
    ldr r1, _LIT0
    mov r0, r6
    mov r2, #0x0
    bl func_02068a20
    str r0, [r4, #0xf4]
    bl func_020498f0
    mov r4, r0
    mov r0, r6
    bl func_020689dc
    str r0, [r4, #0x24]
    bl func_020498f0
    mov r4, r0
    mov r0, r6
    bl func_020689b8
    strh r0, [r4, #0xa4]
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    mov r4, #0x1
    str r0, [r6, #0x204]
    b .L_22dc
.L_22a0:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_22b8
    bl func_020498f0
    str r5, [r0, #0xf4]
.L_22b8:
    bl func_020498f0
    str r5, [r0, #0x204]
    bl func_020498f0
    ldr r0, [r0, #0x1c]
    str r0, [sp, #0xc]
    bl func_020498f0
    ldrh r0, [r0, #0x1a]
    mov r4, #0x3
    str r0, [sp, #0x10]
.L_22dc:
    bl func_020498f0
    ldr r1, _LIT1
    str r1, [r0, #0x1c8]
    bl func_020498f0
    mov r6, r0
    bl func_020930b0
    str r0, [r6, #0x1cc]
    str r1, [r6, #0x1d0]
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x1bc]
    bl func_020498f0
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    movne r7, #0xb
    moveq r7, #0x1
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    str r0, [sp, #0x8]
    bl func_020498f0
    mov r6, r0
    bl func_020498f0
    add r2, sp, #0x8
    str r2, [sp]
    mov r3, r0
    str r4, [sp, #0x4]
    ldrh r3, [r3, #0xa4]
    ldr r2, [r6, #0x24]
    mov r1, r5
    mov r0, r7
    bl func_0204ead0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ff980
_LIT1: .word 0x00001770
