; func_0202d9a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6c8c
        .extern data_020c6c90
        .extern data_0219ac68
        .extern data_0219ac98
        .extern func_02001cec
        .extern func_02001e3c
        .extern func_02001e74
        .extern func_0200506c
        .extern func_0201d460
        .extern func_0201d4dc
        .extern func_0202b240
        .extern func_0202b778
        .extern func_0202b798
        .extern func_0202b7b8
        .extern func_0202b824
        .extern func_0202b884
        .extern func_0202c6dc
        .extern func_0202c71c
        .extern func_0202d184
        .extern func_0202e1e0
        .extern func_02034734
        .extern func_020347c0
        .extern func_020a9698
        .global func_0202d9a4
        .arm
func_0202d9a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x48
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x48
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_02034734
    cmp r0, #0x0
    beq .L_68
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d460
    mov r4, r0
    bl func_020347c0
    mov r0, r0, lsl #0x2
    add r0, r0, #0x1
    orr r1, r0, #0x5000
    strh r1, [r4, #0x3c]
    add r0, r1, #0x1
    strh r0, [r4, #0x3e]
    add r0, r1, #0x2
    strh r0, [r4, #0x7c]
    add r0, r1, #0x3
    strh r0, [r4, #0x7e]
.L_68:
    ldr r0, _LIT0
    ldr r1, [r0, #0x24]
    ldr r0, [r0, #0x68]
    cmp r1, #0x0
    bne .L_128
    bl func_0202c6dc
    cmp r0, #0x0
    beq .L_d4
    ldr r1, _LIT1
    ldr r0, _LIT0
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c71c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c71c
    ldr r1, _LIT1
    mvn r2, r0
    ldr r0, [r1]
    and r2, r2, r5, lsr #0x8
    orr r2, r4, r2
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
    b .L_11c
.L_d4:
    ldr r0, _LIT0
    mov r1, #0x4000000
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c71c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c71c
    mov r1, #0x4000000
    mvn r2, r0
    ldr r0, [r1]
    and r2, r2, r5, lsr #0x8
    orr r2, r4, r2
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
.L_11c:
    add sp, sp, #0x48
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_128:
    bl func_0202c6dc
    cmp r0, #0x0
    beq .L_17c
    ldr r1, _LIT1
    ldr r0, _LIT0
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c71c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c71c
    ldr r1, _LIT1
    orr r2, r4, r0
    ldr r0, [r1]
    orr r2, r2, r5, lsr #0x8
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
    b .L_1c0
.L_17c:
    ldr r0, _LIT0
    mov r1, #0x4000000
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c71c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c71c
    mov r2, #0x4000000
    ldr r1, [r2]
    orr r0, r4, r0
    orr r3, r0, r5, lsr #0x8
    bic r0, r1, #0x1f00
    orr r0, r0, r3, lsl #0x8
    str r0, [r2]
.L_1c0:
    ldr r1, _LIT0
    ldr r0, [r1, #0xc]
    ldr r2, [r1, #0x8]
    cmp r2, r0
    ble .L_268
    ldr r1, [r1, #0x10]
    mov r6, #0x0
    cmp r1, r2
    movle r2, r1
    sub r1, r2, r0
    adds r2, r1, #0x7
    movmi r2, #0x0
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    ldr r4, _LIT0
    mov r9, r6
    add r8, r1, #0x11
    mov r5, r6
.L_20c:
    mov r1, r0, asr #0x2
    add r1, r0, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    mov r7, r5
    cmp r1, #0x0
    ble .L_254
.L_224:
    ldr r0, [r4, #0x68]
    bl func_0201d460
    add r2, r7, r8
    mov r1, r7, lsl #0x1
    add r0, r0, r9, lsl #0x1
    strh r2, [r1, r0]
    ldr r0, [r4, #0xc]
    add r7, r7, #0x1
    mov r1, r0, asr #0x2
    add r1, r0, r1, lsr #0x1d
    cmp r7, r1, asr #0x3
    blt .L_224
.L_254:
    add r6, r6, #0x1
    cmp r6, #0x3
    add r8, r8, #0x40
    add r9, r9, #0x20
    blt .L_20c
.L_268:
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d4dc
    ldr r1, _LIT0
    add r4, r0, #0x4e0
    ldr r0, [r1, #0x14]
    cmp r0, #0x1
    beq .L_29c
    cmp r0, #0x2
    beq .L_2a8
    cmp r0, #0x3
    beq .L_408
    b .L_46c
.L_29c:
    add r0, r0, #0x1
    str r0, [r1, #0x14]
    b .L_46c
.L_2a8:
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    ldrne r5, [r1, #0x58]
    mov r1, #0x13
    ldrnesb r0, [r5]
    cmpne r0, #0x0
    beq .L_2f0
    ldr r0, _LIT2
    mov r2, r1
    bl func_02001cec
    ldr r0, _LIT0
    mov r1, #0x4
    str r1, [r0, #0x3c]
    ldr r1, [r0, #0x50]
    orr r1, r1, #0x800000
    str r1, [r0, #0x50]
    str r5, [r0, #0x58]
    b .L_3d0
.L_2f0:
    ldr r0, _LIT2
    mov r2, r1
    bl func_02001cec
    ldr r0, _LIT0
    mov r1, #0x4
    str r1, [r0, #0x3c]
    ldr r0, [r0, #0x4]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_3b0
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b824
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x4]
    bl func_0202b884
    cmp r5, #0x0
    mov r7, r0
    ldreq r8, _LIT3
    beq .L_350
    mov r0, r5
    bl func_0202b798
    mov r8, r0
.L_350:
    ldr r0, _LIT4
    bl func_0202b778
    mov r6, r0
    mov r0, r7
    bl func_0202b7b8
    mov r5, r0
    ldr r0, _LIT5
    bl func_0202b778
    str r5, [sp]
    str r0, [sp, #0x4]
    ldr r1, _LIT6
    mov r2, r6
    mov r3, r8
    add r0, sp, #0x8
    bl func_020a9698
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x2000
    add r1, sp, #0x8
    mov r3, #0x2
    bl func_0200506c
.L_3b0:
    ldr r0, _LIT0
    ldr r1, [r0, #0x50]
    orr r1, r1, #0x800000
    str r1, [r0, #0x50]
    ldr r0, [r0, #0x4]
    bl func_0202b240
    ldr r1, _LIT0
    str r0, [r1, #0x58]
.L_3d0:
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d460
    mov r1, r0
    ldr r0, _LIT2
    ldr r2, _LIT7
    add r1, r1, #0xd8
    mov r3, #0x1
    bl func_02001e74
    ldr r0, _LIT0
    ldr r1, [r0, #0x14]
    add r1, r1, #0x1
    str r1, [r0, #0x14]
    b .L_46c
.L_408:
    ldr r2, [r1, #0x3c]
    mov r0, #0xc
    str r2, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r1, #0x58]
    ldr r0, _LIT2
    add r2, r4, #0x2000
    mov r3, #0x2
    bl func_0200506c
    ldr r0, _LIT2
    bl func_02001e3c
    cmp r0, #0x0
    beq .L_44c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x14]
    b .L_46c
.L_44c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x3c]
    cmp r1, #0x8c
    bls .L_46c
    mov r1, #0x1
    str r1, [r0, #0x18]
    mov r1, #0x0
    str r1, [r0, #0x14]
.L_46c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x18]
    bl func_0202d184
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219ac68
_LIT1: .word 0x04001000
_LIT2: .word data_0219ac98
_LIT3: .word data_020c6c8c
_LIT4: .word 0x0000020d
_LIT5: .word 0x0000020e
_LIT6: .word data_020c6c90
_LIT7: .word 0x00000127
