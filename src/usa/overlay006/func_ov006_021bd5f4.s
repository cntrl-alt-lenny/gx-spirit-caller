; func_ov006_021bd5f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021bd5f4
        .arm
func_ov006_021bd5f4:
    stmdb sp!, {r4, r5, r6, lr}
    add r4, r0, #0xa0
    mov r3, #0x24
    mla r3, r1, r3, r4
    ldr r1, [r3, #0xc]
    cmp r2, r1
    blt .L_28
    cmp r1, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
.L_28:
    ldr r1, [r3, #0x20]
    mov r1, r1, lsl #0x1f
    movs r1, r1, lsr #0x1f
    moveq r1, #0x0
    stmeqia r3, {r1, r2}
    beq .L_70
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
.L_70:
    str r1, [r3, #0x8]
    ldr r0, [r0, #0x50]
    cmp r0, #0x4
    moveq r2, #0x3
    movne r2, #0x4
    b .L_a0
.L_88:
    ldr r0, [r3, #0x4]
    sub r0, r0, #0x1
    str r0, [r3, #0x4]
    ldr r0, [r3, #0x8]
    add r0, r0, #0x1
    str r0, [r3, #0x8]
.L_a0:
    ldr r0, [r3, #0x4]
    cmp r0, #0x0
    ble .L_c0
    ldr r1, [r3, #0x10]
    ldr r0, [r3, #0x8]
    sub r0, r1, r0
    cmp r0, r2
    bgt .L_88
.L_c0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x66666667
