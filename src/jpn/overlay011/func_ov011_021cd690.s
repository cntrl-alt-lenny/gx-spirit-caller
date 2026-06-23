; func_ov011_021cd690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d314c
        .extern data_ov011_021d31ca
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_ov011_021cd63c
        .global func_ov011_021cd690
        .arm
func_ov011_021cd690:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x98
    ldr r7, _LIT0
    ldr r5, _LIT1
    add r2, sp, #0x18
    mov r4, #0x3e
.L_18:
    ldrb r3, [r5]
    ldrb r1, [r5, #0x1]
    add r5, r5, #0x2
    strb r3, [r2]
    strb r1, [r2, #0x1]
    add r2, r2, #0x2
    subs r4, r4, #0x1
    bne .L_18
    ldr r3, _LIT2
    ldrb r1, [r5]
    ldr r3, [r3, #0x2a4]
    add r6, sp, #0x18
    mov r3, r3, lsl #0x13
    mov r8, r3, lsr #0x1c
    sub r5, r8, #0x1
    mov r3, #0x19
    mla r6, r5, r3, r6
    sub r4, r0, #0x1
    add r3, r4, r4, lsl #0x2
    cmp r8, r0
    add r0, r6, r3
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0x4]
    strb r1, [r2]
    addeq sp, sp, #0x98
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [r7, #0x270]
    ldr r2, [sp, #0x4]
    orr r3, r1, #0x20000
    add r0, r7, #0x214
    mov r1, #0x20
    str r2, [r7, #0x218]
    str r2, [r7, #0x22c]
    str r3, [r7, #0x270]
    .word 0xebff97b3
    ldr r0, [sp, #0x8]
    ldrsb r3, [r0]
    cmp r3, #0x0
    beq .L_1c0
.L_b8:
    ldr r0, [sp, #0x4]
    mov r8, #0x1
    cmp r0, #0x0
    movgt sl, #0x1
    movle sl, #0x0
    cmp r3, #0x0
    bge .L_134
    mov r1, #0x0
    sub r0, r1, #0x1
    mov r2, #0x18
    sub r0, r0, r3
    mul r5, r0, r2
    ldr r4, _LIT3
    sub r2, r2, #0x19
    ldrsh r3, [r4, r5]
    add r4, r4, r5
    cmp r3, r2
    beq .L_118
    mvn r2, #0x0
.L_104:
    add r1, r1, #0x1
    mov r3, r1, lsl #0x2
    ldrsh r3, [r4, r3]
    cmp r3, r2
    bne .L_104
.L_118:
    cmp sl, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    sub r1, r1, #0x1
    mvn r8, #0x0
    sub sl, r1, r2
    b .L_138
.L_134:
    sub r0, r3, #0x1
.L_138:
    ldr r2, _LIT3
    mov r1, #0x18
    mla r9, r0, r1, r2
    mov r6, #0x0
    mov r5, #0x1000
    add fp, sp, #0xc
    mvn r4, #0x0
    b .L_188
.L_158:
    add r0, r9, sl, lsl #0x2
    ldrsh r0, [r0, #0x2]
    mov r1, r1, lsl #0xc
    str r1, [sp, #0xc]
    str r5, [sp]
    mov r1, r0, lsl #0xc
    ldr r0, [r7, #0x214]
    str r1, [sp, #0x10]
    str r6, [sp, #0x14]
    ldmia fp, {r1, r2, r3}
    .word 0xebff9794
    add sl, sl, r8
.L_188:
    mov r0, sl, lsl #0x2
    ldrsh r1, [r9, r0]
    cmp r1, r4
    beq .L_1a0
    cmp sl, #0x0
    bge .L_158
.L_1a0:
    ldr r0, [sp, #0x8]
    ldrsb r3, [r0, #0x1]!
    str r0, [sp, #0x8]
    ldr r0, [sp, #0x4]
    cmp r3, #0x0
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    bne .L_b8
.L_1c0:
    ldr r0, [r7, #0x214]
    mov r1, #0x1
    .word 0xebff978a
    bl func_ov011_021cd63c
    str r0, [r7, #0x22c]
    add sp, sp, #0x98
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov011_021d3f5c
_LIT1: .word data_ov011_021d314c
_LIT2: .word data_ov011_021d3f20
_LIT3: .word data_ov011_021d31ca
