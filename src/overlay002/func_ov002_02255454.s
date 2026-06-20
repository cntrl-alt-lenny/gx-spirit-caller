; func_ov002_02255454 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d90c0
        .extern func_ov002_021df62c
        .extern func_ov002_021df938
        .global func_ov002_02255454
        .arm
func_ov002_02255454:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r8, #0x0
    str r8, [sp, #0x8]
.L_10:
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r0, [r0, #0xcec]
    ldr r1, _LIT2
    eor r0, r0, r8
    str r0, [sp, #0x4]
    and r0, r0, #0x1
    mla fp, r0, r1, r2
    add r0, fp, #0x30
    str r0, [sp]
    ldr r0, [sp, #0x4]
    ldr r4, _LIT3
    rsb sl, r0, #0x1
    mov r7, #0x0
    mov r6, #0x1f4
    mov r5, #0x1
.L_50:
    ldr r0, [sp, #0x4]
    mov r1, r7
    bl func_ov002_021b9ecc
    cmp r0, r4
    ldr r9, [fp, #0x3c]
    bne .L_10c
    cmp r9, #0x0
    beq .L_10c
    ldr r0, [sp, #0x4]
    mov r1, r7
    mov r2, #0x0
    bl func_ov002_021d90c0
    ldr r1, [fp, #0x40]
    ldrh r2, [fp, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r1, r2, r1, lsr #0x1
    and r1, r1, #0x1
    mvn r1, r1
    tst r0, r1
    beq .L_10c
    ldr r0, [sp]
    mov r1, r7
    ldr r3, [r0]
    ldr r0, [sp, #0x4]
    mov r2, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r2, r3, r2, lsr #0x1f
    bl func_ov002_021df62c
    mov r8, #0x0
    cmp r9, #0x0
    ble .L_104
.L_e4:
    mov r0, sl
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl func_ov002_021df938
    add r8, r8, #0x1
    cmp r8, r9
    blt .L_e4
.L_104:
    mov r0, #0x1
    str r0, [sp, #0x8]
.L_10c:
    ldr r0, [sp]
    add r7, r7, #0x1
    add r0, r0, #0x14
    cmp r7, #0x4
    add fp, fp, #0x14
    str r0, [sp]
    ble .L_50
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_10
    ldr r0, [sp, #0x8]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
_LIT3: .word 0x0000144d
