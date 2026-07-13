; func_ov023_021b21e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02001b84
        .extern func_020068fc
        .extern func_02007188
        .extern func_0202aeec
        .extern func_0202c158
        .extern func_ov004_021d6de4
        .global func_ov023_021b21e4
        .arm
func_ov023_021b21e4:
    stmdb sp!, {r3, lr}
    bl func_02001b84
    bl func_0202c158
    bl func_0202aeec
    bl func_020068fc
    ldr r2, _LIT0
    mov r0, #0x4
    mov r1, #0x1
    bl func_02007188
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word func_ov004_021d6de4
