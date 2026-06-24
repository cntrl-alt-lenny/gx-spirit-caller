; func_02099af4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02099af4
        .arm
func_02099af4:
    stmfd sp!, {r4}
    ldr r1, _LIT0
    ldmia r0, {r2, r3, r4, ip}
    stmia r1, {r2, r3, r4, ip}
    ldrh r2, [r0, #0x18]
    ldrh r3, [r0, #0x1a]
    strh r2, [r1, #-16]
    strh r3, [r1, #0x20]
    add r0, r0, #0x10
    add r1, r1, #0x28
    ldmia r0, {r2, r3}
    stmia r1, {r2, r3}
    ldmfd sp!, {r4}
    bx lr
_LIT0: .word 0x04000290
