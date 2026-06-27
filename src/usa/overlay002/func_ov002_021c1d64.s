; func_ov002_021c1d64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_ov002_021c1c48
        .extern func_ov002_021c1d40
        .global func_ov002_021c1d64
        .arm
func_ov002_021c1d64:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6]
    mov r5, r1
    mov r4, r2
    bl func_0202b824
    cmp r0, #0x17
    bne .L_44
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    bl func_ov002_021c1d40
    ldmia sp!, {r4, r5, r6, pc}
.L_44:
    ldrh r0, [r6]
    bl func_0202b824
    cmp r0, #0x16
    beq .L_80
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_a4
    cmp r0, #0xa
    bcs .L_a4
    ldrh r0, [r6]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_a4
.L_80:
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    bl func_ov002_021c1c48
    ldmia sp!, {r4, r5, r6, pc}
.L_a4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
