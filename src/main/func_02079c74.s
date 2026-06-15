; func_02079c74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02079cc0
        .global func_02079c74
        .arm
func_02079c74:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov r3, r1
    cmp r3, #0x0
    mov ip, #0x0
    ble .L_da0
.L_d84:
    mov r2, ip, lsl #0x1
    ldrh r1, [r0, r2]
    add ip, ip, #0x1
    cmp ip, r3
    mvn r1, r1
    strh r1, [r0, r2]
    blt .L_d84
.L_da0:
    mov r1, r0
    mov r2, #0x1
    bl func_02079cc0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
