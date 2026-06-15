; func_02063620 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020643ec
        .global func_02063620
        .arm
func_02063620:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, [r0, #0xc]
    cmp r1, #0x7
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqfd sp!, {pc}
    cmp r1, #0x6
    moveq r2, #0x0
    movne r2, #0x1
    mov r1, #0x2
    bl func_020643ec
    cmp r0, #0x0
    moveq r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x4
    ldmfd sp!, {pc}
