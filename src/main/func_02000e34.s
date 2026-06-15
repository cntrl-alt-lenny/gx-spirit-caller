; func_02000e34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c60
        .extern data_021040ac
        .extern data_02104f4c
        .extern func_02001540
        .extern func_020057dc
        .global func_02000e34
        .arm
func_02000e34:
    stmdb sp!, {r3, lr}
    ldr r3, _LIT0
    mov ip, #0x0
    ldr r2, _LIT1
    ldr r1, _LIT2
    ldr r0, _LIT3
    str ip, [r3, #0xa38]
    str ip, [r2]
    str ip, [r1, #0xb64]
    bl func_020057dc
    ldmia sp!, {r3, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_02102c60
_LIT2: .word data_021040ac
_LIT3: .word func_02001540
