; func_02081260 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094410
        .global func_02081260
        .arm
func_02081260:
    stmdb sp!, {r4, r5, r6, lr}
    mov lr, r0
    cmp r3, #0x8
    ldr r0, [sp, #0x14]
    bne .L_644
    ldr r4, [sp, #0x10]
    cmp r4, #0x8
    bne .L_644
    ldr r2, [sp, #0x18]
    mov r1, lr
    mov r2, r2, lsl #0x3
    bl func_02094410
    ldmia sp!, {r4, r5, r6, pc}
.L_644:
    ldr r4, [sp, #0x18]
    cmp r4, #0x4
    bne .L_6a4
    mov r5, r1, lsl #0x2
    add r4, r5, r3, lsl #0x2
    mvn r3, #0x0
    rsb r4, r4, #0x20
    mov r3, r3, lsr r5
    add r1, r4, r1, lsl #0x2
    mov r3, r3, lsl r1
    ldr r1, [sp, #0x10]
    add r5, lr, r2, lsl #0x2
    add r2, r5, r1, lsl #0x2
    and r6, r0, r3, lsr r4
    cmp r5, r2
    mvn r1, r3, lsr r4
    ldmcsia sp!, {r4, r5, r6, pc}
.L_688:
    ldr r0, [r5]
    and r0, r0, r1
    orr r0, r6, r0
    str r0, [r5], #0x4
    cmp r5, r2
    bcc .L_688
    ldmia sp!, {r4, r5, r6, pc}
.L_6a4:
    mov ip, r1, lsl #0x3
    add r1, ip, r3, lsl #0x3
    rsb r1, r1, #0x40
    mvn r3, #0x0
    cmp r1, #0x20
    mov r5, r3, lsr ip
    subcs r4, r1, #0x20
    addcs r3, ip, r4
    movcs r3, r5, lsl r3
    movcs r3, r3, lsr r4
    movcc r3, r5, lsl ip
    mvn r4, #0x0
    add r5, lr, r2, lsl #0x3
    cmp ip, #0x20
    mov r4, r4, lsl r1
    subcs ip, ip, #0x20
    addcs r1, ip, r1
    movcs r1, r4, lsr r1
    movcs r6, r1, lsl ip
    movcc r6, r4, lsr r1
    ldr r1, [sp, #0x10]
    and lr, r0, r3
    add r4, r5, r1, lsl #0x3
    cmp r5, r4
    and ip, r0, r6
    mvn r2, r3
    mvn r1, r6
    ldmcsia sp!, {r4, r5, r6, pc}
.L_714:
    ldr r0, [r5]
    and r0, r0, r2
    orr r0, lr, r0
    str r0, [r5]
    ldr r0, [r5, #0x4]
    and r0, r0, r1
    orr r0, ip, r0
    str r0, [r5, #0x4]
    add r5, r5, #0x8
    cmp r5, r4
    bcc .L_714
    ldmia sp!, {r4, r5, r6, pc}
