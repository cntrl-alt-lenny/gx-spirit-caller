; func_020a6858 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a6858
        .arm
func_020a6858:
    stmdb sp!, {r4, lr}
    mov lr, #0x0
    mov r3, lr
.L_17c:
    mov r4, lr
    mov ip, r3
.L_184:
    ands r2, r4, #0x1
    eorne r4, r1, r4, lsr #0x1
    add ip, ip, #0x1
    moveq r4, r4, lsr #0x1
    cmp ip, #0x8
    bcc .L_184
    mov r2, lr, lsl #0x1
    add lr, lr, #0x1
    strh r4, [r0, r2]
    cmp lr, #0x100
    bcc .L_17c
    ldmia sp!, {r4, lr}
    bx lr
