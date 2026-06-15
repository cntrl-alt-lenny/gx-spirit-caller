; func_020321b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02031f9c
        .extern func_020945f4
        .extern func_02094688
        .global func_020321b0
        .arm
func_020321b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs r4, r0
    mov r6, r1
    mov r5, r2
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r8, #0x0
    bl func_02031f9c
    ldr sl, [r4, #0xc]
    cmp sl, #0x0
    beq .L_1e8
    mov r7, r8
    mov fp, r8
.L_ec:
    ldr r2, [sl, #0x18]
    ldr r1, [sl, #0x14]
    cmp r1, r2
    bcs .L_1dc
    cmp r8, r5
    bcs .L_1e8
    sub r0, r5, r8
    sub r4, r0, #0x8
    cmp r4, #0x0
    ble .L_1e8
    sub r0, r2, r1
    cmp r0, r4
    movlt r4, r0
    add r0, r4, #0x3
    bic r9, r0, #0x3
    cmp r9, #0x0
    ble .L_1c4
    ldrh r2, [sl, #0xc]
    ldrh r1, [sl, #0xe]
    add r0, r6, r8
    orr r1, r2, r1, lsl #0xb
    strh r1, [r6, r8]
    ldr r1, [sl, #0x14]
    add r8, r8, #0x8
    strh r1, [r0, #0x2]
    strh r4, [r0, #0x4]
    strb r7, [r0, #0x6]
    ldr r1, [sl, #0x14]
    cmp r1, #0x0
    ldreqb r1, [r0, #0x6]
    orreq r1, r1, #0x1
    streqb r1, [r0, #0x6]
    ldr r2, [sl, #0x14]
    ldr r1, [sl, #0x18]
    add r2, r2, r4
    cmp r2, r1
    ldrcsb r1, [r0, #0x6]
    mov r2, r4
    orrcs r1, r1, #0x2
    strcsb r1, [r0, #0x6]
    ldr r1, [sl, #0x1c]
    ldr r0, [sl, #0x14]
    add r0, r1, r0
    add r1, r6, r8
    bl func_02094688
    cmp r4, r9
    add r8, r8, r4
    bge .L_1c4
    sub r9, r9, r4
    mov r1, fp
    mov r2, r9
    add r0, r6, r8
    bl func_020945f4
    add r8, r8, r9
.L_1c4:
    ldr r0, [sl, #0x14]
    add r1, r0, r4
    str r1, [sl, #0x14]
    ldr r0, [sl, #0x18]
    cmp r1, r0
    bcc .L_1e8
.L_1dc:
    ldr sl, [sl]
    cmp sl, #0x0
    bne .L_ec
.L_1e8:
    mov r0, r8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
