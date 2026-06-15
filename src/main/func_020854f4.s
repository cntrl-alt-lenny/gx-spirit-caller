; func_020854f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020854f4
        .arm
func_020854f4:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldrb r2, [r0, #0x1]
    cmp r2, #0x10
    bcs .L_ac
    cmp r2, #0x0
    ldr lr, [r1]
    ldr ip, [r1, #0x4]
    ldr r3, [r1, #0x8]
    ldr r2, [r1, #0xc]
    mov r4, #0x0
    bls .L_164
    ldrh r5, [r0, #0x6]
    mov r1, r4
    add r6, r0, r5
    ldrh r5, [r6, #0x2]
    add r6, r6, r5
.L_44:
    ldr r5, [r6, r1]
    add r7, r6, r1
    cmp r5, lr
    bne .L_94
    ldr r5, [r7, #0x4]
    cmp r5, ip
    bne .L_94
    ldr r5, [r7, #0x8]
    cmp r5, r3
    bne .L_94
    ldr r5, [r7, #0xc]
    cmp r5, r2
    bne .L_94
    ldrh r2, [r0, #0x6]
    add sp, sp, #0x4
    ldrh r1, [r0, r2]
    add r0, r0, r2
    add r0, r0, #0x4
    mla r0, r1, r4, r0
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_94:
    ldrb r5, [r0, #0x1]
    add r4, r4, #0x1
    add r1, r1, #0x10
    cmp r4, r5
    bcc .L_44
    b .L_164
.L_ac:
    add r3, r0, #0x8
    ldrb r2, [r3, #0x1]
    cmp r2, #0x0
    beq .L_164
    ldrb r5, [r3, r2, lsl #0x2]
    ldrb r4, [r3]
    add r2, r3, r2, lsl #0x2
    cmp r4, r5
    bls .L_100
.L_d0:
    mov r4, r5, asr #0x5
    ldr ip, [r1, r4, lsl #0x2]
    and r4, r5, #0x1f
    mov r4, ip, lsr r4
    and r4, r4, #0x1
    add r4, r2, r4
    ldrb ip, [r4, #0x1]
    ldrb r4, [r2]
    ldrb r5, [r3, ip, lsl #0x2]
    add r2, r3, ip, lsl #0x2
    cmp r4, r5
    bhi .L_d0
.L_100:
    ldrh r4, [r0, #0x6]
    ldrb r2, [r2, #0x3]
    ldr r3, [r1]
    add r0, r0, r4
    ldrh r4, [r0, #0x2]
    add ip, r0, r4
    ldr r4, [ip, r2, lsl #0x4]
    add ip, ip, r2, lsl #0x4
    cmp r4, r3
    bne .L_164
    ldr r4, [ip, #0x4]
    ldr r3, [r1, #0x4]
    cmp r4, r3
    bne .L_164
    ldr r4, [ip, #0x8]
    ldr r3, [r1, #0x8]
    cmp r4, r3
    bne .L_164
    ldr r3, [ip, #0xc]
    ldr r1, [r1, #0xc]
    cmp r3, r1
    ldreqh r1, [r0], #0x4
    addeq sp, sp, #0x4
    mlaeq r0, r1, r2, r0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_164:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
