; func_ov002_0228ae94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b878
        .extern func_ov002_0223de94
        .extern func_ov002_022575c8
        .global func_ov002_0228ae94
        .arm
func_ov002_0228ae94:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4]
    bl func_0202b878
    cmp r0, #0x16
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_c4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    bhi .L_c4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    ldrh r2, [r5, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    and r1, r0, #0xff
    mov r0, r2, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    and r2, r3, #0xff
    bne .L_c4
    mov r0, r5
    bl func_ov002_022575c8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
