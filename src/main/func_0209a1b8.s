; func_0209a1b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8394
        .extern func_02099c38
        .global func_0209a1b8
        .arm
func_0209a1b8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x1
    bl func_02099c38
    ldr r1, _LIT0
    ldrh r0, [r1, #0x34]
    ands r0, r0, #0x1
    movne r0, #0x1
    ldmneia sp!, {r4, lr}
    bxne lr
    ldrh r3, [r1, #0x4]
    ldrh r2, [r1, #0x6]
    mov r0, #0x0
    strh r3, [r4]
    strh r2, [r4, #0x2]
    ldrh r2, [r1, #0x8]
    ldrh r1, [r1, #0xa]
    strh r2, [r4, #0x4]
    strh r1, [r4, #0x6]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a8394
