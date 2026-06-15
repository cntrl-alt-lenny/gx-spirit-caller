; func_0209db88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8d2c
        .extern func_020928cc
        .extern func_0209dc8c
        .global func_0209db88
        .arm
func_0209db88:
    stmdb sp!, {r0, r1, r2, r3}
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0209dc8c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    addne sp, sp, #0x10
    bxne lr
    ldr r0, _LIT0
    mov r1, #0x2
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    bl func_020928cc
    ldr r0, _LIT0
    add r1, sp, #0x8
    ldr r2, [r0]
    ldr r0, [sp, #0x8]
    ldr r2, [r2, #0x4]
    cmp r0, #0x0
    bic r1, r1, #0x3
    addeq sp, sp, #0x4
    add ip, r1, #0x4
    ldrh r3, [r2]
    mov r0, #0x3
    ldmeqfd sp!, {lr}
    addeq sp, sp, #0x10
    bxeq lr
    mov r2, #0x0
.L_458:
    add ip, ip, #0x4
    ldr r1, [ip, #-4]
    cmp r1, r3
    ldr r1, [sp, #0x8]
    moveq r0, r2
    subs r1, r1, #0x1
    str r1, [sp, #0x8]
    bne .L_458
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    add sp, sp, #0x10
    bx lr
_LIT0: .word data_021a8d2c
