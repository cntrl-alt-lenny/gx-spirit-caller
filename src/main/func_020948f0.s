; func_020948f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020948f0
        .arm
func_020948f0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl}
    ldr r3, [r0]
    ldr r4, [r0, #0x4]
    ldrb r5, [r0, #0xb]
    ldrb r6, [r0, #0xc]
    ldrb r7, [r0, #0xd]
    ldrb r8, [r0, #0xe]
.L_13c:
    cmp r4, #0x0
    ble .L_1fc
    cmp r6, #0x0
    beq .L_1e4
.L_14c:
    cmp r2, #0x0
    beq .L_1fc
    tst r5, #0x80
    bne .L_174
    ldrb r9, [r1], #0x1
    sub r4, r4, #0x1
    sub r2, r2, #0x1
    swpb r9, r9, [r3]
    add r3, r3, #0x1
    b .L_1d0
.L_174:
    cmp r8, #0x0
    bne .L_188
    ldrb r7, [r1], #0x1
    mov r8, #0x1
    sub r2, r2, #0x1
.L_188:
    cmp r2, #0x0
    beq .L_1fc
    and r9, r7, #0xf
    mov sl, r9, lsl #0x8
    ldrb r9, [r1], #0x1
    mov r8, #0x0
    sub r2, r2, #0x1
    orr r9, r9, sl
    add r9, r9, #0x1
    mov sl, #0x3
    adds r7, sl, r7, asr #0x4
    beq .L_1d0
.L_1b8:
    ldrb sl, [r3, -r9]
    sub r4, r4, #0x1
    swpb sl, sl, [r3]
    add r3, r3, #0x1
    subs r7, r7, #0x1
    bgt .L_1b8
.L_1d0:
    cmp r4, #0x0
    beq .L_1fc
    mov r5, r5, lsl #0x1
    subs r6, r6, #0x1
    bne .L_14c
.L_1e4:
    cmp r2, #0x0
    beq .L_1fc
    ldrb r5, [r1], #0x1
    mov r6, #0x8
    sub r2, r2, #0x1
    b .L_13c
.L_1fc:
    str r3, [r0]
    str r4, [r0, #0x4]
    strb r5, [r0, #0xb]
    strb r6, [r0, #0xc]
    strb r7, [r0, #0xd]
    strb r8, [r0, #0xe]
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl}
    bx lr
