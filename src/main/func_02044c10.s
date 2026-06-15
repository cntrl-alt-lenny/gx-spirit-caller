; func_02044c10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02044610
        .global func_02044c10
        .arm
func_02044c10:
    stmfd sp!, {lr}
    sub sp, sp, #0x14
    add r0, sp, #0x0
    bl func_02044610
    ldr r2, [sp, #0x8]
    ldr r1, [sp, #0xc]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    bne .L_530
    ldr r1, [sp, #0x4]
    ldr r2, [sp]
    cmp r1, r0
    cmpeq r2, r0
    addeq sp, sp, #0x14
    moveq r0, #0x1
    ldmeqfd sp!, {pc}
.L_530:
    mov r0, #0x0
    add sp, sp, #0x14
    ldmfd sp!, {pc}
