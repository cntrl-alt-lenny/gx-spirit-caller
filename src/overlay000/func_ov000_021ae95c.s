; func_ov000_021ae95c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_ov000_021c758c
        .extern data_ov000_021c75c4
        .extern func_ov000_021ab4bc
        .extern func_ov000_021ab4ec
        .extern func_ov000_021ab5d8
        .extern func_ov000_021ab62c
        .extern func_ov000_021ab688
        .extern func_ov000_021ab8f8
        .extern func_ov000_021ac578
        .extern func_ov000_021ac72c
        .extern func_ov000_021ac810
        .extern func_ov000_021ac834
        .extern func_ov000_021adb58
        .extern func_ov000_021adfc4
        .extern func_ov000_021ae510
        .extern func_ov000_021ae69c
        .extern func_ov000_021b3544_unk
        .global func_ov000_021ae95c
        .arm
func_ov000_021ae95c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r0, [r0, #0x2a8]
    mov r0, r0, lsr #0x18
    cmp r0, #0x3
    bcc .L_340
    ldr r0, [r4, #0x270]
    mov r0, r0, lsr #0x18
    cmp r0, #0x5
    bhi .L_340
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x15
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    bne .L_328
    add r6, r4, #0x154
    mov r5, #0x0
.L_308:
    mov r0, r6
    bl func_ov000_021ac578
    mov r0, r6
    bl func_ov000_021ac72c
    add r5, r5, #0x1
    cmp r5, #0x1
    add r6, r6, #0x14
    bcc .L_308
.L_328:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x1c
    bl func_ov000_021ae510
    add r0, r4, #0x78
    bl func_ov000_021b3544_unk
.L_340:
    ldr r1, [r4, #0x270]
    mov r2, r1, lsr #0x18
    cmp r2, #0x7
    addls pc, pc, r2, lsl #0x2
    ldmia sp!, {r4, r5, r6, pc}
    ldmia sp!, {r4, r5, r6, pc}
    b .L_374
    b .L_398
    b .L_46c
    b .L_4fc
    b .L_504
    b .L_57c
    b .L_604
.L_374:
    mov r0, #0x0
    bl func_ov000_021ac810
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_398:
    bl func_ov000_021ac834
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x274]
    mov r0, #0x0
    mov r1, r1, lsl #0xa
    mov r1, r1, lsr #0x18
    bl func_ov000_021ab4bc
    mov r1, #0x3f
    mov r2, r1
    mov r0, #0x0
    bl func_ov000_021ab62c
    ldr r1, [r4, #0x274]
    mov r0, #0x0
    mov r3, r1, lsl #0xa
    mvn r1, r3, lsr #0x18
    and r2, r1, #0xf
    mov r1, r3, lsr #0x18
    orr r2, r2, #0x10
    bl func_ov000_021ab5d8
    mov r0, #0x0
    mov r1, r0
    mov r2, #0x10
    bl func_ov000_021ab688
    bl func_ov000_021ab8f8
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1e
    bl func_ov000_021adb58
    ldr r0, [r4, #0x254]
    ldr r1, [r4, #0x258]
    bl func_ov000_021adfc4
    ldr r1, [r4, #0x26c]
    ldr r0, [r4, #0x254]
    orr r1, r1, #0x800
    str r1, [r4, #0x26c]
    cmp r0, #0x0
    beq .L_434
    bl Task_InvokeLocked
.L_434:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    beq .L_444
    bl Task_InvokeLocked
.L_444:
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
.L_46c:
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    add r5, r0, #0x18
    cmp r5, #0xff
    ble .L_494
    bic r1, r1, #-16777216
    add r0, r2, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    mov r5, #0xff
.L_494:
    mov r0, #0xc
    mul ip, r5, r0
    ldr r3, _LIT2
    mov r0, ip, lsr #0x1f
    smull r2, r1, r3, ip
    add r1, ip, r1
    add r1, r0, r1, asr #0x7
    rsb r2, r1, #0x10
    mov r0, #0x0
    bl func_ov000_021ab688
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
.L_4fc:
    bl func_ov000_021ae69c
    ldmia sp!, {r4, r5, r6, pc}
.L_504:
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    sub r5, r0, #0x8
    cmp r5, #0x0
    bgt .L_564
    mov r1, #0x1f
    mov r2, r1
    mov r0, #0x0
    mov r5, #0xff
    bl func_ov000_021ab62c
    ldr r1, [r4, #0x274]
    mov r0, #0x0
    mov r3, r1, lsl #0xa
    mvn r1, r3, lsr #0x18
    and r2, r1, #0xf
    mov r1, r3, lsr #0x18
    orr r2, r2, #0x10
    bl func_ov000_021ab5d8
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
.L_564:
    ldr r1, [r4, #0x270]
    mov r0, r5, lsl #0x18
    bic r1, r1, #0xff0000
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_57c:
    mov r0, r1, lsl #0x8
    mov r0, r0, lsr #0x18
    subs r5, r0, #0x18
    bpl .L_5c0
    ldr r0, [r4, #0x274]
    mov r5, #0x0
    mov r1, r0, lsl #0xa
    mov r0, r5
    mov r1, r1, lsr #0x18
    bl func_ov000_021ab4ec
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    b .L_5e8
.L_5c0:
    mov r0, #0xc
    mul ip, r5, r0
    ldr r3, _LIT2
    mov r0, ip, lsr #0x1f
    smull r2, r1, r3, ip
    add r1, ip, r1
    add r1, r0, r1, asr #0x7
    rsb r2, r1, #0x10
    mov r0, #0x0
    bl func_ov000_021ab688
.L_5e8:
    ldr r1, [r4, #0x270]
    and r0, r5, #0xff
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
.L_604:
    bl func_ov000_021ac834
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r4, #0x270]
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c758c
_LIT1: .word data_ov000_021c75c4
_LIT2: .word 0x80808081
_LIT3: .word 0x04000018
