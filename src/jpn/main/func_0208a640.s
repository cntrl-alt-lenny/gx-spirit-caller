; func_0208a640 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088430
        .global func_0208a640
        .arm
func_0208a640:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, [r0, #0x120]
    cmp r1, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    sub r1, r1, #0x1
    str r1, [r0, #0x120]
    ldr r1, [r0, #0x120]
    cmp r1, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    bl func_02088430
    add sp, sp, #0x4
    ldmfd sp!, {pc}
