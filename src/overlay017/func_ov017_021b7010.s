; func_ov017_021b7010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov017_021b7f3c
        .extern func_0201e964
        .global func_ov017_021b7010
        .arm
func_ov017_021b7010:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x48
    mov r4, r0
    ldr r2, [r4, #0x1e4]
    ldr r1, [r4, #0x1dc]
    mov r5, #0x0
    cmp r1, r2
    streq r5, [r4, #0x1e8]
    beq .L_104
    ldr r0, [r4, #0x1e8]
    sub r5, r2, r1
    add r0, r0, #0x1
    str r0, [r4, #0x1e8]
.L_104:
    ldr r0, [r4, #0x1e8]
    ldr r3, [r4, #0x1e0]
    mul r1, r5, r0
    ldr r2, _LIT0
    mov r0, r1, lsr #0x1f
    smull r1, r5, r2, r1
    ldr r1, [r4, #0x1dc]
    add r5, r0, r5, asr #0x2
    add r5, r1, r5
    mov r1, r5, lsl #0xc
    mov r0, r3, lsl #0xc
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    add r0, r4, #0x100
    ldrh r0, [r0, #0xd8]
    tst r0, #0x4
    bne .L_2b8
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r4, #0x8]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e964
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r4, #0x8]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    add r1, r1, #0x8
    bl func_0201e964
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x1
    str r0, [sp, #0x8]
    mov r1, #0x3
    str r1, [sp, #0xc]
    mov r1, #0x6000
    str r1, [sp, #0x10]
    mov r1, #0x200
    str r1, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0x64]
    add r2, sp, #0x20
    ldr r1, [r1, #0x2c]
    bl func_0201e964
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x3
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, #0xa000
    str r0, [sp, #0x10]
    mov r0, #0x400
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r1, [r4, #0xc0]
    mov r0, #0x1
    ldr r1, [r1, #0x2c]
    add r2, sp, #0x20
    bl func_0201e964
    add r0, r4, #0x100
    ldrh r0, [r0, #0xd8]
    tst r0, #0x8
    bne .L_2b8
    ldrb r0, [r4, #0x1ce]
    cmp r0, #0x6
    cmpne r0, #0xb
    beq .L_2b8
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0x12000
    str r0, [sp, #0x10]
    mov r0, #0x600
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r4, #0x11c]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e964
.L_2b8:
    ldr r0, [r4, #0x1e4]
    mov r3, #0x0
    cmp r5, r0
    streq r0, [r4, #0x1dc]
    ldr r2, [r4, #0x1f4]
    ldr r1, [r4, #0x1ec]
    cmp r1, r2
    streq r3, [r4, #0x1f8]
    beq .L_2ec
    ldr r0, [r4, #0x1f8]
    sub r3, r2, r1
    add r0, r0, #0x1
    str r0, [r4, #0x1f8]
.L_2ec:
    ldr r0, [r4, #0x1f8]
    add r5, sp, #0x28
    mul r8, r3, r0
    ldr r0, _LIT1
    ldr r6, _LIT2
    ldr r0, [r0, #0x38]
    ldr r9, [r4, #0x1ec]
    mov sl, r0, asr #0x3
    ldr r7, [r4, #0x1f0]
    mov lr, r5
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1, r2, r3}
    stmia r5, {r0, r1, r2, r3}
    ldr ip, _LIT0
    and r0, sl, #0x7
    ldr r2, [lr, r0, lsl #0x2]
    smull r1, r3, ip, r8
    mov r0, r8, lsr #0x1f
    add r3, r0, r3, asr #0x2
    add r0, r7, r2
    add r5, r9, r3
    mov r0, r0, lsl #0xc
    mov r1, r5, lsl #0xc
    str r0, [sp, #0x24]
    add r0, r4, #0x100
    str r1, [sp, #0x20]
    ldrh r1, [r0, #0xd8]
    tst r1, #0x10
    bne .L_3b8
    ldrh r0, [r0, #0xd0]
    cmp r0, #0x0
    beq .L_3b8
    mov r3, #0x0
    str r3, [sp]
    str r3, [sp, #0x4]
    mov r0, #0x5
    str r0, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    mov r0, #0x16000
    str r0, [sp, #0x10]
    mov r0, #0x800
    str r0, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r4, #0x178]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e964
.L_3b8:
    ldr r0, [r4, #0x1f4]
    add r1, r4, #0x100
    cmp r5, r0
    streq r0, [r4, #0x1ec]
    ldrh r3, [r1, #0xd8]
    mov r2, #0x0
    mov r0, #0x1
    strh r3, [r1, #0xda]
    strh r2, [r1, #0xd8]
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x66666667
_LIT1: .word data_021040ac
_LIT2: .word data_ov017_021b7f3c
