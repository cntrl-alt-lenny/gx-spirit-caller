; func_0205d4c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0205d4c0
        .arm
func_0205d4c0:
    ldr r0, [r1, #0x8]
    cmp r0, #0x0
    beq .L_24
    ldr r3, [r2]
    ldr r0, [r0]
    cmp r3, r0
    streq r1, [r2, #0x4]
    moveq r0, #0x0
    bxeq lr
.L_24:
    mov r0, #0x1
    bx lr
