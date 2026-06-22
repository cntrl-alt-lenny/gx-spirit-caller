; func_020920c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020920c0
        .arm
func_020920c0:
    ldr r2, [r0]
    cmp r2, #0x0
    beq .L_80
    ldr r1, [r2, #0x80]
    str r1, [r0]
    cmp r1, #0x0
    movne r0, #0x0
    strne r0, [r1, #0x7c]
    moveq r1, #0x0
    streq r1, [r0, #0x4]
    streq r1, [r2, #0x78]
.L_80:
    mov r0, r2
    bx lr
