; func_ov002_021d0e18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_021b947c
        .extern func_ov002_021ba11c
        .extern func_ov002_021ba1a0
        .extern func_ov002_021ba430
        .extern func_ov002_021c93f0
        .extern func_ov002_0229ade0
        .global func_ov002_021d0e18
        .arm
func_ov002_021d0e18:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r6, [r1, #0x2]
    ldrh r4, [r1, #0x6]
    tst r0, #0x8000
    ldrh r0, [r1, #0x4]
    movne r5, #0x1
    moveq r5, #0x0
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, r6
    bne .L_a0
    mov r2, r0, lsr #0x10
    mov r2, r2, lsl #0x10
    and r0, r0, #0xff
    mov r2, r2, lsr #0x10
    bl func_ov002_021c93f0
    ldr r2, [r0]
    add r1, sp, #0x0
    mov r0, r5
    str r2, [sp]
    bl func_ov002_021ba430
    cmp r4, #0x0
    add r1, sp, #0x0
    mov r0, r5
    beq .L_88
    bl func_ov002_021ba1a0
    b .L_8c
.L_88:
    bl func_ov002_021ba11c
.L_8c:
    mov r1, r5
    mov r0, #0x14
    mov r2, #0xd
    mov r3, #0x0
    bl func_ov002_0229ade0
.L_a0:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce950
