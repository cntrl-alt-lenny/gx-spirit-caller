; func_020569c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020569c0
        .arm
func_020569c0:
    ldr r1, [r1, #0x8]
    cmp r1, #0x0
    beq .L_9e8
    ldr r0, [r1]
    cmp r0, r2
    subgt r0, r0, #0x1
    strgt r0, [r1]
.L_9e8:
    mov r0, #0x1
    bx lr
