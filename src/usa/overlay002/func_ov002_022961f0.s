; func_ov002_022961f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_022579d0
        .extern func_ov002_02259e8c
        .extern func_ov002_02280870
        .extern func_ov002_02281650
        .extern func_ov002_02285cc0
        .global func_ov002_022961f0
        .arm
func_ov002_022961f0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022579d0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r4
    mov r2, #0x0
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_02281650
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259e8c
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    cmp r0, #0x0
    movlt r0, #0x1
    ldmltia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02285cc0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d008c
