; func_ov002_02254b7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bad9c
        .extern func_ov002_021d8fd0
        .extern func_ov002_021d900c
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2fc4
        .global func_ov002_02254b7c
        .arm
func_ov002_02254b7c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mvn r2, #0x0
    mov sl, r0
    bl func_ov002_021bad9c
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, sl, #0x1
    mla r2, r1, r0, r2
    mov r0, sl, lsl #0x1f
    and r0, r0, #-2147483648
    orr r9, r0, #0xa200000
    ldr fp, _LIT0
    and r8, sl, #0xff
    add r6, r2, #0x94
    add r7, r2, #0x64
    orr r9, r9, #0x30000000
    mov r4, #0x5
.L_230:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    cmp fp, r0, lsr #0x13
    mov r5, r0, lsr #0x13
    bne .L_2ec
    ldr r1, [r7, #0x40]
    ldrh r2, [r7, #0x38]
    mov r0, r1, lsr #0x6
    and r0, r0, #0x1
    mvn r0, r0
    and r0, r2, r0
    mov r2, r1, lsr #0x2
    orr r2, r2, r1, lsr #0x1
    and r2, r2, #0x1
    mvn r2, r2
    tst r0, r2
    beq .L_2ec
    mov r0, r1, lsr #0x5
    tst r0, #0x1
    mov r0, sl
    mov r1, r4
    bne .L_2e4
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2ca4
    mov r0, sl
    mov r1, r4
    mov r2, #0x0
    bl func_ov002_021d8fd0
    mov r1, r4, lsl #0x10
    and r1, r1, #0x1f0000
    ldr r3, [r6]
    mov r0, r5, lsl #0x10
    orr r1, r9, r1
    orr r0, r1, r0, lsr #0x10
    mov r1, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r1, r3, r1, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, r8
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    b .L_2ec
.L_2e4:
    mov r2, #0x1
    bl func_ov002_021d900c
.L_2ec:
    add r4, r4, #0x1
    cmp r4, #0xa
    add r6, r6, #0x14
    add r7, r7, #0x14
    ble .L_230
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001354
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
