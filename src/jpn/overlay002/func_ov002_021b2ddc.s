; func_ov002_021b2ddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0570
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_ov002_021b9dec
        .global func_ov002_021b2ddc
        .arm
func_ov002_021b2ddc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    movs r6, r1
    mov fp, r0
    str r2, [sp]
    str r3, [sp, #0x4]
    ldr r5, [sp, #0x30]
    ldr r4, [sp, #0x34]
    mov r7, #0x0
    beq .L_13c
.L_28:
    ldr r0, _LIT0
    add r1, r0, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcc .L_134
    cmp r0, #0xb
    bhi .L_134
    ldrh r0, [r1]
    and r8, r0, #0xff
    mov r0, r0, asr #0x8
    and r9, r0, #0xff
    mov r0, r8
    mov r1, r9
    bl func_ov002_021b9dec
    mov sl, r0
    ldr r0, [sp]
    cmp sl, r0
    bne .L_134
    ldr r0, _LIT1
    add r1, r9, r8, lsl #0x4
    ldr r2, [r0, #0xd4]
    mov r0, #0x1
    tst r2, r0, lsl r1
    bne .L_134
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_c8
    ldr r1, _LIT2
    ldr r0, _LIT3
    and r2, r8, #0x1
    mla r1, r2, r1, r0
    mov r0, #0x14
    mla r0, r9, r0, r1
    ldr r0, [r0, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    bne .L_134
.L_c8:
    cmp fp, r8
    movne r0, #0x1
    moveq r0, #0x0
    add r8, r0, #0x1
    and r0, r5, r8
    cmp r0, #0x0
    ble .L_114
    mov r0, sl
    bl func_0202b824
    cmp r0, #0x16
    beq .L_134
    cmp r9, #0x5
    blt .L_114
    cmp r9, #0xa
    bgt .L_114
    mov r0, sl
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_134
.L_114:
    and r0, r4, r8
    cmp r0, #0x0
    ble .L_130
    mov r0, sl
    bl func_0202b824
    cmp r0, #0x17
    beq .L_134
.L_130:
    add r7, r7, #0x1
.L_134:
    cmp r6, #0x0
    bne .L_28
.L_13c:
    mov r0, r7
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0570
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf08c
