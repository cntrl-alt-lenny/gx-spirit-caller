; func_0200516c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02003efc
        .extern func_02004ed8
        .global func_0200516c
        .arm
func_0200516c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr r4, [r0, #0x24]
    ldr ip, _LIT0
    mov r4, r4, lsl #0xb
    mov lr, r4, lsr #0x1c
    str lr, [ip, #0x8]
    ldr r4, [sp, #0x18]
    ldr lr, [sp, #0x1c]
    ldr ip, _LIT1
    stmia sp, {r4, lr}
    str ip, [sp, #0x8]
    bl func_02004ed8
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_02102b9c
_LIT1: .word func_02003efc
