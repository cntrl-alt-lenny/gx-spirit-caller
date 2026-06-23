; func_0200c220 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200c220
        .arm
func_0200c220:
    mov ip, #0x0
.L_24c:
    add r3, r0, ip, lsl #0x4
    ldr r3, [r3, #0x1e8]
    cmp r3, #0x0
    blt .L_270
    cmp r1, r3
    beq .L_270
    add ip, ip, #0x1
    cmp ip, #0x8
    blt .L_24c
.L_270:
    cmp ip, #0x8
    moveq r0, #0x0
    bxeq lr
    add r0, r0, ip, lsl #0x4
    str r2, [r0, #0x1e4]
    str r1, [r0, #0x1e8]
    mov r0, #0x1
    bx lr
