; func_02087348 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4854
        .global func_02087348
        .arm
func_02087348:
    ldr r0, _LIT0
    mov r3, #0x1
    ldr r2, [r0]
    mov r0, #0x0
.L_10:
    ands r1, r2, r3
    ldreq r1, _LIT0
    ldreq r2, [r1]
    orreq r2, r2, r3
    streq r2, [r1]
    bxeq lr
    add r0, r0, #0x1
    cmp r0, #0x8
    mov r3, r3, lsl #0x1
    blt .L_10
    mvn r0, #0x0
    bx lr
_LIT0: .word data_021a4854
