; func_020aadcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020aadcc
        .arm
func_020aadcc:
    stmdb sp!, {r3, lr}
    mov lr, r0
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
.L_d8:
    ldrsb r3, [r1], #0x1
    mov ip, lr
    strb r3, [lr], #0x1
    ldrsb r3, [ip]
    cmp r3, #0x0
    bne .L_10c
    subs r2, r2, #0x1
    ldmeqia sp!, {r3, pc}
    mov r1, #0x0
.L_fc:
    strb r1, [lr], #0x1
    subs r2, r2, #0x1
    bne .L_fc
    ldmia sp!, {r3, pc}
.L_10c:
    subs r2, r2, #0x1
    bne .L_d8
    ldmia sp!, {r3, pc}
