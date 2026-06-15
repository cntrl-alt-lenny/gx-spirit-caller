; func_02079ac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02079ac4
        .arm
func_02079ac4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    b .L_be0
.L_bc8:
    mov lr, r2, lsl #0x1
    ldrh ip, [r0, lr]
    add r2, r2, #0x1
    add r1, r1, ip
    strh r1, [r0, lr]
    mov r1, r1, lsr #0x10
.L_be0:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
    cmp r2, r3
    blt .L_bc8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
