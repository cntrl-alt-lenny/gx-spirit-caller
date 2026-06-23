; func_0201a7e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018b8c
        .global func_0201a7e4
        .arm
func_0201a7e4:
    stmdb sp!, {r3, lr}
    bl GetSystemWork
    mov r0, #0x1b
    bl func_02018b8c
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
