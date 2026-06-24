; func_02046704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219da0c
        .extern func_02046778
        .extern func_020467ec
        .extern func_0204681c
        .global func_02046704
        .arm
func_02046704:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r1, #0x0
    mov ip, #0x0
    ble .L_3c
    ldr r2, _LIT0
    ldr r3, [r2]
.L_1c:
    add r2, r3, ip, lsl #0x2
    ldr r2, [r2, #0x448]
    cmp r0, r2
    beq .L_3c
    add r2, ip, #0x1
    and ip, r2, #0xff
    cmp ip, r1
    blt .L_1c
.L_3c:
    cmp ip, r1
    addge sp, sp, #0x4
    movge r0, #0x0
    ldmgefd sp!, {pc}
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, ip
    ldrb r0, [r0, #0x61c]
    bl func_0204681c
    bl func_020467ec
    bl func_02046778
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219da0c
