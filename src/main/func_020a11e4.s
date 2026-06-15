; func_020a11e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9840
        .extern data_021a98fc
        .extern func_02094688
        .extern func_020a09b8
        .extern func_020a1bf8
        .extern func_020a5b44
        .global func_020a11e4
        .arm
func_020a11e4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x38
    movs r7, r1
    addeq sp, sp, #0x38
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    cmp r7, #0xf
    addhi sp, sp, #0x38
    ldmhiia sp!, {r4, r5, r6, r7, r8, lr}
    bxhi lr
    add r1, sp, #0x0
    mov r2, r7
    add r0, r0, #0xa
    bl func_020a5b44
    ldr r3, _LIT0
    ldrb r8, [sp]
    ldr r2, [r3]
    sub r4, r7, #0x1
    add r1, r2, r4, lsl #0x2
    add r1, r1, #0x1000
    ldr r6, [r1, #0x4e8]
    mov r5, r0
    cmp r8, #0xb
    addls pc, pc, r8, lsl #0x2
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_d14
    b .L_8b0
    b .L_b3c
    b .L_bf8
    b .L_c74
    b .L_d14
.L_8b0:
    cmp r6, #0x2
    bne .L_954
    cmp r5, #0x0
    addeq sp, sp, #0x38
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    add r1, sp, #0x14
    mov r2, #0x1d
    bl func_02094688
    ldr r3, _LIT0
    mov r0, r4
    ldr r1, [r3]
    ldr r2, [sp, #0x14]
    add r1, r1, r0, lsl #0x2
    add r1, r1, #0x1000
    str r2, [r1, #0x4a8]
    ldr r1, [r3]
    mov r2, #0x16
    add r1, r1, r0, lsl #0x1
    mul r8, r0, r2
    ldrh ip, [sp, #0x2e]
    add r1, r1, #0x1400
    add r0, sp, #0x18
    strh ip, [r1, #0x8a]
    ldr r1, [r3]
    add r1, r1, #0x1340
    add r1, r1, r8
    bl func_02094688
    ldr r0, _LIT0
    and r1, r7, #0xff
    ldr r0, [r0]
    and r2, r1, #0xf
    add ip, r0, #0x1340
    ldrb r3, [ip, r8]
    mov r0, r7
    mov r1, #0xa
    bic r3, r3, #0xf0
    orr r2, r3, r2, lsl #0x4
    strb r2, [ip, r8]
    add r2, sp, #0x18
    bl func_020a1bf8
.L_954:
    cmp r6, #0xa
    addne sp, sp, #0x38
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    ldrb r8, [r5, #0x1c]
    mov r2, #0x0
    cmp r8, #0x10
    bcs .L_9b0
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    mla r6, r8, r1, r0
    add r1, r6, #0x1000
    ldrb r3, [r1, #0xd52]
    cmp r3, #0x0
    beq .L_9b0
    add r3, r0, r4, lsl #0x2
    ldr r1, [r1, #0xd40]
    add r3, r3, #0x1000
    ldr r5, [r3, #0x4a8]
    ldr r3, [r1, #0x14]
    cmp r5, r3
    beq .L_9cc
.L_9b0:
    ldr r0, _LIT0
    mov r1, #0x4
    ldr r0, [r0]
    add r0, r0, r4, lsl #0x1
    add r0, r0, #0x1700
    strh r1, [r0, #0x54]
    b .L_a30
.L_9cc:
    add r3, r6, #0x1d00
    ldrh r6, [r3, #0x4e]
    mov ip, r2
    mov r5, #0x1
.L_9dc:
    mov r3, r5, lsl ip
    ands r3, r3, r6
    add r3, ip, #0x1
    addne r2, r2, #0x1
    and ip, r3, #0xff
    andne r2, r2, #0xff
    cmp ip, #0x10
    bcc .L_9dc
    ldrb r1, [r1, #0x18]
    cmp r2, r1
    bcc .L_a30
    add r1, r0, r4, lsl #0x1
    add r3, r1, #0x1700
    mov r2, #0x0
    mov r0, r7
    mov r1, #0xb
    strh r2, [r3, #0x54]
    bl func_020a1bf8
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_a30:
    ldr r3, _LIT0
    ldr r2, [r3]
    add r0, r2, r4, lsl #0x1
    add r4, r0, #0x1700
    ldrh r0, [r4, #0x54]
    cmp r0, #0x3
    beq .L_a60
    cmp r0, #0x4
    beq .L_b1c
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_a60:
    add r0, r2, #0x1500
    mov r1, #0x1
    ldrh r0, [r0, #0x36]
    mov r6, r1, lsl r7
    ands r0, r0, r6
    addne sp, sp, #0x38
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    add r0, r2, #0x1000
    ldrb r2, [r0, #0x535]
    ldr r1, _LIT1
    sub r5, r7, #0x1
    add r2, r2, #0x1
    strb r2, [r0, #0x535]
    ldr r0, [r3]
    mul r4, r8, r1
    add r1, r0, #0x1500
    ldrh ip, [r1, #0x36]
    mov r0, r7
    mov r2, #0x0
    orr r7, ip, r6
    strh r7, [r1, #0x36]
    ldr r7, [r3]
    mov r1, #0x5
    add r7, r7, r5
    add r7, r7, #0x1000
    strb r8, [r7, #0x526]
    ldr r7, [r3]
    add r7, r7, r4
    add r7, r7, #0x1d00
    ldrh r8, [r7, #0x4e]
    orr r8, r8, r6
    strh r8, [r7, #0x4e]
    ldr r7, [r3]
    add r4, r7, r4
    add r4, r4, #0x1d00
    ldrh r7, [r4, #0x50]
    orr r6, r7, r6
    strh r6, [r4, #0x50]
    ldr r3, [r3]
    add r3, r3, r5, lsl #0x1
    add r3, r3, #0x1700
    strh r2, [r3, #0x54]
    bl func_020a1bf8
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_b1c:
    mov r2, #0x0
    mov r0, r7
    mov r1, #0x4
    strh r2, [r4, #0x54]
    bl func_020a1bf8
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_b3c:
    cmp r6, #0x5
    bne .L_b60
    mov r0, r7
    mov r1, #0xe
    mov r2, #0x0
    bl func_020a1bf8
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_b60:
    cmp r6, #0xe
    addne sp, sp, #0x38
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    add r0, r2, r4, lsl #0x1
    add r0, r0, #0x1700
    ldrh r0, [r0, #0x54]
    mov r5, r4, lsl #0x1
    cmp r0, #0x2
    addne sp, sp, #0x38
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    add r0, r2, r4
    add r0, r0, #0x1000
    ldrb r1, [r0, #0x526]
    ldr r0, _LIT1
    mov r6, #0x1
    mul r4, r1, r0
    add r0, r2, r4
    add r1, r0, #0x1d00
    ldrh r8, [r1, #0x4c]
    mov r2, #0x0
    mov r0, r7
    orr r6, r8, r6, lsl r7
    strh r6, [r1, #0x4c]
    ldr r6, [r3]
    mov r1, #0x6
    add r4, r6, r4
    add r4, r4, #0x1d00
    strh r2, [r4, #0x48]
    ldr r3, [r3]
    add r3, r3, r5
    add r3, r3, #0x1700
    strh r2, [r3, #0x54]
    bl func_020a1bf8
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_bf8:
    cmp r6, #0x6
    addne sp, sp, #0x38
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    add r0, r2, r4
    add r0, r0, #0x1000
    ldrb r5, [r0, #0x526]
    cmp r5, #0xff
    addeq sp, sp, #0x38
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, _LIT1
    ldrh r1, [sp, #0x2]
    mul r4, r5, r0
    add r0, r2, r4
    add r0, r0, #0x1d00
    ldrh r0, [r0, #0x4a]
    bl func_020a09b8
    ldr r1, _LIT0
    ldr r2, _LIT2
    ldr r1, [r1]
    mov r3, #0x1
    add r1, r1, r4
    add r1, r1, #0x1d00
    strh r0, [r1, #0x4a]
    ldr r0, [r2]
    add sp, sp, #0x38
    orr r0, r0, r3, lsl r5
    str r0, [r2]
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_c74:
    cmp r6, #0x6
    bne .L_cd4
    add r0, r2, r4
    add r0, r0, #0x1000
    ldrb r3, [r0, #0x526]
    cmp r3, #0xff
    addeq sp, sp, #0x38
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, _LIT1
    mov r1, #0x1
    mla r0, r3, r0, r2
    add r3, r0, #0x1d00
    ldrh r2, [r3, #0x4c]
    mvn r0, r1, lsl r7
    and r4, r2, r0
    mov r0, r7
    mov r1, #0x7
    mov r2, #0x0
    strh r4, [r3, #0x4c]
    bl func_020a1bf8
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_cd4:
    cmp r6, #0x7
    addne sp, sp, #0x38
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    add r0, r2, r4, lsl #0x1
    add r3, r0, #0x1700
    ldrh r0, [r3, #0x54]
    cmp r0, #0x5
    addne sp, sp, #0x38
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    mov r2, #0x0
    mov r0, r7
    mov r1, #0x8
    strh r2, [r3, #0x54]
    bl func_020a1bf8
.L_d14:
    add sp, sp, #0x38
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a98fc
_LIT1: .word 0x000005d4
_LIT2: .word data_021a9840
