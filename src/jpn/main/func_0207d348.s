; func_0207d348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207d348
        .arm
func_0207d348:
    ldr r2, [r0, #0x24]
    mov r0, #0x0
    cmp r2, #0x0
    bxeq lr
.L_c4:
    ldr r1, [r2, #0x4]
    ldr r2, [r2, #0xc]
    add r0, r0, r1
    cmp r2, #0x0
    bne .L_c4
    bx lr
