; func_02037780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern data_0219b344
        .extern func_0203624c
        .extern func_02037414
        .global func_02037780
        .arm
func_02037780:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov sl, r0
    ldrh r0, [r4, #0x12]
    mov r9, r1
    mov r8, r2
    tst r0, #0x8000
    mov r7, r3
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r9, #0x0
    blt .L_3f8
    tst r8, #0x8000
    moveq r6, #0x1
    beq .L_3fc
.L_3f8:
    mov r6, #0x0
.L_3fc:
    cmp r6, #0x0
    ldr r4, [sp, #0x2c]
    beq .L_418
    ldr r0, _LIT0
    ldrsh r0, [r0, #0x4]
    cmp r0, #0x0
    orrge r4, r4, #0x40
.L_418:
    ldr r0, _LIT0
    ldrsh r1, [r0, #0x4]
    cmp r1, #0x0
    blt .L_454
    ldr r0, _LIT1
    ldr r5, [r0, r1, lsl #0x2]
    ldrh r0, [r5, #0x68]
    tst r0, #0x200
    ldrne r0, [r5, #0x5c]
    cmpne r0, #0x0
    beq .L_454
    mvn r1, #0x0
    bl func_0203624c
    mov r0, #0x0
    str r0, [r5, #0x5c]
.L_454:
    ldr r3, [sp, #0x28]
    mov r0, sl
    mov r1, r8
    mov r2, r7
    str r4, [sp]
    bl func_02037414
    movs r4, r0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r6, #0x0
    beq .L_4e4
    ldr r0, _LIT0
    ldrh r0, [r0, #0xc]
    tst r0, #0x80
    bne .L_4e4
    ldr r3, [sp, #0x28]
    mov r5, #0xa0
    ldr r1, _LIT2
    mov r2, r7
    rsb r0, r9, #0x0
    str r5, [sp]
    bl func_02037414
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r4, #0x68]
    add sp, sp, #0x4
    orr r1, r1, #0x100
    strh r1, [r4, #0x68]
    str r0, [r4, #0x5c]
    ldrh r1, [r0, #0x68]
    orr r1, r1, #0x200
    strh r1, [r0, #0x68]
    str r4, [r0, #0x5c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_4e4:
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219b2e0
_LIT1: .word data_0219b344
_LIT2: .word 0x00002601
