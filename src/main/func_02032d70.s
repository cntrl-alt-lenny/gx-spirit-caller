; func_02032d70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02033858
        .extern func_020339d4
        .extern func_02046ae0
        .extern func_020930b0
        .extern func_020b3808
        .global func_02032d70
        .arm
func_02032d70:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xeb4]
    add r5, r4, #0x314
    tst r0, #0x2000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02046ae0
    cmp r0, #0x1
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0xeb0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0xc08]
    cmp r0, #0x0
    ldrne r0, [r5, #0xc0c]
    cmpne r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_020930b0
    ldr r3, [r5, #0xc00]
    ldr r2, [r5, #0xc04]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT0
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3808
    mov r2, r1, lsl #0x2
    orr r2, r2, r0, lsr #0x1e
    ldr r1, [r4, #0xeb0]
    mov r0, r0, lsl #0x2
    cmp r2, #0x0
    cmpeq r0, r1
    ldmccia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_02033858
    mov r1, r0
    ldr r2, [r5, #0xc0c]
    ldr r3, [r5, #0xc08]
    mov r0, r4
    bl func_020339d4
    bl func_020930b0
    str r0, [r5, #0xc00]
    str r1, [r5, #0xc04]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000082ea
