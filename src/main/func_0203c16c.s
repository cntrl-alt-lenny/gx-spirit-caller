; func_0203c16c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219b36c
        .extern data_0219d070
        .extern data_0219d07c
        .extern func_0203af44
        .extern func_0203b774
        .extern func_0207cfdc
        .extern func_0207cff4
        .extern func_0207d12c
        .extern func_02091a8c
        .extern func_02092748
        .extern func_020927b8
        .extern func_02094504
        .extern func_02094550
        .global func_0203c16c
        .arm
func_0203c16c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
.L_4:
    mov r0, #0x0
    bl func_02091a8c
    mov fp, #0x0
.L_10:
    ldr r0, _LIT0
    bl func_020927b8
    bl OS_DisableIrq
    mov r4, r0
    ldr r0, _LIT1
    mov r1, #0x0
    bl func_0207cfdc
    movs r8, r0
    beq .L_50
    ldr r3, [r8, #0x8]
    ldr r0, _LIT1
    ldrsh r2, [r3, #0xba]
    mov r1, r8
    sub r2, r2, #0x1
    strh r2, [r3, #0xba]
    bl func_0207cff4
.L_50:
    mov r0, r4
    bl OS_RestoreIrq
    cmp r8, #0x0
    bne .L_6c
    ldr r0, _LIT0
    bl func_02092748
    b .L_4
.L_6c:
    ldr r6, [r8, #0x8]
    ldrh r0, [r6, #0xb0]
    tst r0, #0x8000
    beq .L_23c
    tst r0, #0x4
    ldr r5, [r6, #0x78]
    beq .L_b0
    ldrsb r0, [r6, #0xc0]
    sub r0, r0, #0x1
    strb r0, [r6, #0xc0]
    ldrsb r0, [r6, #0xc0]
    cmp r0, #0x0
    bgt .L_b0
    ldrh r1, [r6, #0xb0]
    orr r0, r1, #0x1
    orr r0, r0, #0x800
    strh r0, [r6, #0xb0]
.L_b0:
    ldrh r1, [r6, #0xb0]
    tst r1, #0x4000
    bne .L_cc
    ldrsh r0, [r5, #0x24]
    cmp r0, #0x3
    orrge r0, r1, #0x4000
    strgeh r0, [r6, #0xb0]
.L_cc:
    ldr r2, [r6, #0x78]
    ldrsh r1, [r2, #0x4]
    cmp r1, #0x8
    ldrgesh r0, [r5, #0x24]
    cmpge r0, #0x8
    blt .L_f8
    and r0, r1, #0x7
    strh r0, [r2, #0x4]
    ldrsh r0, [r5, #0x24]
    and r0, r0, #0x7
    strh r0, [r5, #0x24]
.L_f8:
    ldrh r0, [r6, #0xb0]
    ldr r7, [r8, #0x14]
    tst r0, #0x4000
    beq .L_110
    tst r0, #0x5
    beq .L_158
.L_110:
    mov r4, #0x0
.L_114:
    mov r0, fp
    add r1, r8, r4, lsl #0x2
    ldr r1, [r1, #0xc]
    mov r2, r7
    bl func_02094504
    add r4, r4, #0x1
    ldr r0, [r6, #0x74]
    ldrb r0, [r0, #0x1a]
    cmp r4, r0
    blt .L_114
    ldrh r0, [r6, #0xb0]
    tst r0, #0x4000
    bne .L_23c
    ldrsh r0, [r5, #0x24]
    add r0, r0, #0x1
    strh r0, [r5, #0x24]
    b .L_23c
.L_158:
    ldrsh r1, [r5, #0x24]
    ldr r0, [r6, #0x78]
    ldrsh r0, [r0, #0x4]
    sub r0, r0, r1
    cmp r0, #0x0
    bgt .L_198
    add r0, r5, #0x20
    bl func_0203af44
    ldr r1, [r5, #0x20]
    mov r0, r6
    str r1, [r5, #0x38]
    str r1, [r5, #0x2c]
    add r1, r8, #0xc
    mov r2, #0x1
    bl func_0203b774
    b .L_218
.L_198:
    mov sl, #0x0
    mov r4, r1, lsl #0x1d
    mov r9, sl
.L_1a4:
    ldr r0, [r6, #0x80]
    add r1, r8, sl, lsl #0x2
    add r0, r0, r9
    add r0, r0, r4, lsr #0x14
    ldr r1, [r1, #0xc]
    mov r2, r7
    bl func_02094550
    add r9, r9, #0x1000
    add sl, sl, #0x1
    ldrh r0, [r6, #0xb8]
    cmp sl, r0
    blt .L_1a4
    ldrh r0, [r6, #0xb6]
    ldr r1, [r5, #0x20]
    ldr r3, [r6, #0x70]
    add r1, r1, r0
    cmp r1, r3
    bcc .L_208
    ldr r0, [r6, #0x74]
    sub r1, r1, r3
    ldr r2, [r0, #0x20]
    ldrh r0, [r6, #0xb0]
    add r1, r2, r1
    tst r0, #0x2
    movne r1, r3
.L_208:
    str r1, [r5, #0x20]
    ldrsh r0, [r5, #0x24]
    add r0, r0, #0x1
    strh r0, [r5, #0x24]
.L_218:
    ldr r1, [r5, #0x20]
    ldr r0, [r6, #0x70]
    cmp r1, r0
    bcc .L_23c
    ldrh r0, [r6, #0xb0]
    orr r0, r0, #0x4
    strh r0, [r6, #0xb0]
    mov r0, #0x4
    strb r0, [r6, #0xc0]
.L_23c:
    bl OS_DisableIrq
    mov r4, r0
    ldr r0, _LIT2
    mov r1, r8
    bl func_0207d12c
    mov r0, r4
    bl OS_RestoreIrq
    ldr r0, _LIT0
    bl func_02092748
    b .L_10
_LIT0: .word data_0219b36c
_LIT1: .word data_0219d070
_LIT2: .word data_0219d07c
