; func_02046770 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daec
        .extern func_020467e4
        .extern func_02046858
        .extern func_02046888
        .global func_02046770
        .arm
func_02046770:
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
    ldrb r0, [r0, #0x624]
    bl func_02046888
    bl func_02046858
    bl func_020467e4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219daec
