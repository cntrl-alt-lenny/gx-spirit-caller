; func_ov002_02222804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf098
        .extern data_ov002_022d008c
        .extern func_ov002_021d46ac
        .extern func_ov002_021d70f0
        .extern func_ov002_021de944
        .extern func_ov002_021df3e8
        .extern func_ov002_021e0f5c
        .extern func_ov002_021e277c
        .global func_ov002_02222804
        .arm
func_ov002_02222804:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7b
    cmp r1, #0x5
    addls pc, pc, r1, lsl #0x2
    b .L_1a0
    b .L_170
    b .L_148
    b .L_108
    b .L_cc
    b .L_74
    b .L_38
.L_38:
    mvn r1, #0x0
    bl func_ov002_021de944
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x15
    bne .L_6c
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_021df3e8
    mov r0, r4
    mov r1, #0x1
    bl func_ov002_021df3e8
.L_6c:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_74:
    mov r6, #0x0
    ldr r7, _LIT1
    mov r4, r6
    mov r5, #0x8000
    mov r9, #0x1
    mov r8, r6
.L_8c:
    ldr r0, [r7, #0xcec]
    mov r1, r9
    teq r0, r6
    movne r0, r5
    moveq r0, r4
    orr r0, r0, #0x5a
    mov r0, r0, lsl #0x10
    mov r2, r8
    mov r3, r8
    mov r0, r0, lsr #0x10
    bl func_ov002_021d46ac
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_8c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_cc:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT3
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7d
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021d70f0
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_108:
    ldr r0, _LIT1
    ldr r1, _LIT2
    ldr r0, [r0, #0xcec]
    ldr r2, _LIT3
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x7c
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, #0x0
    mov r2, #0x1
    bl func_ov002_021d70f0
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_148:
    ldr r4, _LIT1
    mov r5, #0x0
.L_150:
    ldr r0, [r4, #0xcec]
    eor r0, r0, r5
    bl func_ov002_021e277c
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_150
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_170:
    ldr r4, _LIT1
    mov r6, #0x0
    mov r5, #0x5
.L_17c:
    ldr r0, [r4, #0xcec]
    mov r1, r5
    eor r0, r0, r6
    bl func_ov002_021e0f5c
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_17c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1a0:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf098
