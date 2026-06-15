; func_0207c570 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207b538
        .global func_0207c570
        .arm
func_0207c570:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0207b538
    add r0, r0, #0x2000
    ldr r1, [r0, #0x270]
    cmp r1, #0x0
    beq .L_324
    ldr r0, [r0, #0x274]
    cmp r0, #0xc
    addhi sp, sp, #0x4
    ldrhi r0, [r1, #0x4]
    ldmhifd sp!, {lr}
    bxhi lr
.L_324:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
