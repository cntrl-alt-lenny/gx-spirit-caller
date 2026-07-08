; func_ov002_021bad9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf18c
        .extern data_ov002_022cf194
        .extern data_ov002_022d008c
        .extern func_0202b86c
        .extern func_0202e1e0
        .extern func_ov002_021b9dec
        .global func_ov002_021bad9c
        .arm
func_ov002_021bad9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r9, r1
    mov sl, r0
    mov r0, r9
    mov r8, r2
    mov r5, #0x0
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_b4
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mla r6, r1, r0, r2
    mov r7, sl, lsl #0x4
    mov r4, r5
    mov fp, #0x1
.L_40:
    mov r0, sl
    mov r1, r4
    bl func_ov002_021b9dec
    cmp r9, r0
    bne .L_9c
    cmp r4, r8
    beq .L_9c
    ldr r3, [r6, #0x40]
    ldrh r0, [r6, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_9c
    ldr r0, _LIT2
    ldr r0, [r0, #0xd4]
    tst r0, fp, lsl r7
    addeq r5, r5, #0x1
.L_9c:
    add r4, r4, #0x1
    cmp r4, #0x4
    add r6, r6, #0x14
    add r7, r7, #0x1
    ble .L_40
    b .L_1d0
.L_b4:
    mov r0, r9
    bl func_0202b86c
    cmp r0, #0x2
    beq .L_15c
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mla r2, r1, r0, r2
    mov r0, sl, lsl #0x4
    add r4, r2, #0x64
    add r6, r0, #0x5
    mov r7, #0x5
    mov fp, #0x1
.L_e8:
    mov r0, sl
    mov r1, r7
    bl func_ov002_021b9dec
    cmp r9, r0
    bne .L_144
    cmp r7, r8
    beq .L_144
    ldr r3, [r4, #0x40]
    ldrh r0, [r4, #0x38]
    mov r2, r3, lsr #0x6
    mov r1, r3, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r3, lsr #0x1
    mvn r2, r2
    and r1, r1, #0x1
    and r2, r0, r2
    mvn r0, r1
    tst r2, r0
    beq .L_144
    ldr r0, _LIT2
    ldr r0, [r0, #0xd4]
    tst r0, fp, lsl r6
    addeq r5, r5, #0x1
.L_144:
    add r7, r7, #0x1
    cmp r7, #0xa
    add r4, r4, #0x14
    add r6, r6, #0x1
    blt .L_e8
    b .L_1d0
.L_15c:
    mov r0, sl
    mov r1, #0xa
    bl func_ov002_021b9dec
    cmp r9, r0
    bne .L_1d0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mul r2, r1, r0
    ldr r1, _LIT3
    ldr r0, _LIT4
    ldr r3, [r1, r2]
    ldrh r2, [r0, r2]
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    mvn r1, r1
    and r0, r0, #0x1
    and r1, r2, r1
    mvn r0, r0
    tst r1, r0
    beq .L_1d0
    ldr r0, _LIT2
    mov r1, sl, lsl #0x4
    ldr r2, [r0, #0xd4]
    add r0, r1, #0xa
    mov r1, #0x1
    tst r2, r1, lsl r0
    addeq r5, r5, #0x1
.L_1d0:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022cf194
_LIT4: .word data_ov002_022cf18c
