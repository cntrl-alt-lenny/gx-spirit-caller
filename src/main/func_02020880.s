; func_02020880 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02193440
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_020208c4
        .extern func_0209f070
        .global func_02020880
        .arm
func_02020880:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f138
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    bl func_0209f070
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    mov r0, #0xa
    bl func_0201f138
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02193440
_LIT1: .word func_020208c4
