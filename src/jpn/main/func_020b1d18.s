; func_020b1d18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b1d18
        .arm
func_020b1d18:
    ands r2, r0, #-2147483648
    rsbmi r0, r0, #0x0
    cmp r0, #0x0
    mov r1, #0x0
    bxeq lr
    mov r3, #0x400
    add r3, r3, #0x1e
    clz ip, r0
    movs r0, r0, lsl ip
    sub r3, r3, ip
    movs r1, r0
    mov r0, r1, lsl #0x15
    add r1, r1, r1
    orr r1, r2, r1, lsr #0xc
    orr r1, r1, r3, lsl #0x14
    bx lr
