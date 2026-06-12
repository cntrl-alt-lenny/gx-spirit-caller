; func_ov002_0229282c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_02257b48
        .extern func_ov002_02292754
        .global func_ov002_0229282c
        .arm
func_ov002_0229282c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r2, [r4, #0x2]
    mov r5, r1
    mov r2, r2, lsl #0x12
    movs r2, r2, lsr #0x1e
    bne .L_58
    bl func_ov002_02292754
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r4, #0x2]
    mov r0, r4
    mov r1, r5
    bic r2, r2, #0x3000
    orr r2, r2, #0x3000
    strh r2, [r4, #0x2]
    bl func_ov002_02257b48
    ldrh r1, [r4, #0x2]
    bic r1, r1, #0x3000
    strh r1, [r4, #0x2]
    ldmia sp!, {r3, r4, r5, pc}
.L_58:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
