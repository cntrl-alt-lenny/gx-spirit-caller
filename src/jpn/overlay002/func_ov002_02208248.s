; func_ov002_02208248 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bd300
        .extern func_ov002_021ff1d8
        .global func_ov002_02208248
        .arm
func_ov002_02208248:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021ff1d8
    ldrh r2, [r4, #0x2]
    mov r4, r0
    mov r1, #0x1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bd300
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    beq .L_54
    cmp r4, r0
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, pc}
.L_54:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
