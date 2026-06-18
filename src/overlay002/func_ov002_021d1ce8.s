; func_ov002_021d1ce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d1ce8
        .arm
func_ov002_021d1ce8:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r1, #0x1
    ldr r2, [r0, #0x810]
    moveq r1, #0x0
    cmp r2, #0x0
    bne .L_11c
    ldrh ip, [r0, #0x4]
    ldrh r3, [r0, #0x6]
    ldrh r2, [r0, #0x2]
    mov r0, #0x3e
    orr r3, ip, r3, lsl #0x10
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
.L_11c:
    mov r0, #0x3e
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
