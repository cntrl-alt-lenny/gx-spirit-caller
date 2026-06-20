; func_ov002_022a8e40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0f98
        .extern func_0207f05c
        .extern func_ov002_022a6e04
        .global func_ov002_022a8e40
        .arm
func_ov002_022a8e40:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    mov sl, r0
    ldr r1, [sl, #0x5e8]
    ldr r0, [sl, #0x5e4]
    cmp r1, #0x0
    movgt r2, #0x1
    movle r2, #0x0
    sub r0, r0, #0x1
    cmp r1, #0x0
    sub r6, r0, r2
    beq .L_10c
    cmp r1, #0x0
    ble .L_50
    rsb r1, r1, #0x10
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r5, r0, asr #0x2
    mov r7, #0x0
    b .L_68
.L_50:
    mvn r0, #0x0
    sub r1, r0, r1
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r5, r0, asr #0x2
    mov r7, #0x10000000
.L_68:
    add r0, sl, #0x1c4
    add r1, r6, #0x1
    add r4, r0, #0x400
    mov r3, r1, lsl #0x1
    ldrh r2, [r4, r3]
    add r0, sp, #0x14
    mov r1, sl
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x18
    str r2, [sp]
    ldrh r2, [r4, r3]
    mov r3, r2, lsl #0x1a
    mov r4, r2, lsl #0x1f
    mov r2, r4, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    ldr r3, [sp, #0x18]
    ldr r4, [sp, #0x14]
    mov r0, r5, lsl #0xa
    sub r1, r3, #0x10
    and r2, r1, #0xff
    add r0, r0, #0x3980
    add r1, r0, #0x8000
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    orr r2, r2, #0x2000
    mov r0, r0, asr #0x7
    orr r5, r0, #0x1400
    sub r8, r4, #0x10
    mov r0, r8, lsl #0x17
    orr r2, r2, #-2147483648
    orr r0, r2, r0, lsr #0x7
    orr r7, r7, r0
    ldr r0, _LIT0
    add r1, sp, #0x34
    mov r2, #0x1
    str r4, [sp, #0x3c]
    str r3, [sp, #0x40]
    str r7, [sp, #0x34]
    strh r5, [sp, #0x38]
    bl func_0207f05c
.L_10c:
    add r5, sp, #0x2c
    mov r0, #0x0
    cmp r6, #0x0
    addlt sp, sp, #0x44
    str r0, [r5]
    str r0, [r5, #0x4]
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sl, #0x1c4
    add r0, r0, #0x400
    add r7, r0, r6, lsl #0x1
    mov r0, #0x400
    rsb r0, r0, #0x0
    str r0, [sp, #0x4]
    ldr r0, _LIT1
    ldr fp, _LIT0
    sub r0, r0, #-1073741824
    str r0, [sp, #0x8]
    mov r4, #0x1
.L_154:
    ldrh r2, [r7]
    add r0, sp, #0xc
    mov r1, sl
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x18
    str r2, [sp]
    ldrh r3, [r7]
    mov r2, r3, lsl #0x1f
    mov r3, r3, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_022a6e04
    ldrh r1, [r7]
    ldr ip, [sp, #0xc]
    ldr r9, [sp, #0x10]
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r3, r1, lsr #0x1b
    ldr r1, [r5, r0, lsl #0x2]
    str ip, [sp, #0x24]
    str r9, [sp, #0x28]
    tst r1, r4, lsl r3
    bne .L_2dc
    mov r2, r1
    orr r2, r2, r4, lsl r3
    str r2, [r5, r0, lsl #0x2]
    sub r0, r9, #0x8
    and r8, r0, #0xff
    sub r1, ip, #0x8
    orr r0, r8, #0x2000
    mov r1, r1, lsl #0x17
    orr r0, r0, #0x40000000
    orr r3, r0, r1, lsr #0x7
    add r1, r6, #0x1
    ldr r0, _LIT2
    cmp r1, #0xa
    smull lr, r2, r0, r1
    mov r0, r1, lsr #0x1f
    add r2, r0, r2, asr #0x2
    mov r0, #0xa
    smull r2, lr, r0, r2
    sub r2, r1, r2
    mov r0, r2, lsl #0x8
    add r0, r0, #0x2480
    add r1, r0, #0x8000
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r0, r0, #0x1400
    str r3, [sp, #0x1c]
    strh r0, [sp, #0x20]
    blt .L_290
    sub r0, ip, #0x5
    mov r1, r0, lsl #0x17
    ldr r0, _LIT3
    mov r2, r4
    and r0, r3, r0
    orr r0, r0, r8
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x1c]
    mov r0, fp
    add r1, sp, #0x1c
    bl func_0207f05c
    ldr r0, [sp, #0x24]
    ldr r1, [sp, #0x1c]
    sub r0, r0, #0xd
    mov r2, r0, lsl #0x17
    ldr r0, _LIT3
    and r0, r1, r0
    orr r0, r0, r8
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0x1c]
    ldrh r1, [sp, #0x20]
    ldr r0, [sp, #0x4]
    and r1, r1, r0
    orr r0, r1, #0x4b
    orr r0, r0, #0x100
    strh r0, [sp, #0x20]
.L_290:
    mov r0, fp
    add r1, sp, #0x1c
    mov r2, #0x1
    bl func_0207f05c
    sub r0, r9, #0x10
    ldr r2, [sp, #0x24]
    and r1, r0, #0xff
    ldr r0, [sp, #0x8]
    sub r2, r2, #0x10
    orr r1, r1, r0
    ldr r0, _LIT4
    mov r2, r2, lsl #0x17
    orr r1, r1, r2, lsr #0x7
    strh r0, [sp, #0x20]
    str r1, [sp, #0x1c]
    mov r0, fp
    add r1, sp, #0x1c
    mov r2, #0x1
    bl func_0207f05c
.L_2dc:
    sub r7, r7, #0x2
    subs r6, r6, #0x1
    bpl .L_154
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d0f98
_LIT1: .word 0x40002000
_LIT2: .word 0x66666667
_LIT3: .word 0xfe00ff00
_LIT4: .word 0x00001541
