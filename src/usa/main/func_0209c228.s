; func_0209c228 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a83e0
        .extern func_02091734
        .extern func_020918f0
        .global func_0209c228
        .arm
func_0209c228:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r5, r0
    ldr r1, [r4, #0x108]
    add r0, r4, #0x44
    bl func_02091734
    add r0, r4, #0x44
    str r0, [r4, #0x104]
    str r5, [r4, #0x40]
    ldr r1, [r4, #0x114]
    orr r1, r1, #0x8
    str r1, [r4, #0x114]
    bl func_020918f0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a83e0
