; func_ov002_021ff1d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern func_ov002_021b99c8
        .global func_ov002_021ff1d8
        .arm
func_ov002_021ff1d8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r2, [r4, #0x4]
    mov r0, r1
    mov r1, r2, lsl #0x11
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99c8
    ldrh r2, [r4, #0x2]
    cmp r0, #0x0
    ldr r0, _LIT0
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r1, _LIT1
    movge r3, #0x1
    ldr r0, [r1, r0]
    movlt r3, #0x0
    sub r0, r0, r3
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
