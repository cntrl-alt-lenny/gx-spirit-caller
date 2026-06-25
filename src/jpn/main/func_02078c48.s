; func_02078c48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078c48
        .arm
func_02078c48:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    movs ip, r2, lsr #0x2
    mov lr, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {lr}
    bxeq lr
.L_728:
    ldr r3, [r1], #0x4
    add lr, lr, #0x1
    mov r2, r3, lsr #0x18
    strb r2, [r0]
    mov r2, r3, lsr #0x10
    strb r2, [r0, #0x1]
    mov r2, r3, lsr #0x8
    strb r2, [r0, #0x2]
    strb r3, [r0, #0x3]
    cmp lr, ip
    add r0, r0, #0x4
    bcc .L_728
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
