; func_0205d4ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020542c4
        .extern func_0205d52c
        .global func_0205d4ec
        .arm
func_0205d4ec:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r3, [r0]
    str r1, [sp, #0x4]
    str r2, [sp, #0x8]
    str r0, [sp]
    ldr r0, [r3, #0x428]
    ldr r1, _LIT0
    add r2, sp, #0x0
    bl func_020542c4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word func_0205d52c
