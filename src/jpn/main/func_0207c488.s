; func_0207c488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b450
        .global func_0207c488
        .arm
func_0207c488:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0207b450
    add r0, r0, #0x2000
    ldr r1, [r0, #0x270]
    cmp r1, #0x0
    beq .L_6dc
    ldr r0, [r0, #0x274]
    cmp r0, #0xc
    addhi sp, sp, #0x4
    ldrhi r0, [r1, #0x4]
    ldmhifd sp!, {lr}
    bxhi lr
.L_6dc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
