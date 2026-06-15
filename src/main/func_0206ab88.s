; func_0206ab88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101db0
        .extern data_02101dd8
        .extern data_02101df8
        .extern func_020453e8
        .extern func_02054cf8
        .extern func_0206aa68
        .extern func_0206aea0
        .extern func_0206afb8
        .extern func_0206afec
        .extern func_0206b048
        .extern func_0206b06c
        .extern func_0206b0c4
        .extern func_020a6d54
        .extern func_020aaddc
        .global func_0206ab88
        .arm
func_0206ab88:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x30c
    mov r5, r0
    ldr r0, [r5]
    mov r7, r1
    mov r6, r2
    mov r4, r3
    cmp r0, #0x1
    beq .L_23c
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_23c:
    cmp r7, #0x0
    ldreq r7, _LIT3
    cmp r6, #0x0
    ldreq r6, _LIT3
    mov r0, r7
    bl func_020aaddc
    cmp r0, #0x100
    addhi sp, sp, #0x30c
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, r7, pc}
    mov r0, r6
    bl func_020aaddc
    cmp r0, #0x100
    addhi sp, sp, #0x30c
    movhi r0, #0x6
    ldmhiia sp!, {r4, r5, r6, r7, pc}
    mov r0, r5
    bl func_0206b0c4
    cmp r0, #0x0
    addne sp, sp, #0x30c
    ldmneia sp!, {r4, r5, r6, r7, pc}
    mov r0, r5
    str r4, [r5, #0x5c4]
    bl func_0206aea0
    add r3, sp, #0xe
    mov ip, #0x2
    add r0, sp, #0x8
    add r2, sp, #0x4
    mov r1, #0x0
    str ip, [sp, #0x4]
    str r3, [sp, #0x8]
    bl func_0206b048
    add r0, sp, #0x8
    add r2, sp, #0x4
    mov r1, #0x1
    bl func_0206b048
    add r0, sp, #0x8
    mov r1, #0x3
    add r2, sp, #0x4
    bl func_0206b048
    ldr r1, [r5, #0x4b8]
    add r0, sp, #0x8
    add r2, sp, #0x4
    bl func_0206afec
    add r0, sp, #0x8
    add r1, r5, #0xc
    add r2, sp, #0x4
    bl func_0206b06c
    add r0, sp, #0x8
    add r1, r5, #0x30
    add r2, sp, #0x4
    bl func_0206b06c
    add r0, sp, #0x8
    add r1, r5, #0x74
    mov r2, #0x8
    add r3, sp, #0x4
    bl func_0206afb8
    mov r1, r6
    add r0, sp, #0x8
    add r2, sp, #0x4
    bl func_0206b06c
    mov r1, r7
    add r0, sp, #0x8
    add r2, sp, #0x4
    bl func_0206b06c
    mov r1, r4, lsl #0x18
    and ip, r1, #-16777216
    mov r1, r4, lsl #0x8
    and r3, r1, #0xff0000
    mov r1, r4, lsr #0x18
    and r2, r1, #0xff
    mov r1, r4, lsr #0x8
    and r1, r1, #0xff00
    orr r1, r2, r1
    orr r1, r3, r1
    add r0, sp, #0x8
    orr r1, ip, r1
    add r2, sp, #0x4
    bl func_0206afec
    ldr r0, [r5, #0x5c4]
    ands r0, r0, #0x8
    beq .L_394
    ldr r1, [r5, #0x4a4]
    add r0, sp, #0x8
    add r2, sp, #0x4
    bl func_0206afec
.L_394:
    ldr r0, [r5, #0x5c4]
    ands r0, r0, #0x80
    beq .L_3b0
    ldr r1, [sp, #0x320]
    add r0, sp, #0x8
    add r2, sp, #0x4
    bl func_0206afec
.L_3b0:
    ldr r0, [sp, #0x4]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r2, r2, #0xff
    and r0, r0, #0xff00
    orr r0, r2, r0
    strh r0, [sp]
    ldrb r2, [r1]
    ldrb r0, [r1, #0x1]
    add r1, sp, #0xc
    mov r3, #0x0
    strb r2, [r1]
    strb r0, [r1, #0x1]
    ldr r0, [r5, #0x4b0]
    ldr r2, [sp, #0x4]
    bl func_02054cf8
    cmp r0, #0x0
    bgt .L_418
    mov r0, r5
    bl func_0206aa68
    add sp, sp, #0x30c
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_418:
    mov r0, #0x3
    str r0, [r5]
    mov r0, #0x0
    str r0, [r5, #0x5c8]
    ldr r0, [r5, #0x7c]
    cmp r0, #0x0
    bne .L_45c
    mov r0, #0x1000
    bl func_020453e8
    str r0, [r5, #0x7c]
    ldr r0, [r5, #0x7c]
    cmp r0, #0x0
    addeq sp, sp, #0x30c
    moveq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, pc}
    mov r0, #0x0
    str r0, [r5, #0x80]
.L_45c:
    mov r0, #0x0
    add sp, sp, #0x30c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_02101dd8
_LIT1: .word data_02101db0
_LIT2: .word 0x0000020a
_LIT3: .word data_02101df8
