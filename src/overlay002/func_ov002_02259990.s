; func_ov002_02259990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021ba294
        .extern func_ov002_0226f4dc
        .global func_ov002_02259990
        .arm
func_ov002_02259990:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021ba294
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    ldr r2, [r1, r0, lsl #0x2]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_0226f4dc
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
