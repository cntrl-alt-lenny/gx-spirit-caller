; func_020454f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219d9f0
        .extern func_0203caf0
        .global func_020454f4
        .arm
func_020454f4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r2, [r0]
    cmp r2, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqfd sp!, {pc}
    ldrh r1, [r2, #0x4]
    cmp r1, #0x8
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqfd sp!, {pc}
    cmp r1, #0x1
    moveq r1, #0x0
    streq r1, [r0]
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqfd sp!, {pc}
    mov r0, #0x5
    strh r0, [r2, #0x4]
    bl func_0203caf0
    cmp r0, #0x0
    ldrne r0, _LIT0
    movne r1, #0x0
    strne r1, [r0]
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219d9f0
