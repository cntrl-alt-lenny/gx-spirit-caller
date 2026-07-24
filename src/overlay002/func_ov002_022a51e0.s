; func_ov002_022a51e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbf84
        .extern data_ov002_022cbfa0
        .extern data_ov002_022cbfbc
        .extern data_ov002_022cbfd4
        .extern data_ov002_022d0fb4
        .extern data_ov002_022d0fd4
        .extern data_ov002_022d1af8
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02037208
        .extern func_0208b0f0
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208cf44
        .extern func_0208cf58
        .extern func_0208da2c
        .extern func_0208de4c
        .extern func_0208de94
        .extern func_0208e0a0
        .extern func_0208e120
        .extern func_0208e318
        .extern G2x_SetBGyAffine_
        .extern func_02094504
        .extern func_ov002_022b303c
        .global func_ov002_022a51e0
        .arm
func_ov002_022a51e0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x40
    mov r4, r0
    ldr r0, [r4]
    mov r6, #0x0
    mov r7, r6
    mov r5, r6
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_84
    b .L_84
    b .L_84
    b .L_84
    b .L_84
    b .L_84
    b .L_84
    b .L_50
    b .L_5c
    b .L_68
    b .L_78
.L_50:
    ldr r5, _LIT0
    mov r6, #0x30
    b .L_84
.L_5c:
    ldr r5, _LIT1
    mov r6, #0x28
    b .L_84
.L_68:
    ldr r5, _LIT2
    mov r7, #0x1
    mov r6, #0x28
    b .L_84
.L_78:
    ldr r5, _LIT3
    mov r7, #0x1
    mov r6, #0x28
