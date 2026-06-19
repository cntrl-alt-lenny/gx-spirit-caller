; func_ov002_0229f788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f2c
        .extern data_ov002_022d1a9c
        .extern func_ov002_0229a414
        .extern func_ov002_022a1870
        .extern func_ov002_022ae9c0
        .global func_ov002_0229f788
        .arm
func_ov002_0229f788:
    stmdb sp!, {r3, lr}
    mov r1, #0x1
    str r1, [r0, #0x44]
    bl func_ov002_022a1870
    cmp r0, #0x0
    beq .L_39c
    ldr r0, _LIT0
    ldr r1, [r0, #0xd4]
    ldr r0, _LIT0
    cmp r1, #0x10
    movlt r1, #0x10
    str r1, [r0, #0xd4]
.L_39c:
    ldr r0, _LIT0
    ldr r0, [r0, #0xc8]
    cmp r0, #0x0
    beq .L_3b4
    mov r0, #0x0
    bl func_ov002_0229a414
.L_3b4:
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_ov002_022ae9c0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d0f2c
_LIT1: .word data_ov002_022d1a9c
