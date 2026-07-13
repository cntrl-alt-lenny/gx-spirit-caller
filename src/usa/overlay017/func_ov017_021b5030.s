; func_ov017_021b5030 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_02104e6c
        .extern data_021058ec
        .extern data_ov000_021b1c4c
        .extern data_ov017_021b806c
        .extern data_ov017_021b8076
        .extern data_ov017_021b8794
        .extern func_0202c06c
        .extern func_020371b8
        .extern func_02091554
        .extern func_020b377c
        .extern func_ov005_021aa3f0
        .extern func_ov017_021b2c5c
        .extern func_ov017_021b4234
        .extern func_ov017_021b5ce8
        .extern func_ov017_021b5e24
        .extern func_ov017_021b601c
        .extern func_ov017_021b6164
        .extern func_ov017_021b62ec
        .extern func_ov017_021b636c
        .extern func_ov017_021b65a8
        .global func_ov017_021b5030
        .arm
func_ov017_021b5030:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x324
    sub sp, sp, #0x400
    mov r4, r0
    ldr r1, [r4]
    ldr r5, _LIT0
    cmp r1, #0x0
    beq .L_36c
    cmp r1, #0x1
    beq .L_468
    cmp r1, #0x2
    beq .L_ea0
    b .L_fb4
.L_36c:
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_fb4
    b .L_38c
    b .L_38c
    b .L_3ec
    b .L_45c
