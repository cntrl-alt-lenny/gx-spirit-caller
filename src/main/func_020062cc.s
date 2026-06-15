; func_020062cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006524
        .extern func_0208c9d4
        .extern func_02090624
        .extern func_020907b4
        .extern func_02093790
        .global func_020062cc
        .arm
func_020062cc:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov r0, #0x1
    bl func_020907b4
    mov r0, #0x40000
    bl func_02090624
    mov r0, #0x1
    bl func_02090624
    mov r0, #0x1
    bl func_0208c9d4
    ldr r2, _LIT1
    mov r0, #0x1
    ldrh r1, [r2]
    strh r0, [r2]
    bl func_02093790
    ldmia sp!, {r3, pc}
_LIT0: .word func_02006524
_LIT1: .word 0x04000208
