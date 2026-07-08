; func_ov002_0229f30c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ca2cc
        .extern func_0208deac
        .extern func_0208dfb8
        .extern func_ov002_0229f1e8
        .global func_ov002_0229f30c
        .arm
func_ov002_0229f30c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r1, [r5]
    cmp r1, #0x0
    ldrne r1, [r5, #0x8]
    cmpne r1, #0xf
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, pc}
    add r1, sp, #0x4
    add r2, sp, #0x0
    bl func_ov002_0229f1e8
    ldr r0, [r5]
    cmp r0, #0x0
    ldrne r0, [r5, #0x18]
    cmpne r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_64
    ldr r0, [r5, #0x18]
    tst r0, #0x4
    moveq r3, #0x1
    movne r3, #0x0
    b .L_68
.L_64:
    ldr r3, [r5, #0x4]
.L_68:
    ldr r1, [sp, #0x4]
    ldr r2, [r5, #0x14]
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    ldr r1, [sp]
    mov r0, r0, asr #0x3
    mul r1, r0, r1
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, asr #0x3
    mul r1, r3, r0
    ldr r4, [r5, #0x8]
    ldr r3, _LIT0
    mov r0, r2, asr #0x5
    add r0, r2, r0, lsr #0x1a
    ldr r2, [r3, r4, lsl #0x3]
    add r0, r1, r0, asr #0x6
    cmp r4, #0x10
    orr r4, r0, r2, lsl #0xc
    blt .L_c0
    bl func_0208dfb8
    b .L_c4
.L_c0:
    bl func_0208deac
.L_c4:
    ldr r3, [sp]
    mov r2, #0x0
    mov r1, r3, asr #0x2
    add r1, r3, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    cmp r1, #0x0
    addle sp, sp, #0x8
    ldmleia sp!, {r4, r5, r6, pc}
    mov r1, r2
.L_e8:
    ldr r6, [sp, #0x4]
    mov r3, r1
    mov ip, r6, asr #0x2
    add ip, r6, ip, lsr #0x1d
    mov r6, ip, asr #0x3
    cmp r6, #0x0
    ble .L_13c
.L_104:
    ldr lr, [r5, #0x10]
    ldr ip, [r5, #0xc]
    add r6, lr, r2
    add ip, ip, r3
    mov lr, ip, lsl #0x1
    add ip, r0, r6, lsl #0x6
    strh r4, [lr, ip]
    ldr lr, [sp, #0x4]
    add r3, r3, #0x1
    mov ip, lr, asr #0x2
    add ip, lr, ip, lsr #0x1d
    cmp r3, ip, asr #0x3
    add r4, r4, #0x1
    blt .L_104
.L_13c:
    ldr ip, [sp]
    add r2, r2, #0x1
    mov r3, ip, asr #0x2
    add r3, ip, r3, lsr #0x1d
    cmp r2, r3, asr #0x3
    blt .L_e8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ca2cc
