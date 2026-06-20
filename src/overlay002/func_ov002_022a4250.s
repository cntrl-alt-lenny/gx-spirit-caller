; func_ov002_022a4250 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov002_022d0fb4
        .extern data_ov002_022d0fc4
        .extern data_ov002_022d0fd4
        .extern data_ov002_022d0fe4
        .extern data_ov002_022d1af8
        .extern func_02037208
        .extern func_0208b0f0
        .extern func_0208b0fc
        .extern func_0208b108
        .extern func_0208e2f4
        .extern func_0208e318
        .extern func_0208e334
        .extern func_020b3870
        .extern func_ov002_022b3020
        .global func_ov002_022a4250
        .arm
func_ov002_022a4250:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r5, r0
    ldr r0, [r5, #0x8]
    mov r1, #0x1000
    add r3, r0, #0x1
    add r0, sp, #0x8
    mov r2, r1
    str r3, [r5, #0x8]
    bl func_0208b0f0
    ldr r0, [r5, #0x8]
    cmp r0, #0xd
    bne .L_48
    mov r0, #0x88
    sub r1, r0, #0x89
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_48:
    ldr r4, [r5, #0x8]
    cmp r4, #0x1
    bgt .L_80
    mov r2, #0x0
    str r2, [sp]
    mov r4, #0xc0
    ldr r0, _LIT0
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x1c
    str r4, [sp, #0x4]
    bl func_0208e334
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_80:
    cmp r4, #0x10
    bge .L_17c
    mov r1, r4, lsl #0x10
    mov r0, r1, asr #0x3
    add r0, r1, r0, lsr #0x1c
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, _LIT1
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x8
    bl func_0208b0fc
    rsb r1, r4, #0x20
    mov r0, #0x10000
    bl func_020b3870
    mov r2, r0
    add r0, sp, #0x8
    mov r3, r2
    mov r1, r0
    bl func_0208b108
    mov r1, #0x0
    str r1, [sp]
    sub r1, r1, #0x44
    str r1, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x1c
    bl func_0208e334
    mov r0, #0x0
    str r0, [sp]
    sub r0, r0, #0x44
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x1c
    bl func_0208e334
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_17c:
    cmp r4, #0x28
    bge .L_294
    mov r2, #0x0
    ldr r0, _LIT2
    add r1, sp, #0x8
    str r2, [sp]
    sub r5, r2, #0x44
    mov r2, #0x80
    mov r3, #0x1c
    str r5, [sp, #0x4]
    bl func_0208e334
    mov r2, #0x0
    ldr r0, _LIT3
    add r1, sp, #0x8
    str r2, [sp]
    sub r5, r2, #0xc0
    mov r2, #0x80
    mov r3, #0x1c
    str r5, [sp, #0x4]
    bl func_0208e334
    mov r3, #0x4000000
    ldr r1, [r3]
    ldr r0, [r3]
    and r1, r1, #0x1f00
    mov r5, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r5, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r3]
    mov r2, #0x0
    ldr r0, _LIT4
    add r1, sp, #0x8
    str r2, [sp]
    sub r5, r2, #0xc0
    mov r2, #0x80
    mov r3, #0x1c
    str r5, [sp, #0x4]
    bl func_0208e334
    mov r0, #0x0
    str r0, [sp]
    sub r0, r0, #0x44
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x1c
    bl func_0208e334
    ldr r3, _LIT5
    sub r0, r4, #0x10
    add r0, r0, r0, lsr #0x1f
    ldr r2, [r3]
    mov r0, r0, asr #0x1
    sub r4, r0, #0x10
    and r2, r2, #0x1f00
    ldr r0, [r3]
    mov r5, r2, lsr #0x8
    bic r2, r0, #0x1f00
    orr r0, r5, #0x8
    orr r0, r2, r0, lsl #0x8
    str r0, [r3]
    mov r1, #0x33
    sub r0, r3, #0xfb0
    mov r2, r4
    bl func_0208e2f4
    ldr r0, _LIT6
    mov r2, r4
    mov r1, #0x33
    bl func_0208e2f4
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_294:
    cmp r4, #0x38
    bgt .L_500
    sub r0, r4, #0x28
    mov r4, r0, lsl #0x1
    mov r1, #0x28
    mov r0, #0x60
    mul r6, r4, r0
    mul r3, r4, r1
    mov r2, #0x0
    str r2, [sp]
    rsb r4, r4, #0x20
    mov r0, #0x44
    mul r5, r4, r0
    sub r0, r1, #0xe4
    mla ip, r4, r0, r3
    mov r0, #0x144
    mla r0, r4, r0, r6
    add r4, r3, r5
    mov r1, r4, asr #0x4
    mov r3, ip, asr #0x4
    add r6, r6, r5
    add r4, r4, r1, lsr #0x1b
    add r3, ip, r3, lsr #0x1b
    mov r5, r6, asr #0x4
    add r6, r6, r5, lsr #0x1b
    mov ip, r4, asr #0x5
    mov r1, r0, asr #0x4
    add r4, r0, r1, lsr #0x1b
    rsb ip, ip, #0x0
    mov r5, r3, asr #0x5
    ldr r0, _LIT2
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x1c
    str ip, [sp, #0x4]
    mov r4, r4, asr #0x5
    mov r6, r6, asr #0x5
    bl func_0208e334
    add lr, r5, #0x100
    cmp lr, #0xc0
    mov r2, #0x0
    add r1, sp, #0x8
    bge .L_374
    ldr ip, _LIT7
    ldr r0, _LIT3
    ldrh r3, [ip]
    and r3, r3, #0x43
    orr r3, r3, #0x4700
    strh r3, [ip]
    str r2, [sp]
    rsb ip, lr, #0x0
    mov r2, #0x80
    mov r3, #0x1c
    str ip, [sp, #0x4]
    bl func_0208e334
    b .L_3d0
.L_374:
    cmp r4, #0xc0
    bge .L_3b4
    ldr ip, _LIT7
    ldr r0, _LIT3
    ldrh r3, [ip]
    and r3, r3, #0x43
    orr r3, r3, #0x304
    orr r3, r3, #0x4c00
    strh r3, [ip]
    str r2, [sp]
    rsb ip, r4, #0x0
    mov r2, #0x80
    mov r3, #0x1c
    str ip, [sp, #0x4]
    bl func_0208e334
    b .L_3d0
.L_3b4:
    ldr r0, _LIT3
    str r2, [sp]
    sub ip, r2, #0xc0
    mov r2, #0x80
    mov r3, #0x1c
    str ip, [sp, #0x4]
    bl func_0208e334
.L_3d0:
    sub ip, r4, #0x100
    mvn r0, #0x37
    cmp ip, r0
    mov r2, #0x0
    add r1, sp, #0x8
    blt .L_420
    ldr r4, _LIT8
    ldr r0, _LIT4
    ldrh r3, [r4]
    and r3, r3, #0x43
    orr r3, r3, #0x318
    orr r3, r3, #0x5c00
    strh r3, [r4]
    str r2, [sp]
    rsb r4, ip, #0x0
    mov r2, #0x80
    mov r3, #0x1c
    str r4, [sp, #0x4]
    bl func_0208e334
    b .L_47c
.L_420:
    cmp r5, r0
    blt .L_460
    ldr r4, _LIT8
    ldr r0, _LIT4
    ldrh r3, [r4]
    and r3, r3, #0x43
    orr r3, r3, #0xe10
    orr r3, r3, #0x5000
    strh r3, [r4]
    str r2, [sp]
    rsb r4, r5, #0x0
    mov r2, #0x80
    mov r3, #0x1c
    str r4, [sp, #0x4]
    bl func_0208e334
    b .L_47c
.L_460:
    ldr r0, _LIT4
    str r2, [sp]
    sub r4, r2, #0xc0
    mov r2, #0x80
    mov r3, #0x1c
    str r4, [sp, #0x4]
    bl func_0208e334
.L_47c:
    mov r2, #0x0
    str r2, [sp]
    rsb r4, r6, #0x0
    ldr r0, _LIT0
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x1c
    str r4, [sp, #0x4]
    bl func_0208e334
    mov r0, #0x4000000
    ldr r2, [r0]
    ldr r1, [r0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r3, #0xc
    orr r1, r2, r1, lsl #0x8
    str r1, [r0]
    add r3, r0, #0x1000
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r4, #0xc
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    mov r2, #0x0
    ldr r1, _LIT6
    strh r2, [r0, #0x50]
    strh r2, [r1]
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_500:
    cmp r4, #0x58
    bge .L_540
    sub r0, r4, #0x38
    rsbs r4, r0, #0x10
    addmi sp, sp, #0x18
    ldmmiia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT9
    mov r2, r4
    mov r1, #0xc
    bl func_0208e2f4
    ldr r0, _LIT6
    mov r2, r4
    mov r1, #0xc
    bl func_0208e2f4
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_540:
    cmp r4, #0x68
    bge .L_588
    sub r4, r4, #0x58
    rsb r5, r4, #0x10
    ldr r0, _LIT9
    mov r3, r5
    mov r1, #0xc
    mov r2, #0x3f
    str r4, [sp]
    bl func_0208e318
    ldr r0, _LIT6
    mov r3, r5
    mov r1, #0xc
    mov r2, #0x3f
    str r4, [sp]
    bl func_0208e318
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_588:
    mov r0, #0x4000000
    ldr r2, [r0]
    ldr r1, [r0]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r3, #0xc
    orr r1, r2, r1, lsl #0x8
    str r1, [r0]
    add r3, r0, #0x1000
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r4, #0xc
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    mov r2, #0x0
    ldr r1, _LIT6
    strh r2, [r0, #0x50]
    strh r2, [r1]
    ldr r0, _LIT10
    mov r1, #0x1
    str r2, [r5]
    bl func_ov002_022b3020
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022d0fe4
_LIT1: .word data_020bef80
_LIT2: .word data_ov002_022d0fb4
_LIT3: .word data_ov002_022d0fc4
_LIT4: .word data_ov002_022d0fd4
_LIT5: .word 0x04001000
_LIT6: .word 0x04001050
_LIT7: .word 0x0400000e
_LIT8: .word 0x0400100c
_LIT9: .word 0x04000050
_LIT10: .word data_ov002_022d1af8
