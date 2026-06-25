; func_ov002_02287f58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021c8390
        .extern func_ov002_022575f0
        .extern func_ov002_022579d0
        .extern func_ov002_0227d594
        .global func_ov002_02287f58
        .arm
func_ov002_02287f58:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022575f0
    ldrh r3, [r4, #0x2]
    mov r2, r0
    mov r1, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227d594
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldrh r2, [r4, #0x6]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r2, #0xff00
    orr r2, r2, #0x100
    mov r1, r1, asr #0x8
    strh r2, [r4, #0x6]
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_021c8390
    strh r0, [r4, #0x8]
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r4, pc}
