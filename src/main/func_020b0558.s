; func_020b0558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b03fc
        .global func_020b0558
        .arm
func_020b0558:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x40
    ldrb r6, [r1, #0x4]
    ldrb r5, [r2, #0x4]
    mov r4, #0x0
    add r3, sp, #0x0
    add r5, r6, r5
    sub r5, r5, #0x1
    add r3, r3, r5
    add r6, r3, #0x1
    mov r7, r6
    strb r4, [r0]
    cmp r5, #0x0
    ble .L_1d4
    add lr, r1, #0x5
    add fp, r2, #0x5
.L_14c:
    ldrb r3, [r2, #0x4]
    sub sl, r3, #0x1
    sub r3, r5, sl
    subs r9, r3, #0x1
    ldrb r3, [r1, #0x4]
    movmi r9, #0x0
    submi sl, r5, #0x1
    add r8, sl, #0x1
    sub r3, r3, r9
    cmp r8, r3
    movgt r8, r3
    add sl, fp, sl
    add r9, lr, r9
    cmp r8, #0x0
    ble .L_1a0
.L_188:
    ldrb ip, [r9], #0x1
    ldrb r3, [sl], #-1
    sub r8, r8, #0x1
    cmp r8, #0x0
    mla r4, ip, r3, r4
    bgt .L_188
.L_1a0:
    ldr r3, _LIT0
    sub r5, r5, #0x1
    umull r8, r9, r4, r3
    mov r9, r9, lsr #0x3
    cmp r5, #0x0
    mov sl, #0xa
    umull r8, r9, sl, r9
    sub r9, r4, r8
    strb r9, [r6, #-1]!
    mov r8, r4
    umull r3, r4, r8, r3
    mov r4, r4, lsr #0x3
    bgt .L_14c
.L_1d4:
    ldrsh r3, [r1, #0x2]
    ldrsh r1, [r2, #0x2]
    cmp r4, #0x0
    add r1, r3, r1
    strh r1, [r0, #0x2]
    beq .L_1fc
    strb r4, [r6, #-1]!
    ldrsh r1, [r0, #0x2]
    add r1, r1, #0x1
    strh r1, [r0, #0x2]
.L_1fc:
    mov r3, #0x0
    b .L_214
.L_204:
    ldrb r2, [r6], #0x1
    add r1, r0, r3
    add r3, r3, #0x1
    strb r2, [r1, #0x5]
.L_214:
    cmp r3, #0x20
    bge .L_224
    cmp r6, r7
    bcc .L_204
.L_224:
    cmp r6, r7
    addcs sp, sp, #0x40
    strb r3, [r0, #0x4]
    ldmcsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r1, [r6]
    cmp r1, #0x5
    addcc sp, sp, #0x40
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bne .L_27c
    add r2, r6, #0x1
    cmp r2, r7
    bcs .L_26c
.L_254:
    ldrb r1, [r2]
    cmp r1, #0x0
    bne .L_27c
    add r2, r2, #0x1
    cmp r2, r7
    bcc .L_254
.L_26c:
    ldrb r1, [r6, #-1]
    tst r1, #0x1
    addeq sp, sp, #0x40
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_27c:
    ldrb r1, [r0, #0x4]
    bl func_020b03fc
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xcccccccd
