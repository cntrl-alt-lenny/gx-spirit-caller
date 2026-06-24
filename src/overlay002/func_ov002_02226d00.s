; func_ov002_02226d00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021b99b4
        .extern func_ov002_021ca698
        .extern func_ov002_021d8128
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0225368c
        .extern func_ov002_0226b094
        .extern func_ov002_0226b194
        .global func_ov002_02226d00
        .arm
func_ov002_02226d00:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1, #0x5a8]
    ldr r5, [r2, #0xcec]
    ldr r2, [r1, #0x5ac]
    mov r4, r0
    cmp r3, #0x64
    eor r5, r5, r2
    bgt .L_34
    cmp r3, #0x64
    beq .L_150
    b .L_170
.L_34:
    sub r0, r3, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_170
    b .L_dc
    b .L_b0
    b .L_60
    b .L_54
.L_54:
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2b3c
.L_60:
    ldrh r0, [r4, #0x2]
    rsb r1, r5, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca698
    cmp r0, #0x0
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r4]
    mov r0, r5
    mov r2, #0x0
    bl func_ov002_0225368c
    cmp r0, #0x0
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r4]
    mov r0, r5
    bl func_ov002_0226b094
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_b0:
    ldr r0, _LIT2
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    moveq r0, #0x64
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r1, [r4]
    mov r0, r5
    mov r2, #0x3
    bl func_ov002_0226b194
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_dc:
    ldr r4, _LIT2
    mov r8, #0x0
    ldrh r0, [r4, #0xb0]
    cmp r0, #0x0
    ble .L_148
    rsb r9, r5, #0x1
    ldr r7, _LIT3
    ldr r0, _LIT4
    and r1, r9, #0x1
    mla r0, r1, r0, r7
    add r0, r0, #0x18
    add r6, r0, #0x400
    mov r5, #0x1
.L_110:
    add r0, r7, r8, lsl #0x1
    add r0, r0, #0x1d00
    ldrh r1, [r0, #0xb2]
    mov r0, r9
    bl func_ov002_021b99b4
    mov r1, r0
    mov r0, r9
    mov r2, r5
    add r1, r6, r1, lsl #0x2
    bl func_ov002_021d8128
    ldrh r0, [r4, #0xb0]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_110
.L_148:
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_150:
    add r0, r2, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021e2c5c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_170:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022d0e6c
_LIT3: .word data_ov002_022cf16c
_LIT4: .word 0x00000868
