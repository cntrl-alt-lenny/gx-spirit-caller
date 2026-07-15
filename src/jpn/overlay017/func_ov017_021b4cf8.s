; func_ov017_021b4cf8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov000_021b1c4c
        .extern data_ov017_021b806c
        .extern data_ov017_021b8076
        .extern data_ov017_021b8470
        .extern func_ov005_021aadc8
        .extern func_ov017_021b2be4
        .extern func_ov017_021b3f5c
        .extern func_ov017_021b3f90
        .extern func_ov017_021b43d4
        .global func_ov017_021b4cf8
        .arm
func_ov017_021b4cf8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r9, r0
    ldr r0, [r9, #0x14]
    ldr r4, _LIT0
    cmp r0, #0x5
    ble .L_c0
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    cmp r0, #0x2
    mov r0, #0xf
    str r0, [sp]
    mov r2, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, _LIT1
    moveq r2, #0x1
    mov r1, #0x2
    mov r3, #0xe8
    bl func_ov017_021b3f5c
    ldr r0, [r4, #0x18]
    mov r1, #0x1
    cmp r0, #0x3
    mov r0, #0x6c
    str r0, [sp]
    mov r2, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, _LIT1
    moveq r2, #0x1
    mov r1, #0x3
    mov r3, #0xe8
    bl func_ov017_021b3f5c
    ldr r0, [r4, #0x18]
    mov r5, #0x0
    cmp r0, #0x1
    mov r0, r4
    moveq r5, #0x1
    bl func_ov005_021aadc8
    str r0, [sp]
    mov r4, #0x1
    str r4, [sp, #0x4]
    ldr r0, _LIT1
    mov r2, r5
    mov r1, #0x4
    mov r3, #0xe8
    str r4, [sp, #0x8]
    bl func_ov017_021b3f5c
.L_c0:
    ldr r0, [r9, #0x64]
    ldr r1, [r9, #0x10]
    cmp r0, #0x0
    mov r0, #0x18
    mul r0, r1, r0
    add r0, r0, #0xc
    mvn r2, #0x0
    str r0, [sp]
    mov r4, #0x1
    str r4, [sp, #0x4]
    ldr r0, _LIT1
    movne r2, #0x1
    mov r1, #0x0
    mov r3, #0x85
    str r4, [sp, #0x8]
    bl func_ov017_021b3f5c
    mov r8, #0x0
    mov r7, #0x11
    mov r6, #0xc0
    mov fp, #0x40
    ldr r5, _LIT2
    ldr r4, _LIT3
    b .L_260
.L_11c:
    ldr r1, [r9, #0xc]
    ldr r0, [r9, #0x10]
    add r1, r1, #0x1
    cmp r8, r0
    add r0, r1, r8
    smull r2, r1, r4, r0
    add r1, r0, r1
    mov r2, r0, lsr #0x1f
    add r1, r2, r1, asr #0x2
    mov r2, #0x7
    smull r1, r3, r2, r1
    sub r1, r0, r1
    mov r0, #0xe
    mul r0, r1, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov sl, #0x1
    ldr r0, [r9, #0x4]
    moveq sl, #0x2
    cmp r0, #0x2
    bne .L_240
    str r6, [sp]
    mov r0, #0x18
    mov r1, r7
    mov r3, sl
    bl func_ov017_021b43d4
    ldr r0, [r5, #0x4]
    mov r3, sl
    str fp, [sp]
    ldr r2, [r9, #0xc]
    mov r0, r0, lsl #0x1d
    add r2, r2, #0x1
    add sl, r2, r8
    smull r2, ip, r4, sl
    add ip, sl, ip
    mov r2, sl, lsr #0x1f
    add ip, r2, ip, asr #0x2
    mov r2, #0x7
    smull ip, lr, r2, ip
    movs r0, r0, lsr #0x1d
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x3
    sub ip, sl, ip
    mov r2, #0xc
    mul r2, ip, r2
    add r2, r2, #0xea
    add r2, r2, #0x200
    mov r2, r2, lsl #0x10
    add r0, r0, #0xb8
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_ov017_021b43d4
    ldr r0, [r9, #0xc]
    add r0, r9, r0
    add r0, r8, r0
    ldrb r0, [r0, #0x20]
    add r0, r5, r0, lsl #0x3
    add r0, r0, #0xa00
    ldrh r0, [r0, #0x7a]
    cmp r0, #0x0
    beq .L_258
    str r7, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, _LIT1
    mov r1, #0x1c
    mov r2, #0x0
    mov r3, #0x9
    bl func_ov017_021b3f5c
    b .L_258
.L_240:
    mov r0, #0xe0
    str r0, [sp]
    mov r3, sl
    mov r0, #0x4
    mov r1, r7
    bl func_ov017_021b43d4
.L_258:
    add r7, r7, #0x18
    add r8, r8, #0x1
.L_260:
    ldr r0, [r9, #0x14]
    cmp r0, #0x5
    movgt r0, #0x5
    cmp r8, r0
    blt .L_11c
    ldr r0, _LIT2
    ldr r5, _LIT4
    ldr r0, [r0, #0x4]
    mov r6, #0x0
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    moveq r7, #0x14
    mov r0, r5
    movne r7, #0x13
    bl func_ov017_021b2be4
    cmp r0, #0x0
    movne r0, r6
    strne r0, [r9, #0x68]
    movne r6, #0x1
    mvn r4, #0x0
    str r4, [sp]
    ldr r0, _LIT1
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp, #0x4]
    bl func_ov017_021b3f90
    ldr r0, _LIT5
    bl func_ov017_021b2be4
    cmp r0, #0x0
    movne r0, #0x1
    strne r0, [r9, #0x68]
    ldr r0, [r9, #0x64]
    cmp r0, #0x0
    beq .L_314
    mvn r2, #0x0
    str r2, [sp]
    str r2, [sp, #0x4]
    ldr r1, [r9, #0x68]
    ldr r3, _LIT4
    mov r0, #0xa
    mla r3, r1, r0, r3
    ldr r0, _LIT1
    mov r1, #0xb
    bl func_ov017_021b3f90
.L_314:
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov000_021b1c4c
_LIT1: .word data_ov017_021b8470
_LIT2: .word data_02104e6c
_LIT3: .word 0x92492493
_LIT4: .word data_ov017_021b806c
_LIT5: .word data_ov017_021b8076
