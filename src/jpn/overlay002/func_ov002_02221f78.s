; func_ov002_02221f78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d8814
        .extern func_ov002_021de3c0
        .global func_ov002_02221f78
        .arm
func_ov002_02221f78:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0xc]
    mov r4, r1
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x4]
    orr r1, r0, #0x4
    strh r1, [r4, #0x4]
    ldrh r0, [r4, #0x2]
    mov r2, r1, lsl #0x11
    mov r2, r2, lsr #0x17
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021d8814
    ldrh r1, [r4, #0x2]
    mov r0, r5
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de3c0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
