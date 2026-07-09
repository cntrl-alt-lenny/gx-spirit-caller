; func_ov002_02298988 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202f994
        .extern func_ov002_021b9dec
        .extern func_ov002_021bce38
        .extern func_ov002_021bdbb4
        .extern func_ov002_022579d0
        .global func_ov002_02298988
        .arm
func_ov002_02298988:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    mov r6, r0
    mov r5, r1
    bl func_ov002_021bdbb4
    cmp r0, #0x0
    beq .L_2fc
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r2, _LIT0
    mov r4, r0
    cmp r4, r2
    bgt .L_e4
    bge .L_1ec
    ldr r1, _LIT1
    cmp r4, r1
    bgt .L_90
    bge .L_2c8
    ldr r0, _LIT2
    cmp r4, r0
    bgt .L_6c
    bge .L_1ec
    sub r0, r0, #0x8c
    cmp r4, r0
    beq .L_1ec
    b .L_2ec
.L_6c:
    sub r0, r1, #0x55
    cmp r4, r0
    bgt .L_80
    beq .L_1ec
    b .L_2ec
.L_80:
    sub r0, r1, #0x2d
    cmp r4, r0
    beq .L_1ec
    b .L_2ec
.L_90:
    add r0, r1, #0x37
    cmp r4, r0
    bgt .L_c0
    bge .L_1ec
    add r0, r1, #0x5
    cmp r4, r0
    bgt .L_b4
    beq .L_1c4
    b .L_2ec
.L_b4:
    cmp r4, #0x1200
    beq .L_1ec
    b .L_2ec
.L_c0:
    sub r0, r2, #0x68
    cmp r4, r0
    bgt .L_d4
    beq .L_1ec
    b .L_2ec
.L_d4:
    add r0, r1, #0x1c0
    cmp r4, r0
    beq .L_1ec
    b .L_2ec
.L_e4:
    ldr r1, _LIT3
    cmp r4, r1
    bgt .L_164
    bge .L_1ec
    ldr r0, _LIT4
    cmp r4, r0
    bgt .L_140
    bge .L_1ec
    sub r0, r0, #0x190
    sub r0, r4, r0
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_2ec
    b .L_1ec
    b .L_1ec
    b .L_2ec
    b .L_2ec
    b .L_1ec
    b .L_2ec
    b .L_2ec
    b .L_2ec
    b .L_2ec
    b .L_1b8
.L_140:
    ldr r0, _LIT5
    cmp r4, r0
    bgt .L_154
    beq .L_1b8
    b .L_2ec
.L_154:
    add r0, r0, #0xa0
    cmp r4, r0
    beq .L_1ec
    b .L_2ec
.L_164:
    add r0, r1, #0xda
    cmp r4, r0
    bgt .L_198
    bge .L_1ec
    add r0, r1, #0x8e
    cmp r4, r0
    bgt .L_188
    beq .L_1ec
    b .L_2ec
.L_188:
    add r0, r1, #0x97
    cmp r4, r0
    beq .L_1ec
    b .L_2ec
.L_198:
    add r0, r1, #0xdb
    cmp r4, r0
    bgt .L_1ac
    beq .L_1ec
    b .L_2ec
.L_1ac:
    ldr r0, _LIT6
    cmp r4, r0
    bne .L_2ec
.L_1b8:
    add sp, sp, #0x18
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1c4:
    ldr r0, _LIT7
    and r1, r6, #0x1
    mul r2, r1, r0
    ldr r0, _LIT8
    add sp, sp, #0x18
    ldr r0, [r0, r2]
    cmp r0, #0x5
    movls r0, #0x1
    movhi r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1ec:
    mov r1, r6, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr r8, _LIT9
    mov lr, #0x14
    ldr r1, _LIT7
    and r7, r6, #0x1
    mla r8, r7, r1, r8
    mov r1, r5, lsl #0x10
    mul lr, r5, lr
    add r5, r8, #0x30
    mov r1, r1, lsr #0x10
    add r0, sp, #0x0
    mov ip, #0x0
    str ip, [r0]
    ldrh r3, [sp, #0x2]
    and r2, r2, #0x1
    ldr r5, [r5, lr]
    bic r3, r3, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x2]
    mov r2, r5, lsl #0x2
    ldrh r7, [sp, #0x2]
    mov r3, r2, lsr #0x18
    mov r1, r1, lsl #0x1b
    bic r2, r7, #0x3e
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x2]
    ldrh r2, [sp, #0x2]
    mov r5, r5, lsl #0x12
    mov r1, r3, lsl #0x1
    add r1, r1, r5, lsr #0x1f
    str ip, [r0, #0x4]
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    bic r1, r2, #0x3000
    orr r2, r1, #0x1000
    ldrh r5, [sp, #0x4]
    ldr r1, _LIT10
    mov r3, r3, lsl #0x17
    and r1, r5, r1
    orr r3, r1, r3, lsr #0x11
    rsb r1, r6, #0x1
    str ip, [r0, #0x8]
    str ip, [r0, #0xc]
    str ip, [r0, #0x10]
    str ip, [r0, #0x14]
    strh r4, [sp]
    strh r3, [sp, #0x4]
    strh r2, [sp, #0x2]
    bl func_ov002_022579d0
    cmp r0, #0x0
    bne .L_2ec
    add sp, sp, #0x18
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2c8:
    mov r2, #0x1
    mov r3, r2
    rsb r0, r6, #0x1
    mov r1, #0x0
    bl func_ov002_021bce38
    cmp r0, #0x2
    addlt sp, sp, #0x18
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
.L_2ec:
    mov r0, r4
    bl func_0202f994
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_2fc:
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00001413
_LIT1: .word 0x000011f0
_LIT2: .word 0x00001086
_LIT3: .word 0x000017e0
_LIT4: .word 0x000016ba
_LIT5: .word 0x000016fa
_LIT6: .word 0x000019f1
_LIT7: .word 0x00000868
_LIT8: .word data_ov002_022cf098
_LIT9: .word data_ov002_022cf08c
_LIT10: .word 0xffff803f
