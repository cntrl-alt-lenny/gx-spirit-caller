; func_ov002_02216a80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_022012e4
        .extern func_ov002_0226ac6c
        .extern func_ov002_0227da20
        .global func_ov002_02216a80
        .arm
func_ov002_02216a80:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldrh r3, [r0, #0x2]
    ldrh r2, [r0, #0x4]
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsl #0x1d
    movs r2, r2, lsr #0x1f
    mov r4, r3, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT0
    ldr r3, [r2, #0x5a8]
    sub r3, r3, #0x7d
    cmp r3, #0x3
    addls pc, pc, r3, lsl #0x2
    b .L_154
    b .L_128
    b .L_110
    b .L_5c
    b .L_4c
.L_4c:
    mov r0, #0x3
    str r0, [r2, #0x5ac]
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_5c:
    ldr r2, [r2, #0x5ac]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_022012e4
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT1
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_100
    ldr r0, _LIT2
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r7, _LIT3
    mov r4, #0x0
    ldr r0, _LIT4
    str r4, [r7, #0xd44]
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_108
    ldr r0, _LIT5
    mov r8, #0x1
    add r6, r0, r1
    add r5, r6, #0x120
    mov r9, r4
.L_c8:
    ldr r0, [r5]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r2, r9
    mov r0, r0, lsr #0x13
    bl func_ov002_0227da20
    cmp r0, #0x0
    strne r8, [r7, #0xd44]
    ldr r0, [r6, #0xc]
    add r4, r4, #0x1
    cmp r4, r0
    add r5, r5, #0x4
    bcc .L_c8
    b .L_108
.L_100:
    mov r0, #0x28
    bl func_ov002_021ae3a4
.L_108:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_110:
    ldr r0, _LIT3
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    movne r0, #0x7d
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_128:
    mov r1, #0x1
    mov r0, r4
    mov r2, r1
    mov r3, #0x0
    bl func_ov002_0226ac6c
    ldr r1, _LIT0
    mov r0, #0x7f
    ldr r2, [r1, #0x5ac]
    sub r2, r2, #0x1
    str r2, [r1, #0x5ac]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_154:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022d008c
_LIT4: .word data_ov002_022cf098
_LIT5: .word data_ov002_022cf08c
