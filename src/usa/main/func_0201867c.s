; func_0201867c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .global func_0201867c
        .arm
func_0201867c:
    stmdb sp!, {r3, lr}
    bl GetSystemWork
    ldr r0, [r0, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmia sp!, {r3, pc}
