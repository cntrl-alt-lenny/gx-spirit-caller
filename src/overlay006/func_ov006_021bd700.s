; func_ov006_021bd700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021bd700
        .arm
func_ov006_021bd700:
    stmdb sp!, {r4, r5, r6, lr}
    add r4, r0, #0xa0
    mov r3, #0x24
    mla r3, r1, r3, r4
    ldr r1, [r3, #0xc]
    cmp r2, r1
    blt .L_3530
    cmp r1, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
.L_3530:
    ldr r1, [r3, #0x20]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    moveq r1, #0x0
    stmeqia r3, {r1, r2}
    beq .L_3578
    ldr ip, _LIT0
    mov r4, r2, lsr #0x1f
    smull r1, r6, ip, r2
    smull r1, r5, ip, r2
    add r6, r4, r6, asr #0x2
    mov lr, #0xa
    smull r1, ip, lr, r6
    sub r6, r2, r1
    str r6, [r3]
    add r5, r4, r5, asr #0x2
    str r5, [r3, #0x4]
    mov r1, #0x0
.L_3578:
    str r1, [r3, #0x8]
    ldr r0, [r0, #0x50]
    cmp r0, #0x4
    moveq r2, #0x3
    movne r2, #0x4
    b .L_35a8
.L_3590:
    ldr r0, [r3, #0x4]
    sub r0, r0, #0x1
    str r0, [r3, #0x4]
    ldr r0, [r3, #0x8]
    add r0, r0, #0x1
    str r0, [r3, #0x8]
.L_35a8:
    ldr r0, [r3, #0x4]
    cmp r0, #0x0
    ble .L_35c8
    ldr r1, [r3, #0x10]
    ldr r0, [r3, #0x8]
    sub r0, r1, r0
    cmp r0, r2
    bgt .L_3590
.L_35c8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x66666667
