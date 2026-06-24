; func_020a25fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094500
        .extern func_02094688
        .global func_020a25fc
        .arm
func_020a25fc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    mov lr, r1
    ldr ip, [r0]
    ldr r1, [r0, #0xc]
    cmp lr, #0x4000
    movcc lr, #0x4000
    cmp r2, #0x8000
    movhi r2, #0x8000
    cmp lr, ip
    add r1, ip, r1
    movcc lr, ip
    cmp r2, r1
    movhi r2, r1
    cmp lr, r2
    addcs sp, sp, #0x4
    ldmcsfd sp!, {lr}
    bxcs lr
    cmp r3, #0x0
    beq .L_348
    ldr r0, [r0, #0x8]
    sub r2, r2, lr
    add r0, r0, lr
    mov r1, #0x0
    bl func_02094500
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
.L_348:
    ldr r3, [r0, #0x4]
    ldr r1, [r0, #0x8]
    add r0, r3, lr
    add r1, r1, lr
    sub r2, r2, lr
    bl func_02094688
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
