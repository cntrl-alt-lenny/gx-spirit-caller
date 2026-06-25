; func_02003efc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02003d78
        .extern func_02003e78
        .global func_02003efc
        .arm
func_02003efc:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr ip, _LIT0
    ldr ip, [ip]
    cmp ip, #0x0
    beq .L_438
    ldr lr, [sp, #0x10]
    ldr ip, [sp, #0x14]
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_02003d78
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_438:
    ldr lr, [sp, #0x10]
    ldr ip, [sp, #0x14]
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_02003e78
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_02102b9c
