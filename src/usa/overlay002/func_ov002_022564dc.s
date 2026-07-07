; func_ov002_022564dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202e3d8
        .extern func_ov002_021de390
        .global func_ov002_022564dc
        .arm
func_ov002_022564dc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov r0, #0x0
    str r0, [sp]
.L_10:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, [r0, #0xcec]
    ldr r0, [sp]
    ldr r2, _LIT2
    eor r0, r3, r0
    str r0, [sp, #0x4]
    and r0, r0, #0x1
    mla fp, r0, r1, r2
    add r7, fp, #0x94
    add r8, fp, #0x64
    mov r4, #0x5
.L_40:
    ldr r0, [r7]
    mov r1, r0, lsl #0x13
    ldr r0, _LIT3
    cmp r0, r1, lsr #0x13
    bne .L_114
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_114
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x6
    tst r0, #0x1
    bne .L_114
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    beq .L_90
    ldr r0, _LIT4
    ldr r0, [r0, #0x484]
    cmp r0, #0x0
    beq .L_114
.L_90:
    mov r6, #0x0
    mov r5, r6
    mov r9, fp
    add sl, fp, #0x30
.L_a0:
    ldrh r0, [r9, #0x38]
    cmp r0, #0x0
    beq .L_d8
    ldr r1, [r9, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_d8
    ldr r0, [sl]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e3d8
    cmp r0, #0x0
    addne r6, r6, #0x1
.L_d8:
    add r5, r5, #0x1
    cmp r5, #0xa
    add r9, r9, #0x14
    add sl, sl, #0x14
    ble .L_a0
    cmp r6, #0x0
    bne .L_114
    mov r2, #0x0
    ldr r0, [sp, #0x4]
    mov r1, r4
    mov r3, r2
    bl func_ov002_021de390
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_114:
    add r4, r4, #0x1
    cmp r4, #0xa
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_40
    ldr r0, [sp]
    add r0, r0, #0x1
    str r0, [sp]
    cmp r0, #0x2
    blt .L_10
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x0000169a
_LIT4: .word data_ov002_022ce1a8
