; func_0204ab88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba4
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204afc0
        .extern func_0204b05c
        .extern func_0204bd18
        .extern func_0204bed0
        .extern func_0204c398
        .extern func_0204cdc8
        .extern func_0204cf08
        .extern func_0204d3c4
        .extern func_0204ea5c
        .extern func_02092fc8
        .extern func_020b3714
        .global func_0204ab88
        .arm
func_0204ab88:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrb r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x13
    bne .L_268
    mov r0, #0x0
    bl func_0204b05c
    ldr r1, _LIT0
    ldr r5, [r1]
    ldr r1, [r5, #0x8]
    cmp r1, r0
    bne .L_13c
    ldr r1, [r5, #0xc]
    cmp r1, r0
    bne .L_c8
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    strb r0, [r4, #0x16]
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldrb r1, [r0, #0xd]
    mov r0, #0x0
    sub r1, r1, #0x1
    strb r1, [r4, #0x19c]
    bl func_0204c398
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c8:
    bl func_02092fc8
    str r0, [r5, #0x18]
    str r1, [r5, #0x1c]
    mov r0, #0x0
    str r0, [r5, #0x8]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_11c
    mov r0, #0x3
    bl func_02049868
    bl func_0204987c
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0xec]
    add sp, sp, #0x8
    str r1, [r4, #0xf0]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_11c:
    mov r0, #0x4
    bl func_02049868
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf08
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_13c:
    ldrb r4, [r5, #0x2]
    bl func_02092fc8
    ldr r3, [r5, #0x18]
    ldr r2, [r5, #0x1c]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, _LIT2
    mul r2, r4, r2
    cmp r1, r2, asr #0x1f
    cmpeq r0, r2
    addcc sp, sp, #0x8
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    cmp r4, #0x5
    bls .L_1a8
    mov r0, #0x1
    bl func_0204afc0
    bl func_0204bd18
    mov r0, #0x1
    bl func_0204bed0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1a8:
    mov r7, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_24c
    ldr r8, _LIT0
    mov r5, #0x0
    mov r4, #0x11
    mov r6, r7
.L_1cc:
    bl func_0204987c
    add r0, r0, r7
    ldrb r0, [r0, #0x2c8]
    ldr r1, [r8]
    mov r0, r6, lsl r0
    ldr r1, [r1, #0x8]
    ands r0, r1, r0
    bne .L_238
    bl func_0204987c
    mov sl, r0
    bl func_0204987c
    mov r9, r0
    bl func_0204987c
    str r5, [sp]
    str r5, [sp, #0x4]
    add r0, r0, r7, lsl #0x1
    add r1, sl, r7, lsl #0x2
    add r2, r9, r7, lsl #0x2
    ldrh r3, [r0, #0xa4]
    ldr r1, [r1, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, r4
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_238:
    add r7, r7, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r7, r0
    ble .L_1cc
.L_24c:
    ldr r0, _LIT0
    add sp, sp, #0x8
    ldr r1, [r0]
    ldrb r0, [r1, #0x2]
    add r0, r0, #0x1
    strb r0, [r1, #0x2]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_268:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x4
    beq .L_28c
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x3
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_28c:
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_0204987c
    ldrb r1, [r4, #0x1]
    ldrb r2, [r0, #0xd]
    sub r0, r1, #0x1
    cmp r2, r0
    addlt sp, sp, #0x8
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrb r0, [r4, #0x2]
    cmp r0, #0x0
    bne .L_300
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_02092fc8
    ldr r3, [r4, #0x10]
    ldr r2, [r4, #0x14]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, [r4, #0x4]
    cmp r1, #0x0
    cmpeq r0, r2
    bcs .L_358
.L_300:
    ldrb r0, [r4, #0x2]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_02092fc8
    ldr r3, [r4, #0x18]
    ldr r2, [r4, #0x1c]
    subs r3, r0, r3
    sbc r0, r1, r2
    mov r1, r0, lsl #0x6
    ldr r2, _LIT1
    orr r1, r1, r3, lsr #0x1a
    mov r0, r3, lsl #0x6
    mov r3, #0x0
    bl func_020b3714
    ldr r2, [r4, #0x4]
    cmp r1, #0x0
    cmpeq r0, r2, lsr #0x2
    addcc sp, sp, #0x8
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_358:
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    cmp r0, #0x0
    beq .L_384
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    bl func_0204cdc8
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_384:
    mov r0, #0x13
    bl func_02049868
    mov r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_408
    mov r6, #0x0
    mov r5, #0x11
.L_3a8:
    bl func_0204987c
    mov r8, r0
    bl func_0204987c
    mov r7, r0
    bl func_0204987c
    str r6, [sp]
    str r6, [sp, #0x4]
    add r0, r0, r4, lsl #0x1
    add r1, r8, r4, lsl #0x2
    add r2, r7, r4, lsl #0x2
    ldrh r3, [r0, #0xa4]
    ldr r1, [r1, #0xf4]
    ldr r2, [r2, #0x24]
    mov r0, r5
    bl func_0204ea5c
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x8
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r4, r4, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r4, r0
    ble .L_3a8
.L_408:
    ldr r0, _LIT0
    ldr r4, [r0]
    bl func_02092fc8
    str r0, [r4, #0x18]
    str r1, [r4, #0x1c]
    mov r0, #0x1
    strb r0, [r4, #0x2]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219dba4
_LIT1: .word 0x000082ea
_LIT2: .word 0x00001770
