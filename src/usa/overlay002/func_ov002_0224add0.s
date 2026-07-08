; func_ov002_0224add0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202b824
        .extern func_0202b854
        .extern func_ov002_021c3304
        .extern func_ov002_021c8400
        .extern func_ov002_0224ad54
        .extern func_ov002_02253370
        .global func_ov002_0224add0
        .arm
func_ov002_0224add0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov r8, #0x0
    mov sl, r0
    mov r1, #0x1
    mov r9, r8
    add r0, sp, #0x0
.L_1c:
    str r9, [r0, r1, lsl #0x2]
    add r1, r1, #0x1
    cmp r1, #0xc
    ble .L_1c
    ldr r0, _LIT0
    and r1, sl, #0x1
    mul r4, r1, r0
    ldr r0, _LIT1
    ldr r5, _LIT2
    add r7, r0, r4
    add r6, r7, #0x30
.L_48:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_80
    mov r0, sl
    mov r1, r9
    bl func_ov002_021c8400
    ldr r1, [r5, #0x494]
    add r1, r1, r8
    mov r1, r1, lsl #0x19
    add r1, r5, r1, lsr #0x18
    add r1, r1, #0x400
    strh r0, [r1, #0x98]
    add r8, r8, #0x1
.L_80:
    add r9, r9, #0x1
    cmp r9, #0x4
    add r6, r6, #0x14
    ble .L_48
    ldr r0, _LIT3
    mov r9, #0x0
    ldr r0, [r0, r4]
    cmp r0, #0x0
    addls sp, sp, #0x34
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT1
    add r0, r7, #0x18
    add r7, r1, r4
    add r6, r0, #0x400
    sub r4, r8, #0x1
    add fp, sp, #0x0
.L_c0:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202b854
    mov r8, r0
    mov r0, r5
    bl func_0202b824
    cmp r0, #0x3
    bne .L_138
    mov r0, sl
    mov r1, sl
    mov r2, r9
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_138
    ldr r0, [fp, r8, lsl #0x2]
    cmp r0, #0x0
    bne .L_120
    mov r0, r4
    mov r1, r8
    bl func_ov002_0224ad54
    cmp r0, #0x0
    beq .L_138
.L_120:
    mov r3, #0x1
    mov r0, sl
    mov r1, #0xe
    mov r2, r9
    str r3, [fp, r8, lsl #0x2]
    bl func_ov002_02253370
.L_138:
    ldr r0, [r7, #0x14]
    add r9, r9, #0x1
    cmp r9, r0
    add r6, r6, #0x4
    bcc .L_c0
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022ce1a8
_LIT3: .word data_ov002_022cf0a0
