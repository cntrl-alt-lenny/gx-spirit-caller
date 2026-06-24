; func_ov002_021cd79c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a8
        .extern func_020310d8
        .extern func_ov002_021b0c04
        .extern func_ov002_021b1f20
        .extern func_ov002_021b212c
        .extern func_ov002_021b3e5c
        .extern func_ov002_021b9ecc
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021cd79c
        .arm
func_ov002_021cd79c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r4, [r1, #0x2]
    ldrsh r5, [r1, #0x4]
    tst r0, #0x8000
    movne r9, #0x1
    moveq r9, #0x0
    ldrh r6, [r1, #0x6]
    mov r0, r9
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r1, _LIT0
    ldr r1, [r1, #0x810]
    cmp r1, #0x0
    beq .L_50
    cmp r1, #0x1
    beq .L_1f0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_50:
    cmp r0, #0x0
    beq .L_1dc
    cmp r6, #0x0
    bne .L_d0
    bl func_020310d8
    ldr r7, _LIT1
    ldr r1, _LIT2
    and r3, r9, #0x1
    mov r2, #0x14
    mla r7, r3, r1, r7
    mul r1, r4, r2
    ldr r2, [r7, r1]
    add r3, r2, r5
    cmp r3, r0
    movge r3, r0
    ldr r0, _LIT3
    cmp r3, #0x0
    movle r3, #0x0
    ldr r0, [r0, #0x4]
    str r3, [r7, r1]
    cmp r9, r0
    bne .L_1b8
    cmp r5, #0x0
    bge .L_c0
    sub r1, r2, r3
    mov r0, #0x2f
    bl func_ov002_021b0c04
    b .L_1b8
.L_c0:
    sub r1, r3, r2
    mov r0, #0x2e
    bl func_ov002_021b0c04
    b .L_1b8
.L_d0:
    cmp r6, #0x1
    bne .L_108
    ldr r3, _LIT1
    mov r1, #0x14
    ldr r0, _LIT2
    and r2, r9, #0x1
    mla r3, r2, r0, r3
    mul r1, r4, r1
    ldr r0, [r3, r1]
    add r0, r0, r5
    cmp r0, #0x0
    movle r0, #0x0
    str r0, [r3, r1]
    b .L_1b8
.L_108:
    cmp r5, #0x0
    ble .L_14c
    cmp r5, #0x0
    mov sl, #0x0
    ble .L_1b8
    mov r8, sl
    mov r7, #0x3
.L_124:
    mov r0, r9
    mov r1, r4
    mov r2, r7
    mov r3, r6
    str r8, [sp]
    bl func_ov002_021b1f20
    add sl, sl, #0x1
    cmp sl, r5
    blt .L_124
    b .L_1b8
.L_14c:
    mov r0, r9
    mov r1, r4
    mov r2, r6
    mov r3, #0x3
    bl func_ov002_021b3e5c
    mov sl, r0
    rsb r0, r5, #0x0
    cmp sl, r0
    movge sl, r0
    cmp sl, #0x0
    mov r8, #0x0
    ble .L_1b8
    ldr r2, _LIT4
    ldr r0, _LIT2
    and r1, r9, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mla r7, r4, r0, r2
    mov r0, r6, lsl #0x10
    mov fp, r0, lsr #0x10
.L_19c:
    ldrh r0, [r7, #0x3a]
    mov r1, fp
    mov r2, #0x0
    bl func_ov002_021b212c
    add r8, r8, #0x1
    cmp r8, sl
    blt .L_19c
.L_1b8:
    and r1, r9, #0xff
    and r0, r4, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r2, r5
    mov r3, r6
    mov r1, r0, lsr #0x10
    mov r0, #0x25
    bl func_ov002_0229ade0
.L_1dc:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f0:
    mov r0, #0x25
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    mov r0, #0x24
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cd73c
_LIT4: .word data_ov002_022cf16c
