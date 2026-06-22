; func_0201c168 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018f88
        .global func_0201c168
        .arm
func_0201c168:
    stmdb sp!, {r4, lr}
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x818]
    .word 0xeb065b66
    str r0, [r4, #0x810]
    mov r0, #0x1
    bl func_02018f88
    ldmia sp!, {r4, pc}
