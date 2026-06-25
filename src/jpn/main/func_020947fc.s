; func_020947fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020947fc
        .arm
func_020947fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl}
    ldr r3, [r0]
    ldr r4, [r0, #0x4]
    ldrb r5, [r0, #0xb]
    ldrb r6, [r0, #0xc]
    ldrb r7, [r0, #0xd]
    ldrb r8, [r0, #0xe]
.L_1c:
    cmp r4, #0x0
    ble .L_dc
    cmp r6, #0x0
    beq .L_c4
.L_2c:
    cmp r2, #0x0
    beq .L_dc
    tst r5, #0x80
    bne .L_54
    ldrb r9, [r1], #0x1
    sub r4, r4, #0x1
    sub r2, r2, #0x1
    swpb r9, r9, [r3]
    add r3, r3, #0x1
    b .L_b0
.L_54:
    cmp r8, #0x0
    bne .L_68
    ldrb r7, [r1], #0x1
    mov r8, #0x1
    sub r2, r2, #0x1
.L_68:
    cmp r2, #0x0
    beq .L_dc
    and r9, r7, #0xf
    mov sl, r9, lsl #0x8
    ldrb r9, [r1], #0x1
    mov r8, #0x0
    sub r2, r2, #0x1
    orr r9, r9, sl
    add r9, r9, #0x1
    mov sl, #0x3
    adds r7, sl, r7, asr #0x4
    beq .L_b0
.L_98:
    ldrb sl, [r3, -r9]
    sub r4, r4, #0x1
    swpb sl, sl, [r3]
    add r3, r3, #0x1
    subs r7, r7, #0x1
    bgt .L_98
.L_b0:
    cmp r4, #0x0
    beq .L_dc
    mov r5, r5, lsl #0x1
    subs r6, r6, #0x1
    bne .L_2c
.L_c4:
    cmp r2, #0x0
    beq .L_dc
    ldrb r5, [r1], #0x1
    mov r6, #0x8
    sub r2, r2, #0x1
    b .L_1c
.L_dc:
    str r3, [r0]
    str r4, [r0, #0x4]
    strb r5, [r0, #0xb]
    strb r6, [r0, #0xc]
    strb r7, [r0, #0xd]
    strb r8, [r0, #0xe]
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl}
    bx lr
