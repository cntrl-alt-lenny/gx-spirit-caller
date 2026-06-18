; func_ov002_02206168 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bbf50
        .global func_ov002_02206168
        .arm
func_ov002_02206168:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbf50
    ldrh r1, [r4, #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r5, r0
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x6
    bne .L_70
    ldr r1, [r4, #0x14]
    mov r0, r0, lsl #0x1f
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_70:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
