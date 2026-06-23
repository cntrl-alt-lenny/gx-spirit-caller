; func_ov011_021d2b74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_PostLocked
        .global func_ov011_021d2b74
        .arm
func_ov011_021d2b74:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r0, #0x44
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r4, r0
    .word 0xebff8a1f
    str r4, [r5]
    ldmia sp!, {r3, r4, r5, pc}
