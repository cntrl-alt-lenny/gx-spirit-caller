; func_02020814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f40
        .extern func_02020880
        .global func_02020814
        .arm
func_02020814:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov r2, #0x0
    str r2, [r0, #0x10]
    str r2, [r0, #0x3c]
    str r2, [r0, #0x1c]
    strh r2, [r0, #0x4]
    mov r1, #0x1
    strh r1, [r0, #0xa]
    str r2, [r0, #0x2c]
    str r2, [r0, #0xa0]
    strh r2, [r0, #0xa4]
    str r2, [r0, #0x20]
    bl func_02020880
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
