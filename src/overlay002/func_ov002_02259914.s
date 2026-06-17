; func_ov002_02259914 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021c2e34
        .extern func_ov002_021fd81c
        .global func_ov002_02259914
        .arm
func_ov002_02259914:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r2, r5, lsl #0x1f
    and r2, r2, #-2147483648
    orr r3, r2, #0x4e0000
    mov r2, r1, lsl #0x10
    orr r4, r3, r2, lsr #0x10
    bl func_ov002_021c2e34
    cmp r0, #0x0
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, r5, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x18
    add r1, r1, #0x400
    ldr r2, [r1, r0, lsl #0x2]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021fd81c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
