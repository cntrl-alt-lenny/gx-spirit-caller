; func_ov002_02292578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbf50
        .extern func_ov002_021bcf18
        .extern func_ov002_02291160
        .global func_ov002_02292578
        .arm
func_ov002_02292578:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r3, r2, lsl #0x12
    movs r3, r3, lsr #0x1e
    beq .L_188
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    mov r3, r2
    rsb r0, r0, #0x1
    mov r1, #0x1
    bl func_ov002_021bcf18
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbf50
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_188:
    bl func_ov002_02291160
    ldmia sp!, {r4, pc}
