; func_ov002_0223e1b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223de94
        .global func_ov002_0223e1b4
        .arm
func_ov002_0223e1b4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r0, [r5, #0x6]
    mov r4, #0x0
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_2dc
    and r1, r1, #0xff
    and r0, r2, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
.L_2b0:
    mov r0, r5
    mov r1, r4
    bl func_ov002_0223de94
    cmp r6, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x6]
    add r4, r4, #0x1
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    blt .L_2b0
.L_2dc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
