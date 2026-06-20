; func_ov002_022bb294 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1410
        .extern data_ov002_022d28fc
        .extern func_02021660
        .extern func_020216b0
        .extern func_02037208
        .extern func_ov002_022a6324
        .extern func_ov002_022b867c
        .extern func_ov002_022bdb88
        .global func_ov002_022bb294
        .arm
func_ov002_022bb294:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x1c
    mov r6, r0
    ldr r0, [r6, #0xc60]
    cmp r0, #0x0
    beq .L_24c
    cmp r0, #0x1
    beq .L_398
    cmp r0, #0x2
    beq .L_40c
    b .L_424
.L_24c:
    ldr r0, [r6, #0xc64]
    ldr r5, _LIT0
    cmp r0, #0xf
    ldr r0, _LIT1
    blt .L_424
    add r1, r6, #0xc00
    ldrh r1, [r1, #0x6c]
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov r4, r1, lsl #0x1f
    mov r1, r4, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022a6324
    add r1, sp, #0x4
    mov r4, r0
    add r0, r6, #0xc00
    str r1, [sp]
    ldrh r1, [r0, #0x6a]
    mov r0, r6
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x12
    mov ip, r1, lsl #0x1f
    mov r1, ip, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022b867c
    add r1, sp, #0x10
    add r0, r6, #0xc00
    str r1, [sp]
    ldrh r3, [r0, #0x6c]
    mov r0, r6
    mov r1, r3, lsl #0x1f
    mov r2, r3, lsl #0x1a
    mov r3, r3, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    bl func_ov002_022b867c
    add r2, sp, #0x10
    str r2, [sp]
    ldrh r2, [r4, #0xa]
    mov r0, r5
    mov r1, #0x39
    mov r2, r2, lsl #0x10
    add r3, sp, #0x4
    mov r2, r2, lsr #0x1f
    bl func_ov002_022bdb88
    ldr r0, [r6]
    mov r1, #0x1
    mov r2, #0x0
    bl func_02021660
    ldr r2, [sp, #0x10]
    mov r1, #0x6
    mov r4, r0
    bl func_020216b0
    ldr r2, [sp, #0x14]
    mov r0, r4
    mov r1, #0x7
    bl func_020216b0
    ldr r2, [sp, #0x18]
    mov r0, r4
    mov r1, #0x8
    sub r2, r2, #0x40
    bl func_020216b0
    ldr r2, [sp, #0x10]
    mov r0, r4
    mov r1, #0x9
    bl func_020216b0
    mov r0, r4
    mov r1, #0xa
    mov r2, #0x60
    bl func_020216b0
    ldr r1, [sp, #0x18]
    mov r0, r4
    add r2, r1, #0x60
    mov r1, #0xb
    bl func_020216b0
    mov r0, #0x1
    str r0, [r6, #0xc60]
    mov r0, #0x0
    str r0, [r6, #0xc64]
    b .L_424
.L_398:
    ldr r0, [r6, #0xc64]
    ldr r4, _LIT0
    cmp r0, #0x3c
    bne .L_3bc
    mov r0, #0x3c
    sub r1, r0, #0x3d
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_3bc:
    mov r1, #0x0
.L_3c0:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_3dc
    ldr r0, [r4, #0x4]
    cmp r0, #0x39
    moveq r0, #0x1
    beq .L_3f0
.L_3dc:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r4, r4, #0x8
    blt .L_3c0
    mov r0, #0x0
.L_3f0:
    cmp r0, #0x0
    bne .L_424
    mov r0, #0x2
    str r0, [r6, #0xc60]
    mov r0, #0x0
    str r0, [r6, #0xc64]
    b .L_424
.L_40c:
    mov r0, #0xc
    str r0, [r6, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x1c
    str r0, [r6, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_424:
    ldr r1, [r6, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r6, #0xc64]
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022d28fc
_LIT1: .word data_ov002_022d1410
