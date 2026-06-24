; func_0207e288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210201c
        .extern data_02102020
        .extern data_021a0804
        .extern func_0207e12c
        .extern func_0207e148
        .extern func_0207e150
        .global func_0207e288
        .arm
func_0207e288:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r1
    str r0, [r2, #0x8]
    bl func_0207e12c
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r2, _LIT3
    ldr r0, _LIT4
    str r3, [r1]
    str r2, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a0804
_LIT1: .word func_0207e150
_LIT2: .word data_0210201c
_LIT3: .word func_0207e148
_LIT4: .word data_02102020
