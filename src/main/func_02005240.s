; func_02005240 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .extern func_02003400
        .extern func_02004ef4
        .global func_02005240
        .arm
func_02005240:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr ip, _LIT0
    mov r4, #0x0
    str r4, [ip, #0x10]
    ldr lr, [r0, #0x24]
    ldr r4, [sp, #0x18]
    mov lr, lr, lsl #0xb
    mov lr, lr, lsr #0x1c
    str lr, [ip, #0x8]
    ldr ip, [r0, #0x24]
    ldr lr, [sp, #0x1c]
    orr ip, ip, #0x10000
    str ip, [r0, #0x24]
    ldr ip, _LIT1
    stmia sp, {r4, lr}
    str ip, [sp, #0x8]
    bl func_02004ef4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_02102c7c
_LIT1: .word func_02003400
