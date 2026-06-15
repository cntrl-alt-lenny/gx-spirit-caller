; func_02099ba8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02099ba8
        .arm
func_02099ba8:
    ldr r1, _LIT0
    stmfd sp!, {r4}
    ldmia r1, {r2, r3, r4, ip}
    stmia r0!, {r2, r3, r4, ip}
    ldrh ip, [r1, #-16]
    add r1, r1, #0x28
    ldmia r1, {r2, r3}
    stmia r0!, {r2, r3}
    and ip, ip, #0x3
    ldrh r2, [r1, #-8]
    strh ip, [r0]
    and r2, r2, #0x1
    strh r2, [r0, #0x2]
    ldmfd sp!, {r4}
    bx lr
_LIT0: .word 0x04000290
