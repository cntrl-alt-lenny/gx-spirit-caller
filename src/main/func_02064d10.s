; func_02064d10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205442c
        .global func_02064d10
        .arm
func_02064d10:
    stmfd sp!, {lr}
    sub sp, sp, #0xa4
    add r3, sp, #0x4
    str r1, [sp, #0x4]
    strh r2, [sp, #0x8]
    str r3, [sp]
    ldr r0, [r0, #0xc]
    add r1, sp, #0x0
    bl func_0205442c
    cmp r0, #0x0
    ldrne r0, [r0]
    moveq r0, #0x0
    add sp, sp, #0xa4
    ldmfd sp!, {pc}
