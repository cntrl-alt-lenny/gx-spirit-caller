; func_ov002_0228ca38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021afff0
        .global func_ov002_0228ca38
        .arm
func_ov002_0228ca38:
    stmfd sp!, {lr}
    sub sp, sp, #0x2c
    mov ip, #0x0
    mov lr, r0, lsl #0x4
    mov r3, ip
    add r0, sp, #0x0
    mov r2, #0x1
.L_300:
    tst r1, r2, lsl lr
    strne r3, [r0, ip, lsl #0x2]
    add r3, r3, #0x1
    addne ip, ip, #0x1
    cmp r3, #0xa
    add lr, lr, #0x1
    ble .L_300
    cmp ip, #0x0
    addle sp, sp, #0x2c
    mvnle r0, #0x0
    ldmlefd sp!, {pc}
    mov r0, ip
    bl func_ov002_021afff0
    add r1, sp, #0x0
    ldr r0, [r1, r0, lsl #0x2]
    add sp, sp, #0x2c
    ldmfd sp!, {pc}
