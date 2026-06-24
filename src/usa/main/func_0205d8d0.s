; func_0205d8d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020547cc
        .extern func_0205d92c
        .extern func_0205d9a8
        .extern func_0205d9b8
        .global func_0205d8d0
        .arm
func_0205d8d0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r4, [r0]
    mov r1, #0x0
    str r1, [r4, #0x430]
    str r1, [r4, #0x42c]
    ldr r0, _LIT0
    ldr r2, _LIT1
    str r0, [sp]
    ldr r3, _LIT2
    mov r0, #0x1c
    mov r1, #0x4
    bl func_020547cc
    str r0, [r4, #0x428]
    ldr r0, [r4, #0x428]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word func_0205d92c
_LIT1: .word func_0205d9b8
_LIT2: .word func_0205d9a8
