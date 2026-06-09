; func_ov002_021d0f48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d0f48
        .arm
func_ov002_021d0f48:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r0, [r0, #0x810]
    cmp r0, #0x0
    mov r0, #0x1
    bne .L_3a74
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, pc}
.L_3a74:
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
