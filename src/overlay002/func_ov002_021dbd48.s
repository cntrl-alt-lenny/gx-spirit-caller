; func_ov002_021dbd48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d016c
        .extern func_0202b878
        .extern func_ov002_021bae7c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c2084
        .extern func_ov002_021c2330
        .global func_ov002_021dbd48
        .arm
func_ov002_021dbd48:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r1
    ldr r5, _LIT0
    and r7, r9, #0x1
    mul r6, r7, r5
    mov r8, r2
    mov r4, #0x14
    mul r5, r8, r4
    ldr r7, _LIT1
    mov sl, r0
    add r4, r7, r6
    add r4, r4, r5
    ldr r4, [r4, #0x30]
    mov r7, r3
    mov r4, r4, lsl #0x13
    movs r4, r4, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r3, _LIT2
    add ip, r8, r9, lsl #0x4
    ldr lr, [r3, #0xd4]
    mov r3, #0x1
    tst lr, r3, lsl ip
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_a0
    mov r0, sl
    mov r1, r9
    mov r2, r8
    mov r3, #0x0
    bl func_ov002_021c2084
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a0:
    cmp r7, #0xf
    bne .L_c4
    ldrh r2, [sl]
    mov r0, r9
    mov r1, r8
    bl func_ov002_021c2330
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c4:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_12c
    ldr r1, _LIT3
    cmp r4, r1
    bne .L_12c
    ldr r0, _LIT4
    add r0, r0, r6
    ldrh r0, [r5, r0]
    cmp r0, #0x0
    beq .L_12c
    ldrh r2, [sl, #0x2]
    mov r0, r2, lsl #0x11
    mov r2, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r2, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r9, r0
    bne .L_12c
    mov r0, r9
    sub r1, r1, #0x1c
    mvn r2, #0x0
    bl func_ov002_021bae7c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_12c:
    ldrh r0, [sl, #0x4]
    mov r0, r0, lsl #0x1b
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x20]
    cmpne r0, #0x0
    beq .L_1a8
    ldrh r1, [sl, #0x2]
    mov r0, r1, lsl #0x11
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    eor r0, r0, r1, lsr #0x1f
    rsb r0, r0, #0x1
    cmp r9, r0
    bne .L_1a8
    cmp r8, #0x5
    blt .L_1a8
    mov r0, r4
    bl func_0202b878
    cmp r0, #0x17
    bne .L_1a8
    ldr r0, _LIT5
    cmp r4, r0
    bne .L_1a0
    ldr r0, _LIT6
    add r0, r0, r6
    ldr r0, [r5, r0]
    mov r0, r0, lsr #0x3
    tst r0, #0x1
    bne .L_1a8
.L_1a0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1a8:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x0000169f
_LIT4: .word data_ov002_022cf1a4
_LIT5: .word 0x00001258
_LIT6: .word data_ov002_022cf1ac
