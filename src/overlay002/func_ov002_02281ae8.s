; func_ov002_02281ae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_0227c678
        .extern func_ov002_02281a28
        .extern func_ov002_0228d544
        .global func_ov002_02281ae8
        .arm
func_ov002_02281ae8:
    stmdb sp!, {r4, lr}
    mov r2, #0x1
    ldr r1, _LIT0
    mov r3, r2
    mov r4, r0
    bl func_ov002_0228d544
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r4, pc}
    ldr r1, _LIT1
    ldr r2, _LIT2
    and r3, r4, #0x1
    mla r1, r3, r1, r2
    add r0, r1, r0, lsl #0x2
    ldr r1, [r0, #0x120]
    mov r0, r4
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, #0x1
    bl func_ov002_0227c678
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word func_ov002_02281a28
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
