; func_ov002_021fab74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021b004c
        .extern func_ov002_021d8128
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .global func_ov002_021fab74
        .arm
func_ov002_021fab74:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r0
    ldrh r2, [r5]
    ldr r0, _LIT0
    mov r1, #0x2
    cmp r2, r0
    bne .L_4c
    ldrh r1, [r5, #0x2]
    ldr r0, _LIT1
    ldr r4, _LIT2
    mov r3, r1, lsl #0x1f
    mov r3, r3, lsr #0x1f
    mov r1, r1, lsl #0x1a
    and r6, r3, #0x1
    mov r3, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r3, r1
    mla r0, r6, r0, r4
    ldr r1, [r1, r0]
.L_4c:
    ldr r0, _LIT3
    ldr r0, [r0, #0x5b4]
    cmp r0, #0x0
    beq .L_70
    cmp r0, #0x1
    beq .L_9c
    cmp r0, #0x2
    beq .L_d4
    b .L_12c
.L_70:
    ldrh r0, [r5, #0x2]
    mov r1, #0x56
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldr r1, _LIT3
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_9c:
    ldrh r0, [r5, #0x2]
    cmp r1, #0x20
    movge r1, #0x20
    mov r0, r0, lsl #0x1f
    add r1, r1, #0x6
    mov r3, #0x0
    mov r0, r0, lsr #0x1f
    bl func_ov002_021af9d0
    ldr r1, _LIT3
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_d4:
    bl func_ov002_021e2b3c
    ldr r6, _LIT4
    mov r4, #0x0
    ldr r0, [r6, #0xd44]
    cmp r0, #0x0
    bls .L_120
    mov r7, r4
.L_f0:
    add r0, r4, #0x1
    bl func_ov002_021b004c
    ldrh r3, [r5, #0x2]
    mov r1, r0
    mov r2, r7
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d8128
    ldr r0, [r6, #0xd44]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_f0
.L_120:
    bl func_ov002_021e2c5c
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_12c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000018f8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
_LIT3: .word data_ov002_022ce288
_LIT4: .word data_ov002_022d016c
