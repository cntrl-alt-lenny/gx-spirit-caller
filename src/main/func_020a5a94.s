; func_020a5a94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9924
        .extern data_021a9928
        .extern func_02094688
        .extern func_020a5a34
        .global func_020a5a94
        .arm
func_020a5a94:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    mov r7, r1
    ldr r3, [r2]
    cmp r3, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r1, _LIT1
    ldrb r4, [r0, #0x2]
    ldr r2, [r1, #0x4]
    cmp r4, r2
    addgt sp, sp, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, lr}
    bxgt lr
    sub r6, r7, #0x1
    ldr r2, [r1]
    add r1, r3, r6, lsl #0x5
    mla r1, r4, r2, r1
    add r0, r0, #0x3
    mov r5, r6, lsl #0x5
    bl func_02094688
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r2, [r0]
    mov r0, r7
    add r3, r2, #0x1e0
    ldr r2, [r3, r6, lsl #0x2]
    orr r1, r2, r1, lsl r4
    str r1, [r3, r6, lsl #0x2]
    bl func_020a5a34
    cmp r0, #0x0
    ldrne r0, _LIT0
    ldrne r0, [r0]
    addne r0, r0, r5
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_021a9924
_LIT1: .word data_021a9928
