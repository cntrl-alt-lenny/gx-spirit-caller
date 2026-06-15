; func_02003ac0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .extern func_020037d0
        .extern func_02003a4c
        .global func_02003ac0
        .arm
func_02003ac0:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr ip, _LIT0
    ldr ip, [ip]
    cmp ip, #0x0
    beq .L_234
    ldr lr, [sp, #0x10]
    ldr ip, [sp, #0x14]
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_020037d0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
.L_234:
    ldr lr, [sp, #0x10]
    ldr ip, [sp, #0x14]
    str lr, [sp]
    str ip, [sp, #0x4]
    bl func_02003a4c
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_02102c7c
