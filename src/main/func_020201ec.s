; func_020201ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_02020224
        .extern func_02020b84
        .extern func_0209e91c
        .global func_020201ec
        .arm
func_020201ec:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f138
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_0209e91c
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    bl func_02020b84
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word func_02020224
