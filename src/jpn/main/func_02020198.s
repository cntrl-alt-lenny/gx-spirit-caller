; func_02020198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_020201d0
        .extern func_02020b30
        .extern func_0209e828
        .global func_02020198
        .arm
func_02020198:
    stmdb sp!, {r3, lr}
    mov r0, #0x3
    bl func_0201f0e4
    ldr r0, _LIT0
    mov r1, #0x0
    bl func_0209e828
    cmp r0, #0x2
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    bl func_02020b30
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word func_020201d0
