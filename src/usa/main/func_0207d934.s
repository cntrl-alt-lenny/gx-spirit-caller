; func_0207d934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d934
        .arm
func_0207d934:
    ldrh r2, [r1, #0x2]
    add r3, r1, #0x10
    mov r2, r2, asr #0x8
    and r2, r2, #0x7f
    mov r2, r2, lsl #0x10
    sub r2, r1, r2, lsr #0x10
    str r2, [r0]
    ldr r1, [r1, #0x4]
    add r1, r1, r3
    str r1, [r0, #0x4]
    bx lr
