; func_02094b24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02094a20
        .global func_02094b24
        .arm
func_02094b24:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    movs r9, r1
    mov r1, r9, lsl #0x8
    mov sl, r0
    mov r8, r2
    orr r0, r1, #0x10
    mov fp, sl
    mov r4, r9
    str r0, [r8], #0x4
    mov r7, #0x4
    beq .L_468
    mov r0, #0x0
    str r0, [sp, #0x4]
.L_38c:
    ldr r6, [sp, #0x4]
    str r8, [sp]
    mov r5, r6
    add r8, r8, #0x1
    add r7, r7, #0x1
.L_3a0:
    mov r0, r6, lsl #0x1
    cmp r9, #0x0
    and r6, r0, #0xff
    beq .L_448
    mov r0, fp
    mov r1, sl
    mov r2, r9
    add r3, sp, #0x8
    bl func_02094a20
    cmp r0, #0x0
    beq .L_424
    orr r1, r6, #0x1
    add r7, r7, #0x2
    cmp r7, r4
    and r6, r1, #0xff
    addcs sp, sp, #0xc
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxcs lr
    ldrh r1, [sp, #0x8]
    sub r2, r0, #0x3
    mov r2, r2, lsl #0x4
    sub r1, r1, #0x1
    orr r1, r2, r1, asr #0x8
    strb r1, [r8]
    ldrh r1, [sp, #0x8]
    add r2, r8, #0x1
    add r8, r8, #0x2
    sub r1, r1, #0x1
    strb r1, [r2]
    add sl, sl, r0
    sub r9, r9, r0
    b .L_448
.L_424:
    add r7, r7, #0x1
    cmp r7, r4
    addcs sp, sp, #0xc
    movcs r0, #0x0
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxcs lr
    ldrb r0, [sl], #0x1
    sub r9, r9, #0x1
    strb r0, [r8], #0x1
.L_448:
    add r0, r5, #0x1
    and r5, r0, #0xff
    cmp r5, #0x8
    bcc .L_3a0
    ldr r0, [sp]
    cmp r9, #0x0
    strb r6, [r0]
    bne .L_38c
.L_468:
    ands r0, r7, #0x3
    mov r2, #0x0
    beq .L_490
    mov r1, r2
.L_478:
    add r0, r2, #0x1
    and r2, r0, #0xff
    add r0, r7, r2
    strb r1, [r8], #0x1
    ands r0, r0, #0x3
    bne .L_478
.L_490:
    mov r0, r7
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
