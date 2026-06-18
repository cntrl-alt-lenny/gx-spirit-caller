; func_ov002_022064e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021ff320
        .extern func_ov002_022577dc
        .global func_ov002_022064e8
        .arm
func_ov002_022064e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r2, _LIT0
    ldr ip, [r2, #0xcec]
    mov r2, r3, lsl #0x1f
    cmp ip, r2, lsr #0x1f
    bne .L_40
    bl func_ov002_021ff320
    cmp r0, #0x0
    beq .L_40
    mov r0, r4
    bl func_ov002_022577dc
    cmp r0, #0x0
    movne r0, #0x2
    ldmneia sp!, {r4, pc}
.L_40:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    moveq r0, #0x3
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
