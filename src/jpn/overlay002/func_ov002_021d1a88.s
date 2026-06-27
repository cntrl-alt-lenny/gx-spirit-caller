; func_ov002_021d1a88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern func_ov002_0229cc34
        .extern func_ov002_0229cc3c
        .extern func_ov002_0229cc40
        .extern func_ov002_0229cc44
        .global func_ov002_021d1a88
        .arm
func_ov002_021d1a88:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh r4, [r0, #0x2]
    bl func_ov002_0229cc40
    bl func_ov002_0229cc44
    cmp r0, #0x0
    bne .L_5c
.L_1c:
    bl func_ov002_0229cc3c
    bl func_ov002_0229cc34
    ldrh r0, [r0]
    cmp r0, #0x63
    bne .L_50
    bl func_ov002_0229cc34
    ldrh r0, [r0, #0x2]
    cmp r4, r0
    bne .L_50
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
.L_50:
    bl func_ov002_0229cc44
    cmp r0, #0x0
    beq .L_1c
.L_5c:
    bl func_ov002_0229cc40
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce870