.L_38c:
    ldr r1, [r4, #0x8]
    ldr r0, _LIT1
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    mov r1, #0x80
    str r1, [r0, #0x1e4]
    ldr r1, [r4, #0x8]
    ldr r0, _LIT2
    rsb r1, r1, #0x0
    ldr r2, _LIT3
    and r1, r0, r1, lsl #0x4
    str r1, [r2]
    ldr r1, [r4, #0x8]
    rsb r1, r1, #0x0
    and r0, r0, r1, lsl #0x4
    str r0, [r2, #0x4]
    ldr r0, [r4, #0x8]
    cmp r0, #0xa
    blt .L_fb4
    mov r0, #0x1
    str r0, [r4]
    mov r0, #0x0
    str r0, [r4, #0x8]
    b .L_fb4
.L_3ec:
    ldr r1, [r4, #0x8]
    mvn r5, #0x7f
    add r2, r1, #0x1
    ldr r1, _LIT1
    str r2, [r4, #0x8]
    str r5, [r1, #0x1e4]
    mov r2, #0x80
    str r2, [r1, #0x1f4]
    ldr r2, [r4, #0x8]
    mov r1, r5, lsr #0x17
    rsb r2, r2, #0x0
    ldr r3, _LIT3
    and r1, r1, r2, lsl #0x4
    str r1, [r3]
    ldr r2, [r4, #0x8]
    mov r1, r5, lsr #0x17
    rsb r2, r2, #0x0
    and r1, r1, r2, lsl #0x4
    str r1, [r3, #0x4]
    ldr r1, [r4, #0x8]
    cmp r1, #0xa
    blt .L_fb4
    mov r1, #0x1
    str r1, [r4]
    mov r1, #0x0
    str r1, [r4, #0x8]
    bl func_ov017_021b5e24
    b .L_fb4
.L_45c:
    mov r0, #0x1
    str r0, [r4]
    b .L_fb4
.L_468:
    ldr r1, _LIT4
    ldrh r2, [r1, #0x52]
    cmp r2, #0x0
    beq .L_7f8
    ldr r2, [r4, #0x64]
    cmp r2, #0x0
    beq .L_4e8
    ldrh r1, [r1, #0x54]
    tst r1, #0x1
    beq .L_498
    bl func_ov017_021b5ce8
    b .L_fb4
.L_498:
    tst r1, #0x2
    beq .L_4bc
    mov r0, #0x42
    mov r2, #0x0
    sub r1, r0, #0x43
    mov r3, #0x1
    str r2, [r4, #0x64]
    bl func_020371b8
    b .L_fb4
.L_4bc:
    tst r1, #0x30
    beq .L_fb4
    ldr r1, [r4, #0x68]
    mov r0, #0x38
    rsb r5, r1, #0x1
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    str r5, [r4, #0x68]
    bl func_020371b8
    b .L_fb4
.L_4e8:
    ldrh r2, [r1, #0x56]
    tst r2, #0x80
    beq .L_65c
    ldr r2, [r4, #0x14]
    ldr r1, [r4, #0x10]
    cmp r2, #0x5
    movgt r0, #0x5
    movle r0, r2
    sub r0, r0, #0x1
    cmp r1, r0
    bge .L_528
    add r1, r1, #0x1
    mov r0, r4
    str r1, [r4, #0x10]
    bl func_ov017_021b636c
    b .L_fb4
.L_528:
    ldr r0, [r4, #0xc]
    add r1, r0, #0x5
    cmp r1, r2
    bge .L_fb4
    add r5, r0, #0x1
    str r5, [r4, #0xc]
    ldr r1, [r4, #0x14]
    add r0, r5, #0x5
    bl func_020b377c
    add r8, r5, #0x6
    ldr r3, _LIT5
    ldr r7, [r4, #0x4]
    smull r2, r5, r3, r8
    mov r0, r8, lsr #0x1f
    add r5, r8, r5
    add r5, r0, r5, asr #0x2
    mov r3, #0x7
    smull r0, r2, r3, r5
    sub r5, r8, r0
    mov r6, r1
    cmp r7, #0x2
    mov r0, r4
    beq .L_5b8
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r5, #0x1
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x700
    str r5, [sp]
    bl func_ov017_021b4234
    b .L_648
.L_5b8:
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r7, #0x0
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x600
    str r7, [sp]
    bl func_ov017_021b4234
    ldr r0, _LIT6
    bl func_0202c06c
    add r1, r4, r6
    ldrb r2, [r1, #0x20]
    mov r1, r0
    add r0, sp, #0x4
    sub r2, r2, #0x1
    mov r3, r2, lsl #0x3
    ldr r2, _LIT7
    ldrh r2, [r2, r3]
    add r2, r2, #0x1
    bl func_02091554
    mov r0, r7
    str r0, [sp]
    mov r0, #0xc
    mul r0, r5, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r1, sp, #0x24
    add r2, sp, #0x4
    mov r3, #0x200
    bl func_ov017_021b4234
.L_648:
    mov r0, r4
    bl func_ov017_021b65a8
    mov r0, r4
    bl func_ov017_021b636c
    b .L_fb4
.L_65c:
    tst r2, #0x40
    beq .L_7b4
    ldr r1, [r4, #0x10]
    cmp r1, #0x0
    ble .L_680
    sub r1, r1, #0x1
    str r1, [r4, #0x10]
    bl func_ov017_021b636c
    b .L_fb4
.L_680:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    ble .L_fb4
    sub r5, r0, #0x1
    str r5, [r4, #0xc]
    subs r0, r5, #0x1
    bmi .L_7a0
    ldr r1, [r4, #0x14]
    bl func_020b377c
    add r8, r5, #0x7
    ldr r3, _LIT5
    ldr r7, [r4, #0x4]
    smull r2, r5, r3, r8
    mov r0, r8, lsr #0x1f
    add r5, r8, r5
    add r5, r0, r5, asr #0x2
    mov r3, #0x7
    smull r0, r2, r3, r5
    sub r5, r8, r0
    mov r6, r1
    cmp r7, #0x2
    mov r0, r4
    beq .L_710
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r5, #0x1
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x700
    str r5, [sp]
    bl func_ov017_021b4234
    b .L_7a0
.L_710:
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r7, #0x0
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x600
    str r7, [sp]
    bl func_ov017_021b4234
    ldr r0, _LIT6
    bl func_0202c06c
    add r1, r4, r6
    ldrb r2, [r1, #0x20]
    mov r1, r0
    add r0, sp, #0x4
    sub r2, r2, #0x1
    mov r3, r2, lsl #0x3
    ldr r2, _LIT7
    ldrh r2, [r2, r3]
    add r2, r2, #0x1
    bl func_02091554
    mov r0, r7
    str r0, [sp]
    mov r0, #0xc
    mul r0, r5, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r1, sp, #0x24
    add r2, sp, #0x4
    mov r3, #0x200
    bl func_ov017_021b4234
.L_7a0:
    mov r0, r4
    bl func_ov017_021b65a8
    mov r0, r4
    bl func_ov017_021b636c
    b .L_fb4
.L_7b4:
    ldrh r1, [r1, #0x54]
    tst r1, #0x2
    beq .L_7d0
    mov r1, #0x1
    str r1, [r4, #0x68]
    bl func_ov017_021b5ce8
    b .L_fb4
.L_7d0:
    tst r1, #0x1
    beq .L_fb4
    mov r3, #0x1
    mov r0, #0x3a
    str r3, [r4, #0x64]
    mov r2, #0x0
    sub r1, r0, #0x3b
    str r2, [r4, #0x68]
    bl func_020371b8
    b .L_fb4
.L_7f8:
    ldr r0, [r4, #0x14]
    cmp r0, #0x5
    ble .L_e30
    mov r0, r5
    bl func_ov005_021aa3f0
    ldr r0, [r5, #0x4]
    str r0, [r4, #0xc]
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    bne .L_84c
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    beq .L_e30
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x18]
    bl func_ov017_021b636c
    add sp, sp, #0x324
    add sp, sp, #0x400
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_84c:
    str r0, [r4, #0x18]
    ldr r0, [r5, #0x18]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_e30
    b .L_e30
    b .L_d00
    b .L_878
    b .L_ac0
    b .L_98c
    b .L_bd0
.L_878:
    ldr r5, [r4, #0xc]
    subs r0, r5, #0x1
    bmi .L_e30
    ldr r1, [r4, #0x14]
    bl func_020b377c
    add r8, r5, #0x7
    ldr r3, _LIT5
    ldr r7, [r4, #0x4]
    smull r2, r5, r3, r8
    mov r0, r8, lsr #0x1f
    add r5, r8, r5
    add r5, r0, r5, asr #0x2
    mov r3, #0x7
    smull r0, r2, r3, r5
    sub r5, r8, r0
    mov r6, r1
    cmp r7, #0x2
    mov r0, r4
    beq .L_8f8
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r5, #0x1
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x700
    str r5, [sp]
    bl func_ov017_021b4234
    b .L_e30
.L_8f8:
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r7, #0x0
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x600
    str r7, [sp]
    bl func_ov017_021b4234
    ldr r0, _LIT6
    bl func_0202c06c
    add r1, r4, r6
    ldrb r2, [r1, #0x20]
    mov r1, r0
    add r0, sp, #0x4
    sub r2, r2, #0x1
    mov r3, r2, lsl #0x3
    ldr r2, _LIT7
    ldrh r2, [r2, r3]
    add r2, r2, #0x1
    bl func_02091554
    mov r0, r7
    str r0, [sp]
    mov r0, #0xc
    mul r0, r5, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r1, sp, #0x24
    add r2, sp, #0x4
    mov r3, #0x200
    bl func_ov017_021b4234
    b .L_e30
.L_98c:
    mov r8, #0x0
    mov fp, r8
    add r6, sp, #0x24
    add r5, sp, #0x4
    mov r7, #0x1
.L_9a0:
    ldr r9, [r4, #0xc]
    sub r0, r9, #0x1
    adds r0, r0, r8
    bmi .L_ab0
    ldr r1, [r4, #0x14]
    bl func_020b377c
    add r0, r9, r8
    ldr r2, _LIT5
    add r0, r0, #0x7
    smull r3, r9, r2, r0
    add r9, r0, r9
    mov r2, r0, lsr #0x1f
    add r9, r2, r9, asr #0x2
    mov r2, #0x7
    smull r3, r9, r2, r9
    sub r9, r0, r3
    ldr r0, [r4, #0x4]
    mov sl, r1
    cmp r0, #0x2
    mov r0, r4
    beq .L_a24
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r9, r1
    add r1, r1, #0x288
    mov r1, r1, lsl #0x10
    mov r2, r0
    mov r0, r1, lsr #0x10
    mov r1, r6
    mov r3, #0x700
    str r7, [sp]
    bl func_ov017_021b4234
    b .L_ab0
.L_a24:
    bl func_ov017_021b6164
    mov r2, r0
    mov r0, #0xe
    mul r0, r9, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r3, #0x600
    str fp, [sp]
    bl func_ov017_021b4234
    ldr r0, _LIT6
    bl func_0202c06c
    add r1, r4, sl
    ldrb r3, [r1, #0x20]
    ldr r2, _LIT8
    mov r1, r0
    add r2, r2, r3, lsl #0x3
    add r2, r2, #0xa00
    ldrh r2, [r2, #0x78]
    mov r0, r5
    add r2, r2, #0x1
    bl func_02091554
    mov r0, #0xc
    mul r0, r9, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r1, #0x0
    str r1, [sp]
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r2, r5
    mov r3, #0x200
    bl func_ov017_021b4234
.L_ab0:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_9a0
    b .L_e30
.L_ac0:
    ldr r5, [r4, #0xc]
    ldr r1, [r4, #0x14]
    add r0, r5, #0x5
    bl func_020b377c
    add r8, r5, #0x6
    ldr r3, _LIT5
    ldr r7, [r4, #0x4]
    smull r2, r5, r3, r8
    mov r0, r8, lsr #0x1f
    add r5, r8, r5
    add r5, r0, r5, asr #0x2
    mov r3, #0x7
    smull r0, r2, r3, r5
    sub r5, r8, r0
    mov r6, r1
    cmp r7, #0x2
    mov r0, r4
    beq .L_b3c
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r5, #0x1
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x700
    str r5, [sp]
    bl func_ov017_021b4234
    b .L_e30
.L_b3c:
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r5, r1
    add r1, r1, #0x288
    mov r3, r1, lsl #0x10
    mov r7, #0x0
    mov r2, r0
    mov r0, r3, lsr #0x10
    add r1, sp, #0x24
    mov r3, #0x600
    str r7, [sp]
    bl func_ov017_021b4234
    ldr r0, _LIT6
    bl func_0202c06c
    add r1, r4, r6
    ldrb r2, [r1, #0x20]
    mov r1, r0
    add r0, sp, #0x4
    sub r2, r2, #0x1
    mov r3, r2, lsl #0x3
    ldr r2, _LIT7
    ldrh r2, [r2, r3]
    add r2, r2, #0x1
    bl func_02091554
    mov r0, r7
    str r0, [sp]
    mov r0, #0xc
    mul r0, r5, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    add r1, sp, #0x24
    add r2, sp, #0x4
    mov r3, #0x200
    bl func_ov017_021b4234
    b .L_e30
.L_bd0:
    mov r8, #0x0
    mov fp, r8
    add r6, sp, #0x24
    add r5, sp, #0x4
    mov r7, #0x1
.L_be4:
    ldr r9, [r4, #0xc]
    ldr r1, [r4, #0x14]
    add r0, r9, #0x1
    add r0, r0, r8
    bl func_020b377c
    add r0, r9, r8
    ldr r2, _LIT5
    add r0, r0, #0x2
    smull r3, r9, r2, r0
    add r9, r0, r9
    mov r2, r0, lsr #0x1f
    add r9, r2, r9, asr #0x2
    mov r2, #0x7
    smull r3, r9, r2, r9
    sub r9, r0, r3
    ldr r0, [r4, #0x4]
    mov sl, r1
    cmp r0, #0x2
    mov r0, r4
    beq .L_c64
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r9, r1
    add r1, r1, #0x288
    mov r1, r1, lsl #0x10
    mov r2, r0
    mov r0, r1, lsr #0x10
    mov r1, r6
    mov r3, #0x700
    str r7, [sp]
    bl func_ov017_021b4234
    b .L_cf0
.L_c64:
    bl func_ov017_021b6164
    mov r2, r0
    mov r0, #0xe
    mul r0, r9, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r3, #0x600
    str fp, [sp]
    bl func_ov017_021b4234
    ldr r0, _LIT6
    bl func_0202c06c
    add r1, r4, sl
    ldrb r3, [r1, #0x20]
    ldr r2, _LIT8
    mov r1, r0
    add r2, r2, r3, lsl #0x3
    add r2, r2, #0xa00
    ldrh r2, [r2, #0x78]
    mov r0, r5
    add r2, r2, #0x1
    bl func_02091554
    mov r0, #0xc
    mul r0, r9, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r1, #0x0
    str r1, [sp]
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r2, r5
    mov r3, #0x200
    bl func_ov017_021b4234
.L_cf0:
    add r8, r8, #0x1
    cmp r8, #0x5
    blt .L_be4
    b .L_e30
.L_d00:
    mov r8, #0x0
    mov fp, r8
    add r6, sp, #0x24
    add r5, sp, #0x4
    mov r7, #0x1
.L_d14:
    ldr r9, [r4, #0xc]
    sub r0, r9, #0x1
    adds r0, r0, r8
    bmi .L_e24
    ldr r1, [r4, #0x14]
    bl func_020b377c
    add r0, r9, r8
    ldr r2, _LIT5
    add r0, r0, #0x7
    smull r3, r9, r2, r0
    add r9, r0, r9
    mov r2, r0, lsr #0x1f
    add r9, r2, r9, asr #0x2
    mov r2, #0x7
    smull r3, r9, r2, r9
    sub r9, r0, r3
    ldr r0, [r4, #0x4]
    mov sl, r1
    cmp r0, #0x2
    mov r0, r4
    beq .L_d98
    bl func_ov017_021b6164
    mov r1, #0xe
    mul r1, r9, r1
    add r1, r1, #0x288
    mov r1, r1, lsl #0x10
    mov r2, r0
    mov r0, r1, lsr #0x10
    mov r1, r6
    mov r3, #0x700
    str r7, [sp]
    bl func_ov017_021b4234
    b .L_e24
.L_d98:
    bl func_ov017_021b6164
    mov r2, r0
    mov r0, #0xe
    mul r0, r9, r0
    add r0, r0, #0x288
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r3, #0x600
    str fp, [sp]
    bl func_ov017_021b4234
    ldr r0, _LIT6
    bl func_0202c06c
    add r1, r4, sl
    ldrb r3, [r1, #0x20]
    ldr r2, _LIT8
    mov r1, r0
    add r2, r2, r3, lsl #0x3
    add r2, r2, #0xa00
    ldrh r2, [r2, #0x78]
    mov r0, r5
    add r2, r2, #0x1
    bl func_02091554
    mov r0, #0xc
    mul r0, r9, r0
    add r0, r0, #0xea
    add r0, r0, #0x200
    mov r0, r0, lsl #0x10
    mov r1, #0x0
    str r1, [sp]
    mov r0, r0, lsr #0x10
    mov r1, r6
    mov r2, r5
    mov r3, #0x200
    bl func_ov017_021b4234
.L_e24:
    add r8, r8, #0x1
    cmp r8, #0x7
    blt .L_d14
.L_e30:
    mov r0, r4
    bl func_ov017_021b62ec
    cmp r0, #0x0
    blt .L_e68
    ldr r1, [r4, #0x10]
    cmp r0, r1
    beq .L_e68
    str r0, [r4, #0x10]
    mov r0, r4
    bl func_ov017_021b636c
    add sp, sp, #0x324
    add sp, sp, #0x400
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e68:
    ldr r0, _LIT9
    bl func_ov017_021b2c5c
    cmp r0, #0x0
    beq .L_e84
    mov r0, r4
    bl func_ov017_021b5ce8
    b .L_fb4
.L_e84:
    ldr r0, _LIT10
    bl func_ov017_021b2c5c
    cmp r0, #0x0
    beq .L_fb4
    mov r0, r4
    bl func_ov017_021b5ce8
    b .L_fb4
.L_ea0:
    ldr r1, [r4, #0x4]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_fb4
    b .L_ec0
    b .L_ec0
    b .L_f24
    b .L_fa0
.L_ec0:
    ldr r1, [r4, #0x8]
    ldr r0, _LIT1
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    mov r1, #0x50
    str r1, [r0, #0x1e4]
    ldr r1, [r4, #0x8]
    ldr r0, _LIT2
    sub r1, r1, #0xa
    ldr r2, _LIT3
    and r1, r0, r1, lsl #0x4
    str r1, [r2]
    ldr r1, [r4, #0x8]
    sub r1, r1, #0xa
    and r0, r0, r1, lsl #0x4
    str r0, [r2, #0x4]
    ldr r0, [r4, #0x8]
    cmp r0, #0xa
    blt .L_fb4
    add sp, sp, #0x324
    mov r0, #0x0
    str r0, [r4, #0x8]
    add sp, sp, #0x400
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_f24:
    ldr r1, [r4, #0x8]
    cmp r1, #0x0
    bne .L_f34
    bl func_ov017_021b601c
.L_f34:
    ldr r1, [r4, #0x8]
    ldr r0, _LIT1
    add r1, r1, #0x1
    str r1, [r4, #0x8]
    mov r1, #0x50
    str r1, [r0, #0x1e4]
    mov r1, #0x18
    str r1, [r0, #0x1f4]
    ldr r1, [r4, #0x8]
    ldr r0, _LIT2
    sub r1, r1, #0xa
    ldr r2, _LIT3
    and r1, r0, r1, lsl #0x4
    str r1, [r2]
    ldr r1, [r4, #0x8]
    sub r1, r1, #0xa
    and r0, r0, r1, lsl #0x4
    str r0, [r2, #0x4]
    ldr r0, [r4, #0x8]
    cmp r0, #0xa
    blt .L_fb4
    add sp, sp, #0x324
    mov r0, #0x0
    str r0, [r4, #0x8]
    add sp, sp, #0x400
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fa0:
    add sp, sp, #0x324
    mov r0, #0x1
    add sp, sp, #0x400
    str r0, [r4]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fb4:
    mov r0, #0x0
    add sp, sp, #0x324
    add sp, sp, #0x400
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov000_021b1c4c
_LIT1: .word data_ov017_021b8794
_LIT2: .word 0x000001ff
_LIT3: .word 0x04000014
_LIT4: .word data_02104acc
_LIT5: .word 0x92492493
_LIT6: .word 0x000006ca
_LIT7: .word data_021058ec
_LIT8: .word data_02104e6c
_LIT9: .word data_ov017_021b806c
_LIT10: .word data_ov017_021b8076
