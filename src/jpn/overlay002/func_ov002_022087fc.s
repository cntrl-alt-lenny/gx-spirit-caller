; func_ov002_022087fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e1e0
        .extern func_02031740
        .extern func_ov002_0223dda4
        .global func_ov002_022087fc
        .arm
func_ov002_022087fc:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5]
    bl func_02031740
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5]
    bl func_0202e1e0
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_98
.L_48:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223dda4
    ldrh r1, [r6, #0x2]
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r2, r2, #0xff
    and r1, r1, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    blt .L_48
.L_98:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
