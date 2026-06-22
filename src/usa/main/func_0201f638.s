; func_0201f638 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02192200
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_020a0510
        .global func_0201f638
        .arm
func_0201f638:
    stmdb sp!, {r3, lr}
    mov r0, #0x6
    bl func_0201f0e4
    ldr r0, _LIT0
    mov r1, #0xd
    bl func_020a0510
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_02192200
