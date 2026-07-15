; func_ov005_021ab200 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ab200
        .arm
func_ov005_021ab200:
    ldmia r1, {r2, ip}
    cmp ip, r2
    bne .L_88
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    bx lr
.L_88:
    ldr r3, [r0, #0x8]
    ldr r2, [ip, #0x8]
    mov r0, #0x1c
    mla r0, r2, r0, r3
    str r0, [r1, #0x4]
    ldr r0, [ip]
    bx lr
