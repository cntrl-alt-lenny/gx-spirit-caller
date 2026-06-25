; func_0201ea4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02191d58
        .extern func_02005d90
        .extern func_0201d594
        .extern func_0201e8d4
        .extern func_0207e9f0
        .extern func_0207f7e0
        .extern func_0207f84c
        .extern func_020943b0
        .global func_0201ea4c
        .arm
func_0201ea4c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov r7, r1
    ldr r1, [sp, #0x60]
    str r0, [sp, #0xc]
    str r1, [sp, #0x60]
    ldr r1, [r7, #0x2c]
    mov sl, r2
    mov r4, r3
    str r1, [sp, #0x14]
    bl func_0201e8d4
    bl func_0201d594
    add r0, r0, #0x5
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x68]
    ldr r1, [sp, #0x6c]
    str r0, [sp, #0x18]
    str sl, [sp]
    cmp r1, #0x200
    movge fp, r1, asr #0x9
    mov r8, #0x0
    movlt fp, r1, asr #0x5
    ldr r0, [sp, #0x58]
    str r4, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r3, [sp, #0x5c]
    ldr r0, _LIT0
    ldr r2, [sp, #0x14]
    mov r1, #0x20
    str r8, [sp, #0x10]
    bl func_0207f84c
    ldr r1, [r7, #0x18]
    mov r6, r0
    ldr r1, [r1, #0x4]
    mov r0, r7
    and r9, r1, #0xff
    bl func_0207e9f0
    mov r4, r0
    add r0, r7, #0x38
    mov r1, #0x1
    bl func_0207f7e0
    cmp r9, #0x0
    beq .L_cc
    cmp r9, #0x2
    ldrnesh r0, [r4, #0xc]
    ldrnesh r8, [r4, #0xe]
    strne r0, [sp, #0x10]
    bne .L_cc
    ldrsh r0, [r4, #0x4]
    ldrsh r8, [r4, #0x6]
    str r0, [sp, #0x10]
.L_cc:
    cmp r6, #0x0
    mov r7, #0x0
    ble .L_254
    ldr r0, [sp, #0x64]
    ldr r2, [sp, #0x74]
    mov r0, r0, lsl #0x1e
    str r0, [sp, #0x20]
    mov r0, r2, lsl #0x1f
    mov r4, #0x400
    ldr r1, [sp, #0x70]
    str r0, [sp, #0x24]
    mov r0, r1, lsl #0x1e
    str r0, [sp, #0x28]
    rsb r4, r4, #0x0
.L_104:
    sub r0, r6, r7
    sub r9, r0, #0x1
    ldr r0, [sp, #0x14]
    ldr r2, [r0, #0x4]
    mov r0, r9, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r0, #0x6
    mul r0, r1, r0
    add r3, r2, r0
    ldrh r2, [r2, r0]
    ldrh r1, [r3, #0x2]
    ldrh r0, [r3, #0x4]
    strh r2, [sp, #0x2c]
    strh r1, [sp, #0x2e]
    strh r0, [sp, #0x30]
    ldr r0, [sp, #0x2c]
    and r1, r0, #0xff
    cmp r1, #0x7f
    orrgt r0, r1, #0xff00
    movgt r0, r0, lsl #0x10
    movgt r1, r0, asr #0x10
    ldr r0, [sl, #0x4]
    add r0, r0, r1, lsl #0xc
    add r0, r0, #0x800
    mov r1, r0, asr #0xc
    ldr r0, _LIT1
    cmp r1, r0, asr #0x13
    ble .L_248
    cmp r1, #0xc0
    bge .L_248
    ldr r0, [sp, #0xc]
    ldr r1, [sp, #0x60]
    bl func_02005d90
    mov r5, r0
    ldr r0, _LIT0
    mov r1, r5
    add r0, r0, r9, lsl #0x3
    mov r2, #0x6
    bl func_020943b0
    ldr r1, [r5, #0x4]
    ldr r2, [sp, #0x18]
    and r0, r1, r4
    mov r1, r1, lsl #0x16
    mov r3, r1, lsr #0x16
    ldr r1, [sp, #0x1c]
    add r1, r3, r2, asr r1
    and r1, r1, r4, lsr #0x16
    orr r0, r0, r1
    bic r1, r0, #0xf000
    mov r0, r0, lsl #0x10
    add r0, fp, r0, lsr #0x1c
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    str r0, [r5, #0x4]
    ldr r1, [r5]
    ldr r0, _LIT1
    and r2, r1, r0
    ldr r0, [sp, #0x10]
    mov r1, r1, lsl #0x7
    add r0, r0, r1, lsr #0x17
    mov r0, r0, lsl #0x17
    orr r0, r2, r0, lsr #0x7
    bic r1, r0, #0xff
    mov r0, r0, lsl #0x18
    add r0, r8, r0, lsr #0x18
    and r0, r0, #0xff
    orr r0, r1, r0
    str r0, [r5]
    ldr r0, [r5, #0x4]
    bic r1, r0, #0xc00
    ldr r0, [sp, #0x20]
    orr r0, r1, r0, lsr #0x14
    str r0, [r5, #0x4]
    ldr r0, [r5]
    bic r1, r0, #0x1000
    ldr r0, [sp, #0x24]
    orr r0, r1, r0, lsr #0x13
    bic r1, r0, #0xc00
    ldr r0, [sp, #0x28]
    orr r0, r1, r0, lsr #0x14
    str r0, [r5]
.L_248:
    add r7, r7, #0x1
    cmp r7, r6
    blt .L_104
.L_254:
    mov r0, r5
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02191d58
_LIT1: .word 0xfe00ffff