.L_84:
    ldr r0, [r4, #0x8]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_5a0
    b .L_ac
    b .L_e0
    b .L_354
    b .L_480
    b .L_4b4
    b .L_52c
.L_ac:
    ldr r0, [r4, #0xc]
    add r0, r0, #0x1
    cmp r0, #0x4
    addlt sp, sp, #0x40
    str r0, [r4, #0xc]
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    add sp, sp, #0x40
    str r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_e0:
    bl func_0208cf58
    bl func_0208cf44
    mov r0, #0x60
    bl func_0208da2c
    mov r0, #0x1
    mov r1, #0x5
    mov r2, r0
    bl func_0208c8cc
    ldr r1, _LIT4
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x4700
    strh r0, [r1]
    bl func_0208e120
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    bl func_0208de94
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    cmp r7, #0x0
    beq .L_1a4
    mov r0, #0x5
    bl func_0208c8b0
    ldr r1, _LIT5
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x5000
    strh r0, [r1]
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    bl func_0208de4c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
.L_1a4:
    add r0, sp, #0x8
    bl func_0201d47c
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x1c]
    mov r3, #0x0
    str r0, [sp, #0x8]
    bic r0, r1, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x1c]
    ldrh r1, [sp, #0x1c]
    mov r2, #0x40
    add r0, sp, #0x8
    bic r1, r1, #0x10
    str r3, [sp, #0x10]
    str r2, [sp, #0x14]
    strh r1, [sp, #0x1c]
    strh r3, [sp, #0x18]
    bl func_0201e5b8
    cmp r7, #0x0
    beq .L_23c
    ldrh r2, [sp, #0x1c]
    mov r1, #0x200
    ldr r0, [sp, #0x20]
    bic r2, r2, #0xf
    orr r2, r2, #0x7
    strh r2, [sp, #0x1c]
    ldrh r3, [sp, #0x1c]
    bic r2, r0, #0x1c000
    orr r2, r2, #0x1c000
    orr r3, r3, #0x10
    add r0, sp, #0x8
    strh r3, [sp, #0x1c]
    str r2, [sp, #0x20]
    strh r1, [sp, #0x18]
    bl func_0201e5b8
.L_23c:
    ldr r0, [sp, #0x8]
    bl Task_Invoke
    mov r1, #0xc00
    add r0, sp, #0x30
    mov r2, r1
    bl func_0208b0f0
    add r0, r6, r6, lsr #0x1f
    mov r5, r0, asr #0x1
    rsb r2, r5, #0x60
    mov r1, #0x0
    str r1, [sp]
    rsb r6, r2, #0x0
    ldr r0, _LIT6
    add r1, sp, #0x30
    mov r2, #0x80
    mov r3, r5
    str r6, [sp, #0x4]
    bl G2x_SetBGyAffine_
    ldr r0, _LIT7
    mov r1, #0x0
    strh r1, [r0]
    cmp r7, #0x0
    beq .L_2c0
    ldr r0, _LIT8
    str r1, [sp]
    add r1, sp, #0x30
    mov r3, r5
    mov r2, #0x80
    str r6, [sp, #0x4]
    bl G2x_SetBGyAffine_
    ldr r0, _LIT9
    mov r1, #0x0
    strh r1, [r0]
.L_2c0:
    ldr r0, [r4, #0x8]
    mov r2, #0x0
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    str r2, [r4, #0xc]
    ldr r0, [r4]
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_5a0
    b .L_5a0
    b .L_5a0
    b .L_5a0
    b .L_5a0
    b .L_5a0
    b .L_5a0
    b .L_324
    b .L_30c
    b .L_33c
    b .L_33c
.L_30c:
    mov r0, #0x8b
    sub r1, r0, #0x8c
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_324:
    mov r0, #0x8d
    sub r1, r0, #0x8e
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_33c:
    mov r0, #0x8c
    sub r1, r0, #0x8d
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_354:
    ldr r1, [r4, #0xc]
    add r0, sp, #0x30
    add r5, r1, #0x1
    rsb r8, r5, #0x10
    mov r2, r8, lsl #0xb
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0x1000
    mov r2, r1
    str r5, [r4, #0xc]
    bl func_0208b0f0
    add r0, r6, r6, lsr #0x1f
    mov r9, r0, asr #0x1
    rsb r6, r9, #0x60
    mov r2, #0x0
    str r2, [sp]
    rsb r6, r6, #0x0
    ldr r0, _LIT6
    add r1, sp, #0x30
    mov r3, r9
    mov r2, #0x80
    str r6, [sp, #0x4]
    bl G2x_SetBGyAffine_
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x3f
    mov r3, r5
    str r8, [sp]
    bl func_0208e318
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    cmp r7, #0x0
    str r0, [r2]
    beq .L_454
    mov r0, #0x0
    str r0, [sp]
    ldr r0, _LIT8
    add r1, sp, #0x30
    mov r3, r9
    mov r2, #0x80
    str r6, [sp, #0x4]
    bl G2x_SetBGyAffine_
    ldr r0, _LIT9
    mov r3, r5
    mov r1, #0x4
    mov r2, #0x3f
    str r8, [sp]
    bl func_0208e318
    ldr r2, _LIT10
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_454:
    ldr r0, [r4, #0xc]
    cmp r0, #0x10
    addlt sp, sp, #0x40
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    add sp, sp, #0x40
    str r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_480:
    ldr r0, [r4, #0xc]
    add r0, r0, #0x1
    cmp r0, #0x64
    addlt sp, sp, #0x40
    str r0, [r4, #0xc]
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    add sp, sp, #0x40
    str r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_4b4:
    ldr r1, [r4, #0xc]
    ldr r0, _LIT7
    add r1, r1, #0x1
    rsb r5, r1, #0x10
    str r1, [r4, #0xc]
    rsb r6, r5, #0x10
    mov r3, r5
    mov r1, #0x4
    mov r2, #0x3f
    str r6, [sp]
    bl func_0208e318
    cmp r7, #0x0
    beq .L_500
    ldr r0, _LIT9
    mov r3, r5
    mov r1, #0x4
    mov r2, #0x3f
    str r6, [sp]
    bl func_0208e318
.L_500:
    ldr r0, [r4, #0xc]
    cmp r0, #0x10
    addlt sp, sp, #0x40
    ldmltia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r1, [r4, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    add sp, sp, #0x40
    str r0, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_52c:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r5, #0x0
    strh r5, [r2, #0x50]
    cmp r7, #0x0
    beq .L_58c
    add r2, r2, #0x1000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x4
    orr r1, r1, r0, lsl #0x8
    ldr r0, _LIT9
    str r1, [r2]
    strh r5, [r0]
.L_58c:
    ldr r0, _LIT11
    mov r1, #0x1
    bl func_ov002_022b303c
    mov r0, #0x0
    str r0, [r4]
.L_5a0:
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cbf84
_LIT1: .word data_ov002_022cbfa0
_LIT2: .word data_ov002_022cbfbc
_LIT3: .word data_ov002_022cbfd4
_LIT4: .word 0x0400000c
_LIT5: .word 0x0400100c
_LIT6: .word data_ov002_022d0fb4
_LIT7: .word 0x04000050
_LIT8: .word data_ov002_022d0fd4
_LIT9: .word 0x04001050
_LIT10: .word 0x04001000
_LIT11: .word data_ov002_022d1af8
