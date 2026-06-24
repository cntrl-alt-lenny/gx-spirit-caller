; func_0201f164 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191f00
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_0201f1a4
        .extern func_0209edec
        .global func_0201f164
        .arm
func_0201f164:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f0e4
    ldr r0, _LIT0
    ldr r1, _LIT1
    bl func_0209edec
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    mov r0, #0x9
    bl func_0201f0e4
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word func_0201f1a4
_LIT1: .word data_02191f00
