; func_020651a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02055330
        .extern func_02065dc0
        .global func_020651a8
        .arm
func_020651a8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r3, r1
    ldrb r1, [r3, #0x7]
    mov r4, r0
    cmp r1, #0x1
    beq .L_424
    cmp r1, #0x2
    beq .L_4c0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_424:
    ldrb r0, [r3, #0xc]
    cmp r0, #0x2
    addhi sp, sp, #0x8
    ldmhiia sp!, {r4, pc}
    add r0, r4, r0, lsl #0x2
    mov r1, #0x1
    str r1, [r0, #0x14]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4, #0x4]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_490
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, pc}
.L_490:
    mov r0, #0x1
    str r0, [r4, #0x10]
    bl func_02055330
    ldr r1, _LIT0
    add r0, r0, r1
    str r0, [r4, #0x28]
    ldr r0, [r4, #0x10]
    ldr r1, [r4, #0x3c]
    ldr r2, [r4, #0x34]
    blx r2
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_4c0:
    mov r0, #0x3
    strb r0, [r3, #0x7]
    ldrh r0, [r2, #0x2]
    mov ip, #0x15
    mov r1, r0, asr #0x8
    mov r0, r0, lsl #0x8
    str ip, [sp]
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    mov ip, r0, lsl #0x10
    ldr r1, [r2, #0x4]
    ldr r0, [r4]
    mov r2, ip, lsr #0x10
    bl func_02065dc0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00002710
