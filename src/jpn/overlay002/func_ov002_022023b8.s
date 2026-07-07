; func_ov002_022023b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021bc7e8
        .extern func_ov002_021c2e44
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ff1c8
        .global func_ov002_022023b8
        .arm
func_ov002_022023b8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    mov r0, r2, lsl #0x1f
    mov r1, r0, lsr #0x1f
    mov r0, r2, lsl #0x11
    eor r4, r1, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    mov r0, r4
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff1c8
    ldrh r1, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    cmp r4, r1, lsr #0x1f
    movne r1, #0x1
    moveq r1, #0x0
    add r1, r1, #0x2
    cmp r0, r1
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT0
    mov r0, r4
    bl func_ov002_021c2e44
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021c2e44
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, r4
    bl func_ov002_021c2e44
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x2
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00001288
_LIT1: .word 0x0000129b
_LIT2: .word 0x000012b8
