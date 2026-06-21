; func_ov002_021d16f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_021b009c
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d16f8
        .arm
func_ov002_021d16f8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r8, #0x1
    ldrh r3, [r0, #0x4]
    ldr r1, [r0, #0x810]
    moveq r8, #0x0
    mov r2, r3, asr #0x8
    ldrh r4, [r0, #0x2]
    cmp r1, #0x0
    and r5, r3, #0xff
    and r6, r2, #0xff
    ldrh r7, [r0, #0x6]
    bne .L_8c
    bl func_ov002_021b009c
    and r1, r8, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    and r2, r5, #0xff
    and r1, r6, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r3, r7
    mov r2, r2, lsr #0x10
    mov r0, #0x37
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8c:
    mov r0, #0x37
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce950
