; func_02065a58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021014b8
        .extern data_0219e354
        .extern data_0219e880
        .extern data_0219e884
        .extern func_020552bc
        .extern func_02065ca4
        .extern func_02065cd8
        .extern func_02065d4c
        .extern func_020aace8
        .extern func_020aad04
        .global func_02065a58
        .arm
func_02065a58:
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
    bl func_02065cd8
    mov r7, r0
    bl func_02065cd8
    mov r8, r0
    bl func_02065cd8
    mov r4, r0
    bl func_02065cd8
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
    bl func_020aad04
    ldr r0, _LIT1
    bl func_020aace8
    ldrb r1, [r5, #0xe]
    add r4, r0, #0x16
    cmp r1, #0x0
    beq .L_168
    ldr r0, [r6, #0x14]
    cmp r0, #0x0
    bne .L_168
    mov r0, #0x0
    strb r0, [r5, #0xc]
    str r4, [sp]
    ldr r1, _LIT2
    ldr r0, [r6, #0x4]
    ldr r1, [r1]
    ldr r2, _LIT3
    mov r3, r5
    bl func_02065d4c
.L_168:
    ldr r0, [r6, #0x18]
    cmp r0, #0x0
    bne .L_198
    mov r0, #0x1
    strb r0, [r5, #0xc]
    str r4, [sp]
    ldr r1, _LIT2
    ldr r0, [r6]
    ldr r1, [r1]
    ldr r2, _LIT3
    mov r3, r5
    bl func_02065d4c
.L_198:
    ldrb r0, [r5, #0xe]
    cmp r0, #0x0
    ldrne r8, [r6, #0x4]
    ldreq r8, [r6]
    cmp r0, #0x0
    ldrne r0, [r6, #0x4]
    ldreq r0, [r6]
    bl func_02065ca4
    mov r7, r0
    mov r0, r8
    bl func_02065ca4
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
    bne .L_21c
    mov r0, #0x2
    strb r0, [r5, #0xc]
    str r4, [sp]
    ldr r1, _LIT4
    ldr r0, [r6]
    ldr r1, [r1]
    ldr r2, _LIT3
    mov r3, r5
    bl func_02065d4c
.L_21c:
    bl func_020552bc
    add r0, r0, #0x1f4
    str r0, [r6, #0x28]
    mov r0, #0x1e
    str r0, [r6, #0x24]
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021014b8
_LIT1: .word data_0219e354
_LIT2: .word data_0219e884
_LIT3: .word 0x00006cfd
_LIT4: .word data_0219e880
