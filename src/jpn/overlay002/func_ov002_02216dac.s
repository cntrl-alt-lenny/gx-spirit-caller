; func_ov002_02216dac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021d8814
        .extern func_ov002_021de4a8
        .extern func_ov002_02216e4c
        .global func_ov002_02216dac
        .arm
func_ov002_02216dac:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    beq .L_524
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    mov r3, r1, lsl #0x1f
    mov r2, r0, lsl #0x11
    mov r1, r1, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8814
    ldrh r1, [r4, #0x4]
    mov r0, r5
    orr r3, r1, #0x2
    mov r1, r3, lsl #0x1e
    mov r1, r1, lsr #0x1f
    bic r2, r3, #0x4
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x1d
    strh r1, [r4, #0x4]
    ldrh r2, [r4, #0x4]
    mov r1, r2, lsl #0x1d
    mov r1, r1, lsr #0x1f
    bic r2, r2, #0x8
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x1c
    strh r1, [r4, #0x4]
    ldrh r1, [r4, #0x2]
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de4a8
    b .L_52c
.L_524:
    bl func_ov002_02216e4c
    ldmia sp!, {r3, r4, r5, pc}
.L_52c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
