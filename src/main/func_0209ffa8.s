; func_0209ffa8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020944a4
        .extern func_0209d69c
        .extern func_0209d724
        .extern func_0209db88
        .extern func_0209f2a8
        .extern func_0209f970
        .extern func_0209fae4
        .extern func_0209fe94
        .global func_0209ffa8
        .arm
func_0209ffa8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    mov r9, r1
    mov r8, r2
    mov r0, #0x2
    mov r1, #0x9
    mov r2, #0xa
    bl func_0209db88
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
    cmp sl, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    cmp r9, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    cmp r8, #0x0
    addeq sp, sp, #0xc
    moveq r0, #0x6
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    bl func_0209d724
    movs r4, r0
    bne .L_e7c
    bl func_0209d69c
    mov r7, r0
.L_e7c:
    add r0, sl, #0x800
    ldrh r0, [r0, #0x1c]
    cmp r0, #0x5
    addeq sp, sp, #0xc
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    cmp r0, #0x1
    beq .L_eb4
    cmp r0, #0x4
    addne sp, sp, #0xc
    movne r0, #0x3
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
.L_eb4:
    cmp r4, #0x0
    mov r4, #0x5
    bne .L_1058
    mov r6, #0x0
    mov fp, r6
    cmp r0, #0x4
    bne .L_f7c
    add r1, sl, #0x800
    mov r3, #0x1
    strh r3, [r1, #0x1c]
    ldrh r5, [r1, #0xe]
    ldrh r2, [r1, #0x8]
    ldr r0, _LIT0
    and r5, r5, r7
    mov r5, r5, lsl #0x10
    mov r5, r5, lsr #0x10
    str r5, [sp]
    ldrh r5, [r1, #0x16]
    add r2, r2, #0x3
    and r2, r2, #0x3
    str r5, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r2, r2, lsl #0x10
    mov r5, r2, lsr #0x10
    ldrh r3, [r1, #0x14]
    mov r1, sl
    add r2, sl, r5, lsl #0x9
    bl func_0209f2a8
    cmp r0, #0x7
    bne .L_f54
    add r0, sl, r5, lsl #0x1
    ldr r1, _LIT1
    add r0, r0, #0x800
    strh r1, [r0]
    add r0, sl, #0x800
    ldrh r1, [r0, #0xa]
    add r1, r1, #0x1
    and r1, r1, #0x3
    strh r1, [r0, #0xa]
    b .L_f7c
.L_f54:
    cmp r0, #0x0
    beq .L_f7c
    cmp r0, #0x2
    addne r0, sl, #0x800
    movne r1, r4
    strneh r1, [r0, #0x1c]
    addne sp, sp, #0xc
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxne lr
.L_f7c:
    add r0, sl, #0x800
    ldrh r2, [r0, #0xc]
    ldrh r1, [r0, #0xa]
    cmp r2, r1
    beq .L_1014
    mov r4, r2, lsl #0x9
    ldrh r3, [sl, r4]
    mov r1, r8
    mov r2, #0x200
    orr r3, r3, #0x1
    strh r3, [sl, r4]
    ldrh r0, [r0, #0xc]
    add r0, sl, r0, lsl #0x9
    bl func_020944a4
    add r1, sl, #0x800
    ldrh r0, [r1, #0xc]
    mov r6, #0x1
    mov r4, #0x0
    add r0, sl, r0, lsl #0x1
    add r0, r0, #0x800
    ldrh r0, [r0]
    strh r0, [r1, #0x1a]
    ldrh r0, [r1, #0xc]
    add r0, r0, #0x1
    and r0, r0, #0x3
    strh r0, [r1, #0xc]
    ldrh r0, [r1, #0x18]
    cmp r0, #0x0
    bne .L_1010
    cmp r7, #0x0
    beq .L_1010
    ldrh r0, [r1, #0x8]
    mov r0, r0, lsl #0x9
    ldrh r0, [sl, r0]
    cmp r0, #0x1
    moveq fp, r6
    beq .L_1014
.L_1010:
    mov fp, #0x0
.L_1014:
    mov r0, sl
    mov r1, #0x0
    bl func_0209f970
    cmp r6, #0x0
    beq .L_1160
    mov r0, sl
    mov r2, r9
    mov r1, #0x0
    bl func_0209fae4
    add r0, sl, #0x800
    ldrh r0, [r0, #0x18]
    cmp r0, #0x0
    bne .L_1160
    mov r0, sl
    mov r1, fp
    bl func_0209f970
    b .L_1160
.L_1058:
    cmp r0, #0x4
    mov r0, #0x0
    addeq r1, sl, #0x800
    moveq r0, #0x1
    streqh r0, [r1, #0x1c]
    beq .L_10dc
    add r1, sl, #0x800
    ldrh r2, [r1, #0xc]
    ldrh r1, [r1, #0x8]
    cmp r2, r1
    beq .L_10dc
    mov r2, r2, lsl #0x9
    ldrh r1, [sl, r2]
    ands r3, r1, #0x1
    orreq r1, r1, #0x1
    streqh r1, [sl, r2]
    beq .L_10dc
    mov r1, r8
    add r0, sl, r2
    mov r2, #0x200
    bl func_020944a4
    add r2, sl, #0x800
    ldrh r1, [r2, #0xc]
    mov r0, #0x1
    mov r4, #0x0
    add r1, sl, r1, lsl #0x1
    add r1, r1, #0x800
    ldrh r1, [r1]
    strh r1, [r2, #0x1a]
    ldrh r1, [r2, #0xc]
    add r1, r1, #0x1
    and r1, r1, #0x3
    strh r1, [r2, #0xc]
.L_10dc:
    cmp r0, #0x0
    beq .L_1160
    add r0, sl, #0x800
    ldrh r1, [r0, #0xa]
    ldrh r2, [r0, #0x10]
    mov r0, r9
    add r1, sl, r1, lsl #0x9
    add r7, r1, #0x20
    mov r1, r7
    bl func_020944a4
    add r3, sl, #0x800
    ldrh r1, [r3, #0xe]
    mov r5, #0x1
    ldr r0, _LIT0
    str r1, [sp]
    ldrh r6, [r3, #0x16]
    mov r1, sl
    mov r2, r7
    str r6, [sp, #0x4]
    str r5, [sp, #0x8]
    ldrh r3, [r3, #0x10]
    bl func_0209f2a8
    add r1, sl, #0x800
    ldrh r2, [r1, #0xa]
    cmp r0, #0x2
    add r2, r2, #0x1
    and r2, r2, #0x3
    strh r2, [r1, #0xa]
    beq .L_1160
    cmp r0, #0x0
    movne r0, #0x5
    strneh r0, [r1, #0x1c]
    movne r4, r5
.L_1160:
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word func_0209fe94
_LIT1: .word 0x0000ffff
