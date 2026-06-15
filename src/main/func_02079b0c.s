; func_02079b0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02079b0c
        .arm
func_02079b0c:
    subs ip, r2, #0x1
    bmi .L_c38
.L_c0c:
    mov r2, ip, lsl #0x1
    ldrh r3, [r1, r2]
    ldrh r2, [r0, r2]
    cmp r2, r3
    movhi r0, #0x1
    bxhi lr
    cmp r2, r3
    mvncc r0, #0x0
    bxcc lr
    subs ip, ip, #0x1
    bpl .L_c0c
.L_c38:
    mov r0, #0x0
    bx lr
