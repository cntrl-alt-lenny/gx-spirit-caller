; func_ov002_02204c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bb068
        .extern func_ov002_021c9df0
        .global func_ov002_02204c1c
        .arm
func_ov002_02204c1c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    bl func_ov002_021bb068
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c9df0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldr r2, _LIT1
    mov r1, r0, lsl #0x1a
    mov r3, r0, lsl #0x1f
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3ecc
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000135d
_LIT1: .word 0x0000152a
