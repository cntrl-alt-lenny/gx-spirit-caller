; func_0204d674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc8c
        .extern func_020498f0
        .extern func_0204b280
        .extern func_0204ce3c
        .extern func_0204d438
        .extern func_020556c8
        .extern func_020673dc
        .global func_0204d674
        .arm
func_0204d674:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r8, r3
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    beq .L_274
    cmp r0, #0x1
    beq .L_244
    cmp r0, #0x2
    beq .L_454
    b .L_508
.L_244:
    bl func_020498f0
    ldr r0, [r0]
    mov r1, r7
    bl func_020556c8
    cmp r0, #0x0
    moveq r4, #0xff
    beq .L_508
    mov r0, r7
    bl func_0204b280
    cmp r0, #0x0
    moveq r4, #0x3
    beq .L_508
.L_274:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r8, r0
    bne .L_2dc
    bl func_020498f0
    ldrb r0, [r0, #0x1a9]
    cmp r0, #0x0
    bne .L_2dc
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r1, [r4, #0x14]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    beq .L_2dc
    bl func_020498f0
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_340
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x200]
    cmp r1, r0
    bne .L_340
.L_2dc:
    mov r4, #0x3
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_508
    bl func_020498f0
    ldr r0, [r0, #0x10]
    ldr r0, [r0, #0xb4]
    cmp r0, #0x0
    bne .L_508
    bl func_020498f0
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_508
    bl func_020498f0
    mov r5, r0
    bl func_020498f0
    ldr r1, [r5, #0x20]
    ldr r0, [r0, #0x200]
    cmp r1, r0
    bne .L_508
    bl func_020498f0
    ldr r0, [r0, #0x10]
    bl func_020673dc
    b .L_508
.L_340:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x3
    beq .L_360
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x4
    bne .L_390
.L_360:
    bl func_020498f0
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_380
    bl func_020498f0
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    beq .L_390
.L_380:
    cmp r6, #0x0
    bne .L_398
    cmp r5, #0x0
    bne .L_398
.L_390:
    mov r4, #0x4
    b .L_508
.L_398:
    bl func_020498f0
    ldr r0, [r0, #0x204]
    cmp r0, #0x0
    beq .L_44c
    bl func_020498f0
    ldr r0, [r0, #0x204]
    cmp r7, r0
    bne .L_3f4
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bne .L_3e4
    bl func_020498f0
    ldr r0, [r0, #0x200]
    cmp r0, r7
    bge .L_3ec
    bl func_020498f0
    ldr r0, [r0, #0x208]
    cmp r7, r0
    beq .L_3ec
.L_3e4:
    mov r4, #0x2
    b .L_508
.L_3ec:
    mov r4, #0xff
    b .L_508
.L_3f4:
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    bne .L_420
    bl func_020498f0
    ldr r0, [r0, #0x200]
    cmp r0, r7
    bge .L_444
    bl func_020498f0
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    bne .L_444
.L_420:
    bl func_020498f0
    ldr r0, [r0, #0x204]
    bl func_0204ce3c
    bl func_0204d438
    cmp r0, #0x0
    movne r0, #0xff
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r4, #0x2
    b .L_508
.L_444:
    mov r4, #0x3
    b .L_508
.L_44c:
    mov r4, #0x2
    b .L_508
.L_454:
    bl func_020498f0
    ldr r0, [r0]
    mov r1, r7
    bl func_020556c8
    cmp r0, #0x0
    moveq r4, #0xff
    beq .L_508
    cmp r8, #0x3
    bne .L_494
    bl func_020498f0
    mov r4, r0
    bl func_020498f0
    ldrb r1, [r4, #0x14]
    ldrb r0, [r0, #0x16]
    cmp r1, r0
    bne .L_49c
.L_494:
    mov r4, #0x3
    b .L_508
.L_49c:
    ldr r0, _LIT0
    ldrb r1, [r0]
    cmp r1, #0x1
    bne .L_4bc
    ldrb r0, [r0, #0x1]
    cmp r0, #0x1
    moveq r4, #0x13
    beq .L_508
.L_4bc:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xa
    bne .L_4fc
    bl func_020498f0
    ldr r0, [r0, #0x1c]
    cmp r0, #0x0
    bne .L_4ec
    bl func_020498f0
    ldrh r0, [r0, #0x1a]
    cmp r0, #0x0
    beq .L_4fc
.L_4ec:
    cmp r6, #0x0
    bne .L_504
    cmp r5, #0x0
    bne .L_504
.L_4fc:
    mov r4, #0x4
    b .L_508
.L_504:
    mov r4, #0x2
.L_508:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219dc8c
