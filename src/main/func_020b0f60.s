; func_020b0f60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b007c
        .extern func_020b0138
        .extern func_020b048c
        .extern func_020b0558
        .extern func_020b0778
        .extern func_020b17ac
        .extern func_020b1840
        .extern func_020b1854
        .extern func_020b1d80
        .extern func_020b23a0
        .extern func_020b2b50
        .global func_020b0f60
        .arm
func_020b0f60:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x58
    mov r8, r1
    mov r6, r2
    mov r7, r0
    mov r0, r8
    mov r1, r6
    bl func_020b1840
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r4, r1, lsl #0x18
    mov r0, #0x0
    mov r1, r0
    mov r2, r8
    mov r3, r6
    mov r5, r4, asr #0x18
    bl func_020b2b50
    bne .L_b80
    strb r5, [r7]
    mov r1, #0x0
    strh r1, [r7, #0x2]
    mov r0, #0x1
    strb r0, [r7, #0x4]
    add sp, sp, #0x58
    strb r1, [r7, #0x5]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_b80:
    mov r0, r8
    mov r1, r6
    bl func_020b1854
    cmp r0, #0x2
    bgt .L_bcc
    strb r5, [r7]
    mov r2, #0x0
    strh r2, [r7, #0x2]
    mov r2, #0x1
    mov r0, r8
    mov r1, r6
    strb r2, [r7, #0x4]
    bl func_020b1854
    cmp r0, #0x1
    moveq r0, #0x4e
    movne r0, #0x49
    add sp, sp, #0x58
    strb r0, [r7, #0x5]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_bcc:
    cmp r5, #0x0
    beq .L_bf0
    mov r0, #0x0
    mov r1, r0
    mov r2, r8
    mov r3, r6
    bl func_020b23a0
    mov r8, r0
    mov r6, r1
.L_bf0:
    add r2, sp, #0x8
    mov r0, r8
    mov r1, r6
    bl func_020b007c
    mov r4, r0
    mov r6, r1
    orr ip, r4, #0x0
    rsbs r2, ip, #0x0
    orr r3, r6, #0x100000
    rsc r1, r3, #0x0
    mov r0, #0x0
    and r3, r3, r1
    sub r1, r0, #0x1
    and ip, ip, r2
    mov r2, r1
    adds r0, ip, r1
    adc r1, r3, r2
    str r4, [sp]
    str r6, [sp, #0x4]
    bl func_020b17ac
    rsb r8, r0, #0x35
    ldr r1, [sp, #0x8]
    add r0, sp, #0xc
    sub r1, r1, r8
    bl func_020b0778
    mov r0, r4
    mov r1, r6
    mov r2, r8
    bl func_020b0138
    bl func_020b1d80
    mov r2, r1
    mov r1, r0
    add r0, sp, #0x32
    bl func_020b048c
    mov r0, r7
    add r1, sp, #0x32
    add r2, sp, #0xc
    bl func_020b0558
    strb r5, [r7]
    add sp, sp, #0x58
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
