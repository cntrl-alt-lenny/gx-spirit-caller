; func_02065acc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101598
        .extern data_0219e434
        .extern data_0219e960
        .extern data_0219e964
        .extern func_02055330
        .extern func_02065d18
        .extern func_02065d4c
        .extern func_02065dc0
        .extern func_020aaddc
        .extern func_020aadf8
        .global func_02065acc
        .arm
func_02065acc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x60
    ldr r7, _LIT0
    mov r6, r0
    ldrb r4, [r7]
    ldrb r3, [r7, #0x1]
    add r5, sp, #0x4
    mov r2, #0x2
    strb r4, [r5]
    strb r3, [r5, #0x1]
    ldrb r4, [r7, #0x2]
    ldrb r3, [r7, #0x3]
    mov r1, #0x0
    mvn r0, #0x0
    strb r4, [r5, #0x2]
    strb r3, [r5, #0x3]
    ldrb r4, [r7, #0x4]
    ldrb r3, [r7, #0x5]
    strb r4, [r5, #0x4]
    strb r3, [r5, #0x5]
    strb r2, [r5, #0x6]
    strb r1, [r5, #0x7]
    ldr r2, [r6, #0xc]
    strb r2, [r5, #0xd]
    ldr r7, [r6, #0x8]
    mov r3, r7, lsr #0x18
    mov r2, r7, lsr #0x8
    mov r4, r7, lsl #0x8
    and r3, r3, #0xff
    and r2, r2, #0xff00
    mov r7, r7, lsl #0x18
    orr r2, r3, r2
    and r4, r4, #0xff0000
    and r3, r7, #-16777216
    orr r2, r4, r2
    orr r2, r3, r2
    str r2, [r5, #0x8]
    ldr r2, [r6, #0x4]
    cmp r2, r0
    movne r1, #0x1
    strb r1, [r5, #0xe]
    bl func_02065d4c
    mov r7, r0
    bl func_02065d4c
    mov r8, r0
    bl func_02065d4c
    mov r4, r0
    bl func_02065d4c
    mov r2, #0x0
    mov r1, r7, lsl #0x18
    and r7, r1, #-16777216
    mov r1, r8, lsl #0x8
    mov r0, r0, lsr #0x8
    and r3, r1, #0xff0000
    mov r1, r4, lsr #0x18
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    orr r0, r3, r0
    orr r3, r7, r0
    mov r1, r3, lsr #0x18
    strb r1, [sp, #0x13]
    mov r1, r3, lsr #0x8
    mov r0, r3, lsr #0x10
    strb r1, [sp, #0x15]
    strb r0, [sp, #0x14]
    ldr r1, _LIT1
    add r0, sp, #0x19
    strb r3, [sp, #0x16]
    strb r2, [sp, #0x17]
    strb r2, [sp, #0x18]
    bl func_020aadf8
    ldr r0, _LIT1
    bl func_020aaddc
    ldrb r1, [r5, #0xe]
    add r4, r0, #0x16
    cmp r1, #0x0
    beq .L_e84
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    bne .L_e84
    mov r0, #0x0
    strb r0, [r5, #0xc]
    str r4, [sp]
    ldr r1, _LIT2
    ldr r0, [r6, #0x4]
    ldr r1, [r1]
    ldr r2, _LIT3
    mov r3, r5
    bl func_02065dc0
.L_e84:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_eb4
    mov r0, #0x1
    strb r0, [r5, #0xc]
    str r4, [sp]
    ldr r1, _LIT2
    ldr r0, [r6]
    ldr r1, [r1]
    ldr r2, _LIT3
    mov r3, r5
    bl func_02065dc0
.L_eb4:
    ldrb r0, [r5, #0xe]
    cmp r0, #0x0
    ldrne r8, [r6, #0x4]
    ldreq r8, [r6]
    cmp r0, #0x0
    ldrne r0, [r6, #0x4]
    ldreq r0, [r6]
    bl func_02065d18
    mov r7, r0
    mov r0, r8
    bl func_02065d18
    mov r1, r7, asr #0x8
    mov r0, r0, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, r1, asr #0x8
    strb r1, [sp, #0x18]
    strb r0, [sp, #0x17]
    ldr r0, [r6, #0x1c]
    cmp r0, #0x0
    bne .L_f38
    mov r0, #0x2
    strb r0, [r5, #0xc]
    str r4, [sp]
    ldr r1, _LIT4
    ldr r0, [r6]
    ldr r1, [r1]
    ldr r2, _LIT3
    mov r3, r5
    bl func_02065dc0
.L_f38:
    bl func_02055330
    add r0, r0, #0x1f4
    str r0, [r6, #0x28]
    mov r0, #0x1e
    str r0, [r6, #0x24]
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02101598
_LIT1: .word data_0219e434
_LIT2: .word data_0219e964
_LIT3: .word 0x00006cfd
_LIT4: .word data_0219e960
