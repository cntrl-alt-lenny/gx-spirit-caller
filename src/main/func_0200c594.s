; func_0200c594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02186ae8
        .extern func_02090048
        .extern func_020900a0
        .extern func_02090114
        .extern func_02092904
        .global func_0200c594
        .arm
func_0200c594:
    stmdb sp!, {r4, r6, r7, lr}
    ldr r0, _LIT0
    ldr r4, [r0, #0x14]
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r6, r7, pc}
    ldr r1, [r0, #0xc]
    mov r0, #0x0
    cmp r1, #0x0
    ble .L_bc
.L_28:
    ldr r2, [r4, #0x27c]
    cmp r2, #0x0
    bne .L_ac
    ldr r3, [r4, #0x60]
    mov r2, r3, lsl #0x1e
    movs r2, r2, lsr #0x1f
    bne .L_ac
    mov r2, r3, lsl #0x1f
    movs r2, r2, lsr #0x1f
    beq .L_ac
    mov r2, r3, lsl #0x1d
    movs r2, r2, lsr #0x1f
    beq .L_ac
    ldr r2, [r4, #0x7c]
    mov r2, r2, lsl #0x3
    movs r2, r2, lsr #0x1f
    beq .L_ac
    ldr r1, [r4, #0x278]
    ldr r6, [r4, #0x1c]
    mov r0, #0xc
    mla r7, r1, r0, r6
    ldmia r7, {r0, r1}
    bl func_02092904
    bl func_02090114
    ldr r1, [r7, #0x8]
    ldmia r7, {r0, r2}
    bl func_020900a0
    bl func_02090048
    ldr r1, [r4, #0x7c]
    mov r0, #0x1
    bic r1, r1, #0x10000000
    str r1, [r4, #0x7c]
    ldmia sp!, {r4, r6, r7, pc}
.L_ac:
    add r0, r0, #0x1
    cmp r0, r1
    add r4, r4, #0x284
    blt .L_28
.L_bc:
    mov r0, #0x0
    ldmia sp!, {r4, r6, r7, pc}
_LIT0: .word data_02186ae8
