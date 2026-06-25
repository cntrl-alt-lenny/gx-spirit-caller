; func_ov002_0220d468 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern func_ov002_021b9d68
        .extern func_ov002_021bc7e8
        .extern func_ov002_021ff2cc
        .global func_ov002_0220d468
        .arm
func_ov002_0220d468:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    mov r4, r1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x1a
    mov r1, r0
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9d68
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff2cc
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
