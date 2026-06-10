; func_ov002_022aebec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f2c
        .extern func_ov002_02259834
        .extern func_ov002_022ae284
        .extern func_ov002_022ae9c0
        .global func_ov002_022aebec
        .arm
func_ov002_022aebec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x1
    bl func_ov002_022ae284
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_02259834
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_022ae9c0
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r2, [r0, #0xd4]
    ldr r0, _LIT0
    cmp r2, #0x8
    movlt r2, #0x8
    str r2, [r0, #0xd4]
    str r1, [r4, #0x38]
    mov r0, #0x1
    str r0, [r4, #0x40]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d0f2c
