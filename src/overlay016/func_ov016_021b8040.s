; func_ov016_021b8040 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov016_021b8e5c
        .extern data_ov016_021b9784
        .extern func_0201e964
        .global func_ov016_021b8040
        .arm
func_ov016_021b8040:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x48
    mov r5, r0
    ldr r1, [r5, #0x1e4]
    ldr r0, [r5, #0x1e0]
    ldr r3, [r5, #0x1dc]
    mov r2, r0, lsl #0xc
    mov r1, r1, lsl #0xc
    ldr r4, _LIT0
    mov r0, #0x54
    str r2, [sp, #0x20]
    str r1, [sp, #0x24]
    add r1, r5, #0x100
    ldrh r1, [r1, #0xd8]
    mla r2, r3, r0, r4
    cmp r1, #0x0
    bne .L_b00
    ldr r0, [r2, #0x48]
    cmp r0, #0x0
    beq .L_b00
    ldr r0, [r2, #0x44]
    mov r3, #0x0
    cmp r0, #0x0
    add r2, sp, #0x20
    str r3, [sp]
    beq .L_ac8
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    mov r0, #0x3
    str r0, [sp, #0xc]
    str r3, [sp, #0x10]
    str r3, [sp, #0x14]
    str r3, [sp, #0x18]
    str r3, [sp, #0x1c]
    ldr r0, [r5, #0x8]
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
    ldr r0, [r5, #0x8]
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
    ldr r1, [r5, #0x64]
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
    ldr r1, [r5, #0xc0]
    mov r0, #0x1
    ldr r1, [r1, #0x2c]
    add r2, sp, #0x20
    bl func_0201e964
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
    ldr r0, [r5, #0x11c]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e964
    ldr r0, _LIT1
    add ip, sp, #0x28
    ldr r6, [r0, #0x38]
    ldr lr, _LIT2
    mov r6, r6, asr #0x3
    and r7, r6, #0x7
    ldr r4, [r5, #0x1ec]
    mov r8, ip
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    ldr r1, [r8, r7, lsl #0x2]
    ldr r0, [r5, #0x1e8]
    add r2, r4, r1
    mov r1, r0, lsl #0xc
    mov r0, r2, lsl #0xc
    add r6, r5, #0x100
    str r1, [sp, #0x20]
    str r0, [sp, #0x24]
    ldrh r0, [r6, #0xd0]
    cmp r0, #0x0
    beq .L_b00
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
    ldr r0, [r5, #0x178]
    add r2, sp, #0x20
    ldr r1, [r0, #0x2c]
    mov r0, #0x1
    bl func_0201e964
    b .L_b00
.L_ac8:
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
    ldr r1, [r5, #0x64]
    ldr r1, [r1, #0x2c]
    bl func_0201e964
.L_b00:
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov016_021b9784
_LIT1: .word data_021040ac
_LIT2: .word data_ov016_021b8e5c
