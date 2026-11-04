; func_ov002_02250044 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b8c0
        .extern func_ov002_021c8940
        .extern func_ov002_021e797c
        .extern func_ov002_02253458
        .global func_ov002_02250044
        .arm
func_ov002_02250044:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r6, #0x0
    add r1, sp, #0x4
    str r6, [r1]
    mov sl, r0
    ldrh r2, [sp, #0x6]
    mov r0, sl, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0x1
    and r0, r0, #0x1
    orr r0, r2, r0
    strh r0, [sp, #0x6]
    ldrh r3, [sp, #0x6]
    ldr r0, _LIT0
    and r2, sl, #0x1
    mul r9, r2, r0
    bic r3, r3, #0x3e
    orr r3, r3, #0x16
    strh r3, [sp, #0x6]
    ldrh r3, [sp, #0x6]
    ldr r0, _LIT1
    mov r5, r6
    add r0, r0, r9
    bic r2, r3, #0x3000
    str r0, [sp]
    mov r8, r0
    str r6, [r1, #0x4]
    str r6, [r1, #0x8]
    str r6, [r1, #0xc]
    str r6, [r1, #0x10]
    str r6, [r1, #0x14]
    strh r2, [sp, #0x6]
    add r7, r0, #0x30
    mov fp, r6
    add r4, sp, #0x1c
.L_90:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_cc
    mov r0, sl
    mov r1, r5
    bl func_ov002_021c8940
    cmp r0, #0xf
    bne .L_cc
    mov r6, #0x1
    mov r0, r6
    str r0, [r4, r5, lsl #0x2]
    b .L_d0
.L_cc:
    str fp, [r4, r5, lsl #0x2]
.L_d0:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r7, r7, #0x14
    add r8, r8, #0x14
    ble .L_90
    cmp r6, #0x0
    addeq sp, sp, #0x30
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    mov r6, #0x0
    ldr r0, [r0, r9]
    cmp r0, #0x0
    addls sp, sp, #0x30
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    ldr r1, _LIT1
    add r0, r0, #0x18
    add r4, r0, #0x400
    add r5, r1, r9
.L_11c:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r7, r0, lsr #0x13
    mov r0, r7
    bl func_0202b8c0
    cmp r0, #0x3
    bne .L_1c4
    ldr r2, [r4]
    strh r7, [sp, #0x4]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r2, r1, lsl #0x10
    ldrh r0, [sp, #0x8]
    ldr r1, _LIT3
    mov r2, r2, lsr #0x10
    and r1, r0, r1
    mov r0, r2, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    strh r0, [sp, #0x8]
    mov r8, #0x0
    add r9, sp, #0x4
    add r7, sp, #0x1c
.L_180:
    ldr r0, [r7, r8, lsl #0x2]
    cmp r0, #0x0
    beq .L_1b8
    mov r0, r9
    mov r1, sl
    mov r2, r8
    bl func_ov002_021e797c
    cmp r0, #0x1
    bne .L_1b8
    mov r0, sl
    mov r2, r6
    mov r1, #0xe
    bl func_ov002_02253458
    b .L_1c4
.L_1b8:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_180
.L_1c4:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r4, r4, #0x4
    bcc .L_11c
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf180
_LIT3: .word 0xffff803f
