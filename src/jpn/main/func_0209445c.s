; func_0209445c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209445c
        .arm
func_0209445c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl}
    add sl, r1, r2
    mov ip, r2, lsr #0x5
    add ip, r1, ip, lsl #0x5
.L_5c:
    cmp r1, ip
    ldmltia r0!, {r2, r3, r4, r5, r6, r7, r8, r9}
    stmltia r1!, {r2, r3, r4, r5, r6, r7, r8, r9}
    blt .L_5c
.L_6c:
    cmp r1, sl
    ldmltia r0!, {r2}
    stmltia r1!, {r2}
    blt .L_6c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl}
    bx lr
