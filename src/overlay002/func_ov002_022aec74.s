; func_ov002_022aec74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f2c
        .extern func_ov002_0229a414
        .global func_ov002_022aec74
        .arm
func_ov002_022aec74:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, r1, lsl #0x2
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    ldmltia sp!, {r4, pc}
    ldr r0, _LIT0
    str r1, [r4, #0x2c]
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_34
    mov r0, #0x0
    bl func_ov002_0229a414
.L_34:
    ldr r0, _LIT0
    mov r1, #0x7
    str r1, [r4, #0x44]
    ldr r1, [r0, #0xd4]
    ldr r0, _LIT0
    cmp r1, #0x8
    movlt r1, #0x8
    str r1, [r0, #0xd4]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0f2c
