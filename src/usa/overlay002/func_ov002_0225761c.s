; func_ov002_0225761c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_0225737c
        .extern func_ov002_02257668
        .global func_ov002_0225761c
        .arm
func_ov002_0225761c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_0225737c
    cmp r0, #0x0
    ldrne r1, [r0, #0x8]
    cmpne r1, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    mov r2, #0x1
    str r2, [r1, #0x5c0]
    ldr r1, [r0, #0x8]
    mov r0, r4
    bl func_ov002_02257668
    ldr r1, _LIT0
    mov r2, #0x0
    str r2, [r1, #0x5c0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
