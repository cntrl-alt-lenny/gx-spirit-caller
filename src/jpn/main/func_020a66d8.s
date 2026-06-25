; func_020a66d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a66d8
        .arm
func_020a66d8:
    stmdb sp!, {r4, lr}
    mov lr, #0x0
    mov r3, lr
.L_50:
    mov r4, lr
    mov ip, r3
.L_58:
    ands r2, r4, #0x1
    eorne r4, r1, r4, lsr #0x1
    add ip, ip, #0x1
    moveq r4, r4, lsr #0x1
    cmp ip, #0x8
    bcc .L_58
    str r4, [r0, lr, lsl #0x2]
    add lr, lr, #0x1
    cmp lr, #0x100
    bcc .L_50
    ldmia sp!, {r4, lr}
    bx lr
