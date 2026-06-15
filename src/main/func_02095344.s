; func_02095344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02092380
        .global func_02095344
        .arm
func_02095344:
    stmdb sp!, {r4, lr}
    bl func_02092380
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, lr}
    bxeq lr
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r2, #0x10
    str r2, [r1]
    ldr r4, [r1]
    bl OS_RestoreIrq
    cmp r4, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word 0x04fff200
