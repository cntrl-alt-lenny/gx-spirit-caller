; func_0207e370 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021020fc
        .extern data_02102100
        .extern data_021a08e4
        .extern func_0207e214
        .extern func_0207e230
        .extern func_0207e238
        .global func_0207e370
        .arm
func_0207e370:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r1
    str r0, [r2, #0x8]
    bl func_0207e214
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r3, _LIT1
    ldr r1, _LIT2
    ldr r2, _LIT3
    ldr r0, _LIT4
    str r3, [r1]
    str r2, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a08e4
_LIT1: .word func_0207e238
_LIT2: .word data_021020fc
_LIT3: .word func_0207e230
_LIT4: .word data_02102100
