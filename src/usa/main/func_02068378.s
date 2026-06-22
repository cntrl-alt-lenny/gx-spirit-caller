; func_02068378 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02068378
        .arm
func_02068378:
    ldr r2, [r0]
    cmp r2, #0x0
    beq .L_9c
    ldr r1, [r2, #0x20]
    str r1, [r0]
    ldr r1, [r0]
    cmp r1, #0x0
    moveq r1, #0x0
    streq r1, [r0, #0x4]
    ldr r1, [r0, #0x8]
    sub r1, r1, #0x1
    str r1, [r0, #0x8]
.L_9c:
    mov r0, r2
    bx lr
