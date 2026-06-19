; func_ov002_02243d28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc55c
        .global func_ov002_02243d28
        .arm
func_ov002_02243d28:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldrh r0, [r6, #0x2]
    mov r5, r1
    mov r4, r2
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc55c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x6]
    mov r2, #0x0
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x18
    cmp r3, #0x0
    ble .L_608
    and r1, r5, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
.L_5e8:
    add r0, r6, r2, lsl #0x1
    ldrh r0, [r0, #0x8]
    cmp r1, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r2, r2, #0x1
    cmp r2, r3
    blt .L_5e8
.L_608:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
