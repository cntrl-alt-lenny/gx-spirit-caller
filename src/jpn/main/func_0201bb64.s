; func_0201bb64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020c5c04
        .global func_0201bb64
        .arm
func_0201bb64:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, r0
    ldr r0, _LIT0
    .word 0xeb065cbf
    str r0, [r4, #0x810]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_020c5c04
