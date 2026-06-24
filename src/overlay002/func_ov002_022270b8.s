; func_ov002_022270b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021b39c4
        .extern func_ov002_021b3ecc
        .extern func_ov002_021bc6c4
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_0227adb8
        .global func_ov002_022270b8
        .arm
func_ov002_022270b8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r1, #0x0
    mov r7, r0
    bl func_ov002_0223de94
    ldr r2, _LIT0
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r5, r1, asr #0x8
    ldr r3, [r2, #0x5a8]
    and r4, r0, #0xff
    sub r1, r3, #0x7d
    cmp r1, #0x3
    and r5, r5, #0xff
    addls pc, pc, r1, lsl #0x2
    b .L_1d0
    b .L_170
    b .L_138
    b .L_7c
    b .L_50
.L_50:
    mov r1, #0x0
    mov r0, r7
    mov r2, r1
    bl func_ov002_0223df38
    cmp r0, #0x0
    mov r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    strh r0, [r7, #0xa]
    bl func_ov002_021e2b3c
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_7c:
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_130
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021b39c4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    and r4, r0, #0xff
    mov r2, r1, asr #0x8
    mov r0, r7
    mov r1, r6
    and r5, r2, #0xff
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    beq .L_130
    ldr r2, _LIT1
    mov r0, r4
    mov r1, r5
    bl func_ov002_021b3ecc
    ldr r1, _LIT0
    str r0, [r1, #0x5b0]
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc6c4
    ldr r3, _LIT2
    ldr r1, _LIT3
    and r2, r4, #0x1
    mla r1, r2, r1, r3
    add r3, r1, #0x30
    mov r1, #0x14
    mla r1, r5, r1, r3
    ldr r2, _LIT0
    mov r3, #0x0
    str r0, [r2, #0x5ac]
    mov r0, r4
    mov r2, #0x1
    bl func_ov002_0227adb8
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_130:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_138:
    ldr r0, [r2, #0x5b0]
    cmp r0, #0x0
    beq .L_168
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r7, #0x2]
    ldr r1, [r2, #0x5ac]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x2
    bl func_ov002_021d59cc
.L_168:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_170:
    ldr r0, _LIT3
    ldr r1, _LIT2
    and r2, r4, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r5, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_1c4
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    orr r0, r0, #0x1b
    mov r0, r0, lsl #0x10
    mov r1, r5, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
.L_1c4:
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1d0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000fb6
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00000868
