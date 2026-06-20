; func_ov002_022bd5a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02037208
        .extern func_ov002_022bdb88
        .global func_ov002_022bd5a4
        .arm
func_ov002_022bd5a4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r8, r0
    ldr r0, [r8, #0xc60]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_240
    b .L_30
    b .L_50
    b .L_c4
    b .L_1f8
    b .L_218
.L_30:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x4]
    str r1, [r8, #0xc48]
    mov r0, #0x1
    str r0, [r8, #0xc60]
    str r1, [r8, #0xc64]
    b .L_240
.L_50:
    ldr r0, [r8, #0xc64]
    cmp r0, #0xf
    blt .L_240
    ldr r1, [r8, #0xc58]
    mov r3, #0x0
    mov r0, r1, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    mov r4, r2, asr #0x8
    mov r1, r0, lsr #0x10
    and r0, r2, #0xff
    and r2, r4, #0xff
    and r1, r1, #0xff
    mov r0, r0, lsl #0x1c
    mov r2, r2, lsl #0x1c
    orr r1, r1, r0, lsr #0x14
    ldr r0, _LIT1
    orr r2, r1, r2, lsr #0x10
    mov r1, #0x8
    str r3, [sp]
    bl func_ov002_022bdb88
    mov r0, #0x2
    str r0, [r8, #0xc60]
    mov r0, #0x0
    str r0, [r8, #0xc64]
    b .L_240
.L_c4:
    ldr r2, [r8, #0xc58]
    ldr r1, [r8, #0xc64]
    mov r0, r2, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r0, lsr #0x10
    mov r0, r2, lsl #0x10
    mov r2, r3, asr #0x8
    cmp r1, #0x2d
    mov r4, r0, lsr #0x10
    and r5, r3, #0xff
    and r6, r2, #0xff
    ldr r7, _LIT1
    cmpne r1, #0x63
    bne .L_118
    mov r0, #0x37
    sub r1, r0, #0x38
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_118:
    cmp r4, #0x1
    beq .L_14c
    ldr r0, [r8, #0xc64]
    cmp r0, #0x23
    cmpne r0, #0x37
    cmpne r0, #0x59
    cmpne r0, #0x6d
    bne .L_14c
    mov r0, #0x37
    sub r1, r0, #0x38
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_14c:
    ldr r0, [r8, #0xc64]
    cmp r0, #0xa5
    bne .L_1a8
    mov r1, #0x0
    mov r2, r1
    cmp r4, #0x0
    ble .L_18c
    and r3, r5, #0x1
.L_16c:
    mov r0, r6, asr r2
    and r0, r0, #0x1
    cmp r3, r0
    moveq r1, #0x1
    beq .L_18c
    add r2, r2, #0x1
    cmp r2, r4
    blt .L_16c
.L_18c:
    cmp r1, #0x0
    beq .L_1a8
    mov r0, #0x4a
    sub r1, r0, #0x4b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_1a8:
    mov r1, #0x0
.L_1ac:
    ldr r0, [r7]
    cmp r0, #0x0
    beq .L_1c8
    ldr r0, [r7, #0x4]
    cmp r0, #0x8
    moveq r0, #0x1
    beq .L_1dc
.L_1c8:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r7, r7, #0x8
    blt .L_1ac
    mov r0, #0x0
.L_1dc:
    cmp r0, #0x0
    bne .L_240
    mov r0, #0x3
    str r0, [r8, #0xc60]
    mov r0, #0x0
    str r0, [r8, #0xc64]
    b .L_240
.L_1f8:
    ldr r0, [r8, #0xc64]
    cmp r0, #0xf
    blt .L_240
    mov r0, #0x4
    str r0, [r8, #0xc60]
    mov r0, #0x0
    str r0, [r8, #0xc64]
    b .L_240
.L_218:
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x4]
    str r1, [r8, #0xc48]
    mov r0, #0xc
    str r0, [r8, #0xcc8]
    mov r0, #0x0
    add sp, sp, #0x4
    str r0, [r8, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_240:
    ldr r1, [r8, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r8, #0xc64]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d1af8
_LIT1: .word data_ov002_022d28fc
