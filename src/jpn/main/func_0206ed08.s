; func_0206ed08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d17c
        .global func_0206ed08
        .arm
func_0206ed08:
    stmfd sp!, {lr}
    sub sp, sp, #0x14
    add ip, sp, #0xc
    str ip, [sp]
    str r3, [sp, #0x4]
    add r3, sp, #0x8
    bl func_0206d17c
    cmp r0, #0x0
    addlt sp, sp, #0x14
    ldmltfd sp!, {lr}
    bxlt lr
    ldr r1, [sp, #0x18]
    cmp r1, #0x0
    addeq sp, sp, #0x14
    ldmeqfd sp!, {lr}
    bxeq lr
    ldrh r2, [sp, #0x8]
    mov r3, r2, asr #0x8
    mov r2, r2, lsl #0x8
    and r3, r3, #0xff
    and r2, r2, #0xff00
    orr r2, r3, r2
    strh r2, [r1, #0x2]
    ldr lr, [sp, #0xc]
    mov r3, lr, lsr #0x18
    mov r2, lr, lsr #0x8
    mov ip, lr, lsl #0x8
    mov lr, lr, lsl #0x18
    and r3, r3, #0xff
    and r2, r2, #0xff00
    and ip, ip, #0xff0000
    orr r2, r3, r2
    and r3, lr, #-16777216
    orr r2, ip, r2
    orr r2, r3, r2
    str r2, [r1, #0x4]
    add sp, sp, #0x14
    ldmfd sp!, {lr}
    bx lr
