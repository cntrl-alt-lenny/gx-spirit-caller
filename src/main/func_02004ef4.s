; func_02004ef4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .extern func_02003f70
        .extern func_020048c0
        .global func_02004ef4
        .arm
func_02004ef4:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr ip, _LIT0
    ldr ip, [ip]
    cmp ip, #0x0
    beq .L_1098
    ldr ip, [sp, #0x10]
    ldr lr, [sp, #0x14]
    str ip, [sp]
    ldr ip, [sp, #0x18]
    str lr, [sp, #0x4]
    str ip, [sp, #0x8]
    bl func_02003f70
    add sp, sp, #0xc
    ldmfd sp!, {pc}
.L_1098:
    ldr ip, [sp, #0x10]
    ldr lr, [sp, #0x14]
    str ip, [sp]
    ldr ip, [sp, #0x18]
    str lr, [sp, #0x4]
    str ip, [sp, #0x8]
    bl func_020048c0
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_02102c7c
