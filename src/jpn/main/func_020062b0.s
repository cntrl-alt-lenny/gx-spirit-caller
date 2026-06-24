; func_020062b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006508
        .extern func_0208c8ec
        .extern func_0209053c
        .extern func_020906cc
        .extern func_020936a8
        .global func_020062b0
        .arm
func_020062b0:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov r0, #0x1
    bl func_020906cc
    mov r0, #0x40000
    bl func_0209053c
    mov r0, #0x1
    bl func_0209053c
    mov r0, #0x1
    bl func_0208c8ec
    ldr r2, _LIT1
    mov r0, #0x1
    ldrh r1, [r2]
    strh r0, [r2]
    bl func_020936a8
    ldmia sp!, {r3, pc}
_LIT0: .word func_02006508
_LIT1: .word 0x04000208
