; func_ov002_0222b414 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202df24
        .extern func_0202e274
        .extern func_0202e2a4
        .extern func_ov002_021c9310
        .extern func_ov002_021d7a54
        .extern func_ov002_021de80c
        .extern func_ov002_021e1830
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a2c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0225761c
        .global func_ov002_0222b414
        .arm
func_ov002_0222b414:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x20
    mov sl, r0
    ldrh r2, [sl, #0x2]
    mov r1, #0x0
    str r1, [sp, #0x10]
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r7, r1, #0x1
    bl func_ov002_0225761c
    str r0, [sp, #0xc]
    bl func_ov002_021e2a4c
    ldr r1, [sp, #0xc]
    mov r0, sl
    mov r2, #0x0
    bl func_ov002_021de80c
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r0, r1, r0, r2
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0x14]
.L_5c:
    ldr r0, _LIT2
    ldr r2, _LIT0
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x14]
    ldr r1, _LIT1
    eor r3, r3, r0
    and r0, r3, #0x1
    mla r1, r0, r1, r2
    mov r0, r3, lsl #0x4
    str r0, [sp, #0x4]
    add r0, r1, #0x30
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x18]
    ldr r0, [sp, #0x8]
    mov r5, #0xb
    add r0, r0, #0x120
    str r0, [sp, #0x1c]
    mov fp, #0x0
    mov r4, #0x1
.L_ac:
    ldr r2, [sp, #0xc]
    ldr r0, [sp, #0x4]
    mov r1, #0x1
    tst r2, r1, lsl r0
    beq .L_188
    ldr r0, [sp]
    ldr r1, [r0]
    ldr r0, [sp, #0x8]
    mov r1, r1, lsl #0x13
    ldr r0, [r0, #0xc]
    mov r8, r1, lsr #0x13
    subs r6, r0, #0x1
    bmi .L_140
    ldr r0, [sp, #0x1c]
    add r9, r0, r6, lsl #0x2
.L_e8:
    ldr r0, [r9]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_134
    mov r0, r7
    mov r1, r5
    mov r2, r6
    bl func_ov002_021c9310
    mov r1, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r2, r4
    moveq r2, fp
    mov r0, r7
    bl func_ov002_021d7a54
.L_134:
    sub r9, r9, #0x4
    subs r6, r6, #0x1
    bpl .L_e8
.L_140:
    ldrh r0, [sl, #0x2]
    mov r1, r8
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r3, #0x1
    moveq r3, #0x0
    mov r0, r7
    bl func_ov002_021e1830
    mov r0, r8
    bl func_0202e2a4
    cmp r0, #0x0
    bne .L_188
    mov r0, r8
    bl func_0202e274
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x10]
.L_188:
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    ldr r0, [sp]
    add r0, r0, #0x14
    str r0, [sp]
    ldr r0, [sp, #0x18]
    add r0, r0, #0x1
    str r0, [sp, #0x18]
    cmp r0, #0xa
    ble .L_ac
    ldr r0, [sp, #0x14]
    add r0, r0, #0x1
    str r0, [sp, #0x14]
    cmp r0, #0x2
    blt .L_5c
    bl func_ov002_021e2b6c
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    beq .L_1e8
    mov r0, #0xf
    bl func_ov002_021e2a2c
    mov r0, r7
    bl func_ov002_021e277c
.L_1e8:
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d008c
