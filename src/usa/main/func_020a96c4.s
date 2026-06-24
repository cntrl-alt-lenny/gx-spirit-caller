; func_020a96c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a96c4
        .arm
func_020a96c4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    mov r9, r1
    cmp r9, #0x2
    mov sl, r0
    mov r8, r2
    mov r7, r3
    addcc sp, sp, #0x10
    ldmccia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r9, lsr #0x1
    add fp, r0, #0x1
    sub r0, fp, #0x1
    mla r0, r8, r0, sl
    sub r2, r9, #0x1
    str r0, [sp, #0xc]
    mla r0, r8, r2, sl
    str r0, [sp, #0x8]
    mul r0, fp, r8
    mvn r1, #0x0
    str r0, [sp, #0x4]
    mul r0, r8, r1
    str r0, [sp]
.L_58:
    cmp fp, #0x1
    bls .L_80
    ldr r0, [sp, #0x4]
    sub fp, fp, #0x1
    sub r0, r0, r8
    str r0, [sp, #0x4]
    ldr r0, [sp, #0xc]
    sub r0, r0, r8
    str r0, [sp, #0xc]
    b .L_c8
.L_80:
    mov r2, r8
    ldr r4, [sp, #0x8]
    ldr r3, [sp, #0xc]
    cmp r8, #0x0
    beq .L_ac
.L_94:
    ldrsb r0, [r4]
    ldrsb r1, [r3]
    subs r2, r2, #0x1
    strb r0, [r3], #0x1
    strb r1, [r4], #0x1
    bne .L_94
.L_ac:
    sub r9, r9, #0x1
    cmp r9, #0x1
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x8]
    sub r0, r0, r8
    str r0, [sp, #0x8]
.L_c8:
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    mov r4, fp
    add r0, r1, r0
    cmp r9, fp, lsl #0x1
    add r5, sl, r0
    bcc .L_58
.L_e4:
    mov r4, r4, lsl #0x1
    sub r0, r4, #0x1
    mov r6, r5
    mla r5, r8, r0, sl
    cmp r9, r4
    bls .L_114
    mov r0, r5
    add r1, r5, r8
    blx r7
    cmp r0, #0x0
    addlt r4, r4, #0x1
    addlt r5, r5, r8
.L_114:
    mov r0, r6
    mov r1, r5
    blx r7
    cmp r0, #0x0
    bge .L_58
    mov r2, r8
    mov r3, r5
    cmp r8, #0x0
    beq .L_150
.L_138:
    ldrsb r1, [r6]
    ldrsb r0, [r3]
    subs r2, r2, #0x1
    strb r0, [r6], #0x1
    strb r1, [r3], #0x1
    bne .L_138
.L_150:
    cmp r9, r4, lsl #0x1
    bcs .L_e4
    b .L_58
