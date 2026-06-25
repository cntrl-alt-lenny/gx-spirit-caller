; func_ov002_0229f678 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0e4c
        .extern data_ov002_022d19bc
        .extern func_ov002_0229a304
        .extern func_ov002_022a1760
        .extern func_ov002_022ae884
        .global func_ov002_0229f678
        .arm
func_ov002_0229f678:
    stmdb sp!, {r3, lr}
    mov r1, #0x1
    str r1, [r0, #0x44]
    bl func_ov002_022a1760
    cmp r0, #0x0
    beq .L_464
    ldr r0, _LIT0
    ldr r1, [r0, #0xd4]
    ldr r0, _LIT0
    cmp r1, #0x10
    movlt r1, #0x10
    str r1, [r0, #0xd4]
.L_464:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_47c
    mov r0, #0x0
    bl func_ov002_0229a304
.L_47c:
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_ov002_022ae884
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0e4c
_LIT1: .word data_ov002_022d19bc
