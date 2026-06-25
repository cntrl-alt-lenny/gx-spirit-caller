; func_02079b8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079bd8
        .global func_02079b8c
        .arm
func_02079b8c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r3, r1
    cmp r3, #0x0
    mov ip, #0x0
    ble .L_160
.L_144:
    mov r2, ip, lsl #0x1
    ldrh r1, [r0, r2]
    add ip, ip, #0x1
    cmp ip, r3
    mvn r1, r1
    strh r1, [r0, r2]
    blt .L_144
.L_160:
    mov r1, r0
    mov r2, #0x1
    bl func_02079bd8
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
