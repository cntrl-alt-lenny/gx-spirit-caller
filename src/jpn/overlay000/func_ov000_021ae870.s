; func_ov000_021ae870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov000_021c74ac
        .extern data_ov000_021c74e4
        .extern func_ov000_021ab3dc
        .extern func_ov000_021ab40c
        .extern func_ov000_021ab4f8
        .extern func_ov000_021ab54c
        .extern func_ov000_021ab5a8
        .extern func_ov000_021ab818
        .extern func_ov000_021ac498
        .extern func_ov000_021ac64c
        .extern func_ov000_021ac730
        .extern func_ov000_021ac754
        .extern func_ov000_021ada78
        .extern func_ov000_021adeb8
        .extern func_ov000_021ae404
        .extern func_ov000_021ae590
        .extern func_ov000_021b3458_unk
        .global func_ov000_021ae870
        .arm
func_ov000_021ae870:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2a8]
    mov r0, r0, lsr #0x18
    cmp r0, #0x3
    bcc .L_360
    ldr r0, [r4, #0x270]
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    bhi .L_360
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x15
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_348
    add r6, r4, #0x154
    mov r5, #0x0
.L_328:
    mov r0, r6
    bl func_ov000_021ac498
    mov r0, r6
    bl func_ov000_021ac64c
    add r5, r5, #0x1
    cmp r5, #0x1
    add r6, r6, #0x14
    bcc .L_328
.L_348:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x1c
    bl func_ov000_021ae404
    add r0, r4, #0x78
    bl func_ov000_021b3458_unk
.L_360:
    ldr r1, [r4, #0x270]
    mov r2, r1, lsr #0x18
    cmp r2, #0x7
    addls pc, pc, r2, lsl #0x2
    ldmia sp!, {r4, r5, r6, pc}
    ldmia sp!, {r4, r5, r6, pc}
    b .L_394
    b .L_3b8
    b .L_48c
    b .L_51c
    b .L_524
    b .L_59c
    b .L_624
.L_394:
    mov r0, #0x0
    bl func_ov000_021ac730
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_3b8:
    bl func_ov000_021ac754
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x274]
    mov r0, #0x0
    mov r1, r1, lsl #0xa
    mov r1, r1, lsr #0x18
    bl func_ov000_021ab3dc
    mov r1, #0x3f
    mov r2, r1
    mov r0, #0x0
    bl func_ov000_021ab54c
    ldr r1, [r4, #0x274]
    mov r0, #0x0
    mov r3, r1, lsl #0xa
    mvn r1, r3, lsr #0x18
    and r2, r1, #0xf
    mov r1, r3, lsr #0x18
    orr r2, r2, #0x10
    bl func_ov000_021ab4f8
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x10
    bl func_ov000_021ab5a8
    bl func_ov000_021ab818
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1e
    bl func_ov000_021ada78
    ldr r0, [r4, #0x254]
    ldr r1, [r4, #0x258]
    bl func_ov000_021adeb8
    ldr r1, [r4, #0x26c]
    ldr r0, [r4, #0x254]
    orr r1, r1, #0x800
    str r1, [r4, #0x26c]
    cmp r0, #0x0
    beq .L_454
    bl Task_InvokeLocked
.L_454:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    beq .L_464
    bl Task_InvokeLocked
.L_464:
    ldr r1, [r4, #0x270]
    mov r2, #0x0
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r2, [r4, #0x258]
    str r2, [r4, #0x254]
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_48c:
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r5, r0, #0x18
    cmp r5, #0xff
    ble .L_4b4
    bic r1, r1, #-16777216
    add r0, r2, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    mov r5, #0xff
.L_4b4:
    mov r0, #0xc
    mul ip, r5, r0
    ldr r3, _LIT2
    mov r0, ip, lsr #0x1f
    smull r2, r1, r3, ip
    add r1, ip, r1
    add r1, r0, r1, asr #0x7
    rsb r2, r1, #0x10
    mov r0, #0x0
    bl func_ov000_021ab5a8
    ldr r1, _LIT3
    mov r2, #0x0
    str r2, [r1]
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0xa
    mov r0, r0, lsr #0x18
    tst r0, #0x1
    strne r2, [r1, #-8]
    streq r2, [r1, #0x4]
    ldr r1, [r4, #0x270]
    and r0, r5, #0xff
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_51c:
    bl func_ov000_021ae590
    ldmia sp!, {r4, r5, r6, pc}
.L_524:
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    sub r5, r0, #0x8
    cmp r5, #0x0
    bgt .L_584
    mov r1, #0x1f
    mov r2, r1
    mov r0, #0x0
    mov r5, #0xff
    bl func_ov000_021ab54c
    ldr r1, [r4, #0x274]
    mov r0, #0x0
    mov r3, r1, lsl #0xa
    mvn r1, r3, lsr #0x18
    and r2, r1, #0xf
    mov r1, r3, lsr #0x18
    orr r2, r2, #0x10
    bl func_ov000_021ab4f8
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
.L_584:
    ldr r1, [r4, #0x270]
    mov r0, r5, lsl #0x18
    bic r1, r1, #0xff0000
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_59c:
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    subs r5, r0, #0x18
    bpl .L_5e0
    ldr r0, [r4, #0x274]
    mov r5, #0x0
    mov r1, r0, lsl #0xa
    mov r0, r5
    mov r1, r1, lsr #0x18
    bl func_ov000_021ab40c
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    b .L_608
.L_5e0:
    mov r0, #0xc
    mul ip, r5, r0
    ldr r3, _LIT2
    mov r0, ip, lsr #0x1f
    smull r2, r1, r3, ip
    add r1, ip, r1
    add r1, r0, r1, asr #0x7
    rsb r2, r1, #0x10
    mov r0, #0x0
    bl func_ov000_021ab5a8
.L_608:
    ldr r1, [r4, #0x270]
    and r0, r5, #0xff
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_624:
    bl func_ov000_021ac754
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c74ac
_LIT1: .word data_ov000_021c74e4
_LIT2: .word 0x80808081
_LIT3: .word 0x04000018
