; func_ov023_021b22e4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02001ba4
        .extern func_02006918
        .extern func_020071a4
        .extern func_0202af40
        .extern func_0202c1ac
        .extern func_ov004_021d6ed0
        .global func_ov023_021b22e4
        .arm
func_ov023_021b22e4:
    stmdb sp!, {r3, lr}
    bl func_02001ba4
    bl func_0202c1ac
    bl func_0202af40
    bl func_02006918
    ldr r2, _LIT0
    mov r0, #0x4
    mov r1, #0x1
    bl func_020071a4
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word func_ov004_021d6ed0
