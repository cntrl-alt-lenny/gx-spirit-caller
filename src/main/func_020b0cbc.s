; func_020b0cbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b0cbc
        .arm
func_020b0cbc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    mov r5, #0x9
.L_87c:
    ldrh r4, [r1]
    ldrh r3, [r1, #0x2]
    add r1, r1, #0x4
    subs r5, r5, #0x1
    strh r4, [r6]
    strh r3, [r6, #0x2]
    add r6, r6, #0x4
    bne .L_87c
    ldrh r1, [r1]
    strh r1, [r6]
    ldrb r1, [r2, #0x5]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrb r7, [r0, #0x4]
    ldrb r3, [r2, #0x4]
    ldrsh r4, [r0, #0x2]
    mov r1, r7
    cmp r7, r3
    movlt r1, r3
    ldrsh r3, [r2, #0x2]
    sub r6, r4, r3
    add r1, r1, r6
    cmp r1, #0x20
    movgt r1, #0x20
    cmp r7, r1
    bge .L_908
    mov r4, #0x0
.L_8e8:
    ldrb r5, [r0, #0x4]
    add r3, r0, r7
    add r5, r5, #0x1
    strb r5, [r0, #0x4]
    strb r4, [r3, #0x5]
    ldrb r7, [r0, #0x4]
    cmp r7, r1
    blt .L_8e8
.L_908:
    ldrb r4, [r2, #0x4]
    add r3, r0, #0x5
    add ip, r3, r1
    add r4, r4, r6
    cmp r4, r1
    addlt ip, r3, r4
    sub r4, ip, r3
    add r1, r2, #0x5
    sub r4, r4, r6
    add lr, r1, r4
    mov r4, lr
    b .L_99c
.L_938:
    ldrb r7, [ip, #-1]!
    ldrb r5, [lr, #-1]!
    cmp r7, r5
    bcs .L_98c
    ldrb r7, [ip, #-1]
    sub r5, ip, #0x1
    cmp r7, #0x0
    bne .L_964
.L_958:
    ldrb r7, [r5, #-1]!
    cmp r7, #0x0
    beq .L_958
.L_964:
    cmp r5, ip
    beq .L_98c
.L_96c:
    ldrb r7, [r5]
    sub r7, r7, #0x1
    strb r7, [r5]
    ldrb r7, [r5, #0x1]!
    cmp r5, ip
    add r7, r7, #0xa
    strb r7, [r5]
    bne .L_96c
.L_98c:
    ldrb r7, [ip]
    ldrb r5, [lr]
    sub r5, r7, r5
    strb r5, [ip]
.L_99c:
    cmp ip, r3
    cmphi lr, r1
    bhi .L_938
    ldrb r5, [r2, #0x4]
    sub lr, r4, r1
    cmp lr, r5
    bge .L_a78
    ldrb r1, [r4]
    mov r7, #0x0
    cmp r1, #0x5
    movcc r7, #0x1
    bcc .L_a14
    bne .L_a14
    add r1, r2, #0x5
    add r2, r1, r5
    add r4, r4, #0x1
    cmp r4, r2
    bcs .L_9fc
.L_9e4:
    ldrb r1, [r4]
    cmp r1, #0x0
    bne .L_a78
    add r4, r4, #0x1
    cmp r4, r2
    bcc .L_9e4
.L_9fc:
    add r1, r3, lr
    add r2, r1, r6
    ldrb r1, [r2, #-1]
    sub ip, r2, #0x1
    tst r1, #0x1
    movne r7, #0x1
.L_a14:
    cmp r7, #0x0
    beq .L_a78
    ldrb r1, [ip]
    cmp r1, #0x1
    bcs .L_a6c
    ldrb r1, [ip, #-1]
    sub r2, ip, #0x1
    cmp r1, #0x0
    bne .L_a44
.L_a38:
    ldrb r1, [r2, #-1]!
    cmp r1, #0x0
    beq .L_a38
.L_a44:
    cmp r2, ip
    beq .L_a6c
.L_a4c:
    ldrb r1, [r2]
    sub r1, r1, #0x1
    strb r1, [r2]
    ldrb r1, [r2, #0x1]!
    cmp r2, ip
    add r1, r1, #0xa
    strb r1, [r2]
    bne .L_a4c
.L_a6c:
    ldrb r1, [ip]
    sub r1, r1, #0x1
    strb r1, [ip]
.L_a78:
    ldrb r1, [r3]
    mov r5, r3
    cmp r1, #0x0
    bne .L_a94
.L_a88:
    ldrb r1, [r5, #0x1]!
    cmp r1, #0x0
    beq .L_a88
.L_a94:
    cmp r5, r3
    bls .L_adc
    ldrsh r1, [r0, #0x2]
    sub r2, r5, r3
    and r4, r2, #0xff
    sub r1, r1, r4
    strh r1, [r0, #0x2]
    ldrb r1, [r0, #0x4]
    add r2, r3, r1
    cmp r5, r2
    bcs .L_ad0
.L_ac0:
    ldrb r1, [r5], #0x1
    cmp r5, r2
    strb r1, [r3], #0x1
    bcc .L_ac0
.L_ad0:
    ldrb r1, [r0, #0x4]
    sub r1, r1, r4
    strb r1, [r0, #0x4]
.L_adc:
    ldrb r1, [r0, #0x4]
    add r2, r0, #0x5
    add r3, r2, r1
    cmp r3, r2
    bls .L_b04
.L_af0:
    ldrb r1, [r3, #-1]!
    cmp r1, #0x0
    bne .L_b04
    cmp r3, r2
    bhi .L_af0
.L_b04:
    sub r1, r3, r2
    add r1, r1, #0x1
    strb r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
