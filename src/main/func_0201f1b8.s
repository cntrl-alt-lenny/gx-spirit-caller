; func_0201f1b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191fe0
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201f1f8
        .extern func_0209eee0
        .global func_0201f1b8
        .arm
func_0201f1b8:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f138
    ldr r0, _LIT0
    ldr r1, _LIT1
    bl func_0209eee0
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word func_0201f1f8
_LIT1: .word data_02191fe0
