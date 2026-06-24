; func_ov002_021d5d58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d479c
        .extern func_ov002_021d90c0
        .extern func_ov002_021d9144
        .extern func_ov002_021e2d94
        .extern func_ov002_021e30b4
        .extern func_ov002_02244fe4
        .global func_ov002_021d5d58
        .arm
func_ov002_021d5d58:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r1
    mov r9, r2
    mov r8, r3
    mov r2, sl, asr #0x8
    mov r1, r9, asr #0x8
    mov fp, r0
    cmp r8, #0xa
    and r4, sl, #0xff
    and r5, r2, #0xff
    and r6, r9, #0xff
    and r7, r1, #0xff
    bne .L_84
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r1, [r0, #0x30]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    cmp r1, r0
    bne .L_74
    mov r0, r4
    mov r1, r5
    rsb r2, r6, #0x1
    bl func_ov002_021d90c0
.L_74:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021d9144
.L_84:
    cmp fp, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x42
    mov r0, r0, lsl #0x10
    mov r3, r8, lsl #0x10
    mov r1, sl
    mov r2, r9
    mov r0, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d479c
    mov r0, #0x14
    ldr r1, _LIT0
    and r2, r6, #0x1
    mul r5, r2, r1
    mul r4, r7, r0
    ldr r2, _LIT3
    ldr r1, _LIT4
    add r0, r2, r5
    ldr r3, [r4, r0]
    add r2, r1, r5
    mov r1, r3, lsr #0x6
    mov r0, r3, lsr #0x2
    and r1, r1, #0x1
    orr r0, r0, r3, lsr #0x1
    and r0, r0, #0x1
    ldrh r2, [r4, r2]
    mvn r1, r1
    mvn r0, r0
    and r1, r2, r1
    tst r1, r0
    beq .L_1a8
    mov r0, r6
    mov r1, r7
    bl func_ov002_021b9ecc
    ldr r1, _LIT5
    cmp r0, r1
    beq .L_12c
    ldr r1, _LIT6
    cmp r0, r1
    beq .L_194
    b .L_1a8
.L_12c:
    ldr r1, _LIT1
    mov r0, r6
    add r2, r1, r5
    mov r1, r7
    add r5, r2, #0x30
    bl func_ov002_021b9ecc
    ldr r2, [r5, r4]
    mov r3, r6, lsl #0x1f
    mov r1, r2, lsl #0x2
    and r3, r3, #-2147483648
    mov r1, r1, lsr #0x18
    orr r4, r3, #0x200000
    mov r3, r7, lsl #0x10
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r4, r4, #0x30000000
    and r2, r3, #0x1f0000
    orr r2, r4, r2
    mov r0, r0, lsl #0x10
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    orr r2, sl, r9, lsl #0x10
    bl func_ov002_021e30b4
    b .L_1a8
.L_194:
    mov r0, r6
    mov r1, r7
    mov r2, #0x5
    mov r3, #0x1
    bl func_ov002_021e2d94
.L_1a8:
    orr r1, sl, r9, lsl #0x10
    mov r0, #0x18
    bl func_ov002_02244fe4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x000013ea
_LIT3: .word data_ov002_022cf1ac
_LIT4: .word data_ov002_022cf1a4
_LIT5: .word 0x000013c3
_LIT6: .word 0x0000186b
