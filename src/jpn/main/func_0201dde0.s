; func_0201dde0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201d9c8
        .extern func_0201dd58
        .extern func_0208f5c8
        .extern func_0208f630
        .extern func_0208f698
        .extern func_0208f700
        .extern func_0208f768
        .extern func_0208f7d0
        .extern func_0208f838
        .extern func_0208f8a0
        .extern func_0208f908
        .extern func_0208f970
        .extern func_0208f9d8
        .extern func_0208fa40
        .extern func_0209281c
        .global func_0201dde0
        .arm
func_0201dde0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x54
    mov r8, r1
    mov r9, r0
    ldrh r1, [r9, #0x14]
    ldrb r0, [r8, #0x8]
    ldr r3, [r8, #0xc]
    bic r1, r1, #0x60
    mov r0, r0, lsl #0x1e
    orr r0, r1, r0, lsr #0x19
    strh r0, [r9, #0x14]
    ldrh r2, [r9, #0x14]
    ldrb r1, [r8, #0x9]
    add r0, r3, #0x3
    bic r2, r2, #0x180
    mov r1, r1, lsl #0x1e
    orr r1, r2, r1, lsr #0x17
    strh r1, [r9, #0x14]
    ldrh r1, [r8, #0x10]
    ldrh r2, [r9, #0x16]
    bic r4, r0, #0x3
    and r1, r1, #0xff
    bic r2, r2, #0x7f
    and r1, r1, #0x7f
    orr r1, r2, r1
    strh r1, [r9, #0x16]
    ldrh r1, [r8, #0x12]
    ldrh r2, [r9, #0x16]
    add r5, r8, #0x1c
    and r0, r1, #0xff
    bic r1, r2, #0x3f80
    mov r0, r0, lsl #0x19
    orr r0, r1, r0, lsr #0x12
    strh r0, [r9, #0x16]
    ldrb r0, [r8, #0x8]
    cmp r0, #0x0
    ldrh r0, [r9, #0x14]
    orrne r0, r0, #0x200
    biceq r0, r0, #0x200
    strh r0, [r9, #0x14]
    ldr r1, [r9, #0x8]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_4f0
    ldr r0, [r9, #0x18]
    mov r0, r0, lsl #0x19
    mov r2, r0, lsr #0x19
    cmp r2, #0x20
    bcs .L_e8
    ldrh r0, [r9, #0x24]
    ldrh r1, [r9, #0x26]
    mov r0, r0, lsl #0x18
    mov r1, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    rsb r0, r0, r1, lsr #0x18
    add r0, r2, r0
    cmp r0, #0x20
    bcs .L_120
.L_e8:
    ldr r0, [r9, #0x18]
    mov r0, r0, lsl #0x12
    mov r2, r0, lsr #0x19
    cmp r2, #0x20
    bcs .L_420
    ldrh r0, [r9, #0x24]
    ldrh r1, [r9, #0x26]
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x18
    rsb r0, r0, r1, lsr #0x18
    add r0, r2, r0
    cmp r0, #0x20
    bcc .L_420
.L_120:
    mov r7, r9
    add r6, sp, #0x2c
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7, {r0, r1}
    stmia r6, {r0, r1}
    ldrh r0, [r9, #0x24]
    mov fp, #0x0
    ldrh r1, [r9, #0x26]
    mov r2, r0, lsl #0x18
    mov r0, r0, lsl #0x10
    ldr r6, [r9, #0x18]
    mov r3, r2, lsr #0x18
    mov r7, r0, lsr #0x18
    mov r2, r6, lsl #0x19
    mov r0, r6, lsl #0x12
    mov r6, r1, lsl #0x18
    rsb r6, r3, r6, lsr #0x18
    mov r1, r1, lsl #0x10
    add r6, r6, r2, lsr #0x19
    rsb r1, r7, r1, lsr #0x18
    mov sl, fp
    add r7, r1, r0, lsr #0x19
    cmp r6, #0x20
    blt .L_1bc
    add r0, r3, #0x20
    sub r0, r0, r2, lsr #0x19
    ldrh r1, [sp, #0x52]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff
    and r0, r0, #0xff
    orr r0, r1, r0
    strh r0, [sp, #0x52]
    ldrh r0, [sp, #0x52]
    mov r0, r0, lsl #0x18
    mov fp, r0, lsr #0x18
.L_1bc:
    cmp r7, #0x20
    blt .L_208
    ldrh r2, [r9, #0x24]
    ldr r1, [r9, #0x18]
    ldrh r0, [sp, #0x52]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    add r2, r2, #0x20
    mov r1, r1, lsl #0x12
    sub r1, r2, r1, lsr #0x19
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r0, #0xff00
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x10
    strh r0, [sp, #0x52]
    ldrh r0, [sp, #0x52]
    mov r0, r0, lsl #0x10
    mov sl, r0, lsr #0x18
.L_208:
    add r0, sp, #0x2c
    mov r1, r8
    bl func_0201d9c8
    cmp r6, #0x20
    blt .L_2d4
    mov lr, r9
    add ip, sp, #0x2c
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0xff
    str r0, [sp]
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    ldrh r0, [sp, #0x50]
    ldr r1, [sp, #0x44]
    cmp r7, #0x20
    bic r2, r0, #0xff
    ldr r0, [sp]
    orr r0, r2, r0
    strh r0, [sp, #0x50]
    bic r0, r1, #0x7f
    str r0, [sp, #0x44]
    blt .L_2ac
    ldrh r2, [r9, #0x24]
    ldr r1, [r9, #0x18]
    ldrh r0, [sp, #0x52]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x18
    add r2, r2, #0x20
    mov r1, r1, lsl #0x12
    sub r1, r2, r1, lsr #0x19
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r0, #0xff00
    mov r0, r1, lsl #0x18
    orr r0, r2, r0, lsr #0x10
    strh r0, [sp, #0x52]
.L_2ac:
    ldr r1, [sp, #0x44]
    mov r0, r9
    mov r1, r1, lsl #0x12
    mov r2, r1, lsr #0x19
    mov r1, #0x20
    bl func_0201dd58
    str r0, [sp, #0x34]
    add r0, sp, #0x2c
    mov r1, r8
    bl func_0201d9c8
.L_2d4:
    cmp r7, #0x20
    blt .L_4f0
    mov ip, r9
    add r7, sp, #0x2c
    ldmia ip!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia ip!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia ip, {r0, r1}
    stmia r7, {r0, r1}
    ldrh r1, [sp, #0x50]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x50]
    ldr r0, [sp, #0x44]
    cmp r6, #0x20
    bic r0, r0, #0x7f
    str r0, [sp, #0x44]
    blt .L_364
    ldrh r2, [r9, #0x24]
    ldr r1, [r9, #0x18]
    ldrh r0, [sp, #0x52]
    mov r2, r2, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, #0x20
    mov r1, r1, lsl #0x19
    sub r1, r2, r1, lsr #0x19
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r2, r0, #0xff
    and r0, r1, #0xff
    orr r0, r2, r0
    strh r0, [sp, #0x52]
.L_364:
    ldr r1, [sp, #0x44]
    mov r0, r9
    mov r1, r1, lsl #0x19
    mov r1, r1, lsr #0x19
    mov r2, #0x20
    bl func_0201dd58
    str r0, [sp, #0x34]
    add r0, sp, #0x2c
    mov r1, r8
    bl func_0201d9c8
    cmp r6, #0x20
    blt .L_4f0
    mov r7, r9
    add r6, sp, #0x2c
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    mov r0, fp, lsl #0x10
    mov r0, r0, lsr #0x10
    and r2, r0, #0xff
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r3, r0, lsl #0x18
    ldmia r7, {r0, r1}
    stmia r6, {r0, r1}
    ldrh r6, [sp, #0x50]
    ldr r1, [sp, #0x44]
    mov r0, r9
    bic r6, r6, #0xff
    orr r2, r6, r2
    strh r2, [sp, #0x50]
    ldrh r6, [sp, #0x50]
    bic r1, r1, #0x7f
    bic r1, r1, #0x3f80
    str r1, [sp, #0x44]
    mov r1, #0x20
    bic r6, r6, #0xff00
    orr r3, r6, r3, lsr #0x10
    mov r2, r1
    strh r3, [sp, #0x50]
    bl func_0201dd58
    str r0, [sp, #0x34]
    add r0, sp, #0x2c
    mov r1, r8
    bl func_0201d9c8
    b .L_4f0
.L_420:
    mov r7, r9
    add r6, sp, #0x4
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7!, {r0, r1, r2, r3}
    stmia r6!, {r0, r1, r2, r3}
    ldmia r7, {r0, r1}
    stmia r6, {r0, r1}
    mov r0, #0x100000
    ldr r1, [sp, #0xc]
    rsb r0, r0, #0x0
    tst r1, r0
    bne .L_4e4
    ldr r1, [sp, #0x1c]
    mov r0, r9
    mov r3, r1, lsl #0x19
    mov r2, r1, lsl #0x12
    mov r1, r3, lsr #0x19
    mov r2, r2, lsr #0x19
    bl func_0201dd58
    ldr r1, [sp, #0x1c]
    str r0, [sp, #0xc]
    mov r0, r1, lsl #0x19
    mov r0, r0, lsr #0x19
    cmp r0, #0x20
    bcc .L_4ac
    add r2, sp, #0x1c
    ldr r1, [r2]
    mov r0, r1, lsl #0x19
    mov r0, r0, lsr #0x19
    sub r0, r0, #0x20
    bic r1, r1, #0x7f
    and r0, r0, #0x7f
    orr r0, r1, r0
    str r0, [r2]
.L_4ac:
    ldr r0, [sp, #0x1c]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x19
    cmp r0, #0x20
    bcc .L_4e4
    add r2, sp, #0x1c
    ldr r1, [r2]
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x19
    sub r0, r0, #0x20
    bic r1, r1, #0x3f80
    mov r0, r0, lsl #0x19
    orr r0, r1, r0, lsr #0x12
    str r0, [r2]
.L_4e4:
    add r0, sp, #0x4
    mov r1, r8
    bl func_0201d9c8
.L_4f0:
    ldr r1, [r9, #0xc]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_68c
    ldrh r0, [r9, #0x16]
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x1f
    bne .L_68c
    ldr r1, [r8, #0x18]
    cmp r1, #0x0
    beq .L_68c
    add r0, r5, r4
    bl func_0209281c
    ldrb r0, [r8, #0x8]
    cmp r0, #0xa
    ldrh r0, [r9, #0x14]
    mov r0, r0, lsl #0x1c
    bcc .L_5bc
    mov r0, r0, lsr #0x1c
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_68c
    b .L_68c
    b .L_68c
    b .L_56c
    b .L_580
    b .L_68c
    b .L_68c
    b .L_68c
    b .L_594
    b .L_5a8
.L_56c:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208fa40
    b .L_68c
.L_580:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f970
    b .L_68c
.L_594:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f9d8
    b .L_68c
.L_5a8:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f908
    b .L_68c
.L_5bc:
    mov r0, r0, lsr #0x1c
    cmp r0, #0x8
    addls pc, pc, r0, lsl #0x2
    b .L_68c
    b .L_5f0
    b .L_604
    b .L_618
    b .L_62c
    b .L_68c
    b .L_640
    b .L_654
    b .L_668
    b .L_67c
.L_5f0:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f8a0
    b .L_68c
.L_604:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f7d0
    b .L_68c
.L_618:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f700
    b .L_68c
.L_62c:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f630
    b .L_68c
.L_640:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f838
    b .L_68c
.L_654:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f768
    b .L_68c
.L_668:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f698
    b .L_68c
.L_67c:
    ldr r1, [r9, #0xc]
    ldr r2, [r8, #0x18]
    add r0, r5, r4
    bl func_0208f5c8
.L_68c:
    mov r0, #0x0
    add sp, sp, #0x54
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
