; func_ov002_021bb57c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_ov002_021b9dec
        .global func_ov002_021bb57c
        .arm
func_ov002_021bb57c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r1
    mov sl, r0
    mov r0, r9
    mov r6, #0x0
    bl func_0202e1e0
    cmp r0, #0x0
    ldr r0, _LIT0
    beq .L_c0
    ldr r2, _LIT1
    and r1, sl, #0x1
    mla r7, r1, r0, r2
    ldr fp, _LIT2
    mov r8, sl, lsl #0x4
    mov r5, r6
    mov r4, #0x1
.L_40:
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9dec
    cmp r0, r9
    bne .L_a8
    ldr r3, [r7, #0x40]
    ldrh r0, [r7, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_a8
    ldr r0, [fp, #0xd4]
    tst r0, r4, lsl r8
    bne .L_a8
    cmp r6, #0x0
    beq .L_a4
    ldrh r0, [r7, #0x34]
    cmp r6, r0
    ble .L_a8
.L_a4:
    ldrh r6, [r7, #0x34]
.L_a8:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x1
    blt .L_40
    b .L_140
.L_c0:
    ldr r2, _LIT1
    and r1, sl, #0x1
    mla r0, r1, r0, r2
    add r4, r0, #0x64
    mov r5, #0x5
.L_d4:
    mov r0, sl
    mov r1, r5
    bl func_ov002_021b9dec
    cmp r0, r9
    bne .L_130
    ldr r3, [r4, #0x40]
    ldrh r2, [r4, #0x38]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_130
    cmp r6, #0x0
    beq .L_12c
    ldrh r0, [r4, #0x34]
    cmp r6, r0
    ble .L_130
.L_12c:
    ldrh r6, [r4, #0x34]
.L_130:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r4, r4, #0x14
    ble .L_d4
.L_140:
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022d008c
