; func_ov002_0223fdb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a8
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223fd74
        .extern func_ov002_022577dc
        .extern func_ov002_0225935c
        .extern func_ov002_022593a8
        .extern func_ov002_022593f4
        .extern func_ov002_0229cd88
        .extern func_ov002_0229cf10
        .global func_ov002_0223fdb4
        .arm
func_ov002_0223fdb4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x100
    mov r5, r0
    ldrh r1, [r5]
    ldr r0, _LIT0
    mov r4, #0x2
    cmp r1, r0
    bne .L_50
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT1
    ldr r4, _LIT2
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsl #0x1a
    and ip, r3, #0x1
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r0, ip, r0, r4
    ldr r4, [r2, r0]
.L_50:
    ldr r0, _LIT3
    ldr r0, [r0, #0x5b8]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_254
    b .L_78
    b .L_ac
    b .L_1e0
    b .L_1b0
    b .L_1e0
.L_78:
    mov r0, r5
    bl func_ov002_022577dc
    cmp r0, r4
    addlt sp, sp, #0x100
    movlt r0, #0x1
    ldmltia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT3
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_ac:
    ldr r3, _LIT4
    cmp r1, r3
    bgt .L_e0
    bge .L_148
    ldr r0, _LIT5
    cmp r1, r0
    bgt .L_d0
    beq .L_110
    b .L_168
.L_d0:
    add r0, r0, #0xa9
    cmp r1, r0
    beq .L_120
    b .L_168
.L_e0:
    ldr r0, _LIT0
    cmp r1, r0
    bgt .L_100
    bge .L_120
    sub r0, r0, #0xae
    cmp r1, r0
    beq .L_134
    b .L_168
.L_100:
    ldr r0, _LIT6
    cmp r1, r0
    beq .L_15c
    b .L_168
.L_110:
    add r0, sp, #0x0
    mov r1, #0x69
    bl func_ov002_0229cd88
    b .L_168
.L_120:
    add r0, sp, #0x0
    mov r2, r4
    mov r1, #0x71
    bl func_ov002_0229cf10
    b .L_168
.L_134:
    add r0, sp, #0x0
    mov r2, r4
    rsb r1, r3, #0x1900
    bl func_ov002_0229cf10
    b .L_168
.L_148:
    add r0, sp, #0x0
    mov r2, r4
    mov r1, #0x6d
    bl func_ov002_0229cf10
    b .L_168
.L_15c:
    ldr r1, _LIT7
    add r0, sp, #0x0
    bl func_ov002_0229cd88
.L_168:
    ldrh r0, [r5, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    ldr r2, _LIT8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT3
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1b0:
    ldrh r0, [r5, #0x2]
    ldr r2, _LIT8
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022593a8
    ldr r1, _LIT3
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1e0:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_238
    ldr r1, _LIT9
    mov r0, r5
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldrh r0, [r5, #0x6]
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    addle sp, sp, #0x100
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT3
    mov r1, #0x3
    str r1, [r0, #0x5b8]
    add sp, sp, #0x100
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_238:
    ldr r1, _LIT3
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_254:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000018f8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
_LIT3: .word data_ov002_022ce288
_LIT4: .word 0x000017ea
_LIT5: .word 0x00001147
_LIT6: .word 0x00001a35
_LIT7: .word 0x00000119
_LIT8: .word func_ov002_0223fd74
_LIT9: .word data_ov002_022d016c
