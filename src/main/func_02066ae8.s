; func_02066ae8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101764
        .extern data_0210176c
        .extern data_02101928
        .extern func_02067294
        .global func_02066ae8
        .arm
func_02066ae8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x114
    movs fp, r3
    mov r3, #0x0
    ldr r7, [sp, #0x138]
    str r3, [sp, #0x10c]
    mov sl, r0
    mov r9, r1
    mov r8, r2
    addeq sp, sp, #0x114
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r0, r8, #0x1
    cmp r0, #0x1
    bhi .L_bec
    ldr r0, [r9, #0x800]
    rsb r0, r0, #0x800
    cmp r0, #0x2
    addcc sp, sp, #0x114
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sl, #0x10c]
    ldr r2, [sl, #0x98]
    mov r0, r8
    blx r2
    str r0, [sp]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    mov r0, r0, lsl #0x8
    and r1, r1, #0xff
    and r0, r0, #0xff00
    orr r0, r1, r0
    strh r0, [sp, #0x8]
    add r0, sp, #0x8
    ldrb r1, [r0]
    ldr r2, [r9, #0x800]
    ldrb r0, [r0, #0x1]
    add r3, r9, r2
    strb r1, [r9, r2]
    strb r0, [r3, #0x1]
    ldr r0, [r9, #0x800]
    add r0, r0, #0x2
    str r0, [r9, #0x800]
    b .L_bf4
.L_bec:
    mov r0, #0x1
    str r0, [sp]
.L_bf4:
    cmp fp, #0xff
    bne .L_cc8
    ldr r2, [sl, #0x10c]
    ldr r3, [sl, #0x94]
    add r1, sp, #0xc
    mov r0, r8
    blx r3
    ldr r0, [sp, #0x10c]
    mov r7, #0x0
    cmp r0, #0x0
    ble .L_c90
    ldr fp, _LIT0
    ldr r4, _LIT1
    add r5, sp, #0xc
.L_c2c:
    ldrb r0, [r5]
    ldr r1, [r4, r0, lsl #0x2]
    mov r0, r9
    cmp r1, #0x0
    moveq r1, fp
    bl func_02067294
    cmp r8, #0x0
    bne .L_c7c
    ldrb r0, [r5]
    ldr r2, [sl, #0x10c]
    ldr r3, [sl, #0x88]
    mov r1, r9
    ldr r6, [r9, #0x800]
    blx r3
    ldr r0, [r9, #0x800]
    cmp r6, r0
    bne .L_c7c
    ldr r1, _LIT2
    mov r0, r9
    bl func_02067294
.L_c7c:
    ldr r0, [sp, #0x10c]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x1
    blt .L_c2c
.L_c90:
    ldr r1, [r9, #0x800]
    rsb r0, r1, #0x800
    cmp r0, #0x1
    addlt sp, sp, #0x114
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, r1, #0x1
    str r0, [r9, #0x800]
    mov r0, #0x0
    strb r0, [r9, r1]
    ldr fp, [sp, #0x10c]
    cmp r8, #0x0
    add r7, sp, #0xc
    addeq sp, sp, #0x114
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cc8:
    ldr r0, [sp]
    mov r6, #0x0
    cmp r0, #0x0
    addle sp, sp, #0x114
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    str r6, [sp, #0x4]
.L_ce0:
    ldr r5, [sp, #0x4]
    cmp fp, #0x0
    ble .L_d78
.L_cec:
    cmp r8, #0x0
    ldr r4, [r9, #0x800]
    bne .L_d10
    ldrb r0, [r7, r5]
    ldr r2, [sl, #0x10c]
    ldr r3, [sl, #0x88]
    mov r1, r9
    blx r3
    b .L_d54
.L_d10:
    cmp r8, #0x1
    bne .L_d34
    ldrb r0, [r7, r5]
    ldr r3, [sl, #0x10c]
    ldr ip, [sl, #0x8c]
    mov r1, r6
    mov r2, r9
    blx ip
    b .L_d54
.L_d34:
    cmp r8, #0x2
    bne .L_d54
    ldrb r0, [r7, r5]
    ldr r3, [sl, #0x10c]
    ldr ip, [sl, #0x90]
    mov r1, r6
    mov r2, r9
    blx ip
.L_d54:
    ldr r0, [r9, #0x800]
    cmp r4, r0
    bne .L_d6c
    ldr r1, _LIT2
    mov r0, r9
    bl func_02067294
.L_d6c:
    add r5, r5, #0x1
    cmp r5, fp
    blt .L_cec
.L_d78:
    ldr r0, [sp]
    add r6, r6, #0x1
    cmp r6, r0
    blt .L_ce0
    add sp, sp, #0x114
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02101764
_LIT1: .word data_02101928
_LIT2: .word data_0210176c
