; func_020051b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b9c
        .extern func_02003e78
        .extern func_020048a4
        .global func_020051b0
        .arm
func_020051b0:
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
    bl func_020048a4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_02102b9c
_LIT1: .word func_02003e78
