; func_ov002_0220dab4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc47c
        .extern func_ov002_021ff230
        .global func_ov002_0220dab4
        .arm
func_ov002_0220dab4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021ff230
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0x4
    bcs .L_48
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r1, r1, #0x1
    bl func_ov002_021bc47c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_48:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    movs r1, r1, lsr #0x1b
    beq .L_74
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    sub r1, r1, #0x1
    bl func_ov002_021bc47c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_74:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
