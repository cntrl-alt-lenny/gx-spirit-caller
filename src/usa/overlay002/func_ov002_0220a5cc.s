; func_ov002_0220a5cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3ef8
        .extern func_ov002_021b939c
        .extern func_ov002_021ca1d8
        .global func_ov002_0220a5cc
        .arm
func_ov002_0220a5cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xf
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r4, #0x4]
    ldr r2, _LIT0
    mov r3, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r3, lsr #0x1f
    mov r3, r1, lsr #0x17
    mov r1, #0xb
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000016be
