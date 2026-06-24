; func_02004ed8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02003f50
        .extern func_020048a4
        .global func_02004ed8
        .arm
func_02004ed8:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr ip, _LIT0
    ldr ip, [ip]
    cmp ip, #0x0
    beq .L_fc4
    ldr ip, [sp, #0x10]
    ldr lr, [sp, #0x14]
    str ip, [sp]
    ldr ip, [sp, #0x18]
    str lr, [sp, #0x4]
    str ip, [sp, #0x8]
    bl func_02003f50
    add sp, sp, #0xc
    ldmfd sp!, {pc}
.L_fc4:
    ldr ip, [sp, #0x10]
    ldr lr, [sp, #0x14]
    str ip, [sp]
    ldr ip, [sp, #0x18]
    str lr, [sp, #0x4]
    str ip, [sp, #0x8]
    bl func_020048a4
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_02102b9c
