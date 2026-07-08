; func_ov002_022937ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bbe70
        .extern func_ov002_021c4bbc
        .extern func_ov002_021c8390
        .extern func_ov002_02259e8c
        .global func_ov002_022937ec
        .arm
func_ov002_022937ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259e8c
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    ble .L_14c
    mov r4, #0x0
    ldr r6, _LIT0
    ldr r9, _LIT1
    mov r7, r4
    mov r8, r4
.L_5c:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r9, r6
    add r2, r2, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_b8
    ldrh r1, [r2, #0x36]
    cmp r1, #0x0
    bne .L_b8
    mov r1, r7
    bl func_ov002_021c8390
    cmp r4, r0
    bgt .L_b8
    ldrh r0, [r5, #0x2]
    mov r1, r7
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c8390
    mov r4, r0
.L_b8:
    add r7, r7, #0x1
    cmp r7, #0x5
    add r8, r8, #0x14
    blt .L_5c
    mov r9, #0x0
    ldr r7, _LIT0
    ldr sl, _LIT1
    mov r8, r9
    add r6, sp, #0x0
.L_dc:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r2, r1, sl, r7
    add r2, r2, r8
    ldr r1, [r2, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r2, #0x36]
    cmpne r1, #0x0
    beq .L_13c
    mov r1, r9
    mov r2, r6
    bl func_ov002_021c4bbc
    ldr r0, [sp, #0x18]
    cmp r0, r4
    blt .L_13c
    ldr r0, [sp, #0x14]
    cmp r0, r4
    addlt sp, sp, #0x2c
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_13c:
    add r9, r9, #0x1
    cmp r9, #0x5
    add r8, r8, #0x14
    blt .L_dc
.L_14c:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
