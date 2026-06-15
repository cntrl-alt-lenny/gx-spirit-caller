; func_ov000_021ae69c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov000_021b56b4
        .extern data_ov000_021c758c
        .extern data_ov000_021c75c4
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02037208
        .extern func_ov000_021ac760
        .extern func_ov000_021ac770
        .extern func_ov000_021ae4d8
        .extern func_ov000_021ae654
        .global func_ov000_021ae69c
        .arm
func_ov000_021ae69c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r2, _LIT1
    ldr r3, [r0, #0x2a4]
    ldr r1, [r0, #0x2a8]
    mov r0, r3, lsl #0x9
    mov r3, r0, lsr #0x1e
    mov r0, #0x28
    mla r2, r3, r0, r2
    mov r0, r1, lsl #0x10
    add r5, r2, #0x8
    mov r6, r0, lsr #0x1c
    add r7, r3, #0x2
    ldr r4, _LIT2
    bl func_0200617c
    cmp r0, #0x0
    bne .L_54
    bl func_02006164
    cmp r0, #0x0
    beq .L_168
.L_54:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    cmp r7, #0x0
    mov r8, #0x0
    ble .L_11c
.L_6c:
    add r3, r5, r8, lsl #0x3
    ldrsh r2, [r3, #0x2]
    ldr r1, [sp]
    mov r6, r8, lsl #0x3
    cmp r1, r2
    blt .L_110
    ldrsh r0, [r3, #0x6]
    add r0, r2, r0
    cmp r1, r0
    bge .L_110
    ldrsh r2, [r5, r6]
    ldr r1, [sp, #0x4]
    cmp r1, r2
    blt .L_110
    ldrsh r0, [r3, #0x4]
    add r0, r2, r0
    cmp r1, r0
    bge .L_110
    ldr r0, [r4, #0x26c]
    add r6, r8, #0x1
    orr r0, r0, #0x800
    str r0, [r4, #0x26c]
    bl func_ov000_021ae4d8
    bl func_0200617c
    cmp r0, #0x0
    beq .L_f8
    ldr r1, [r4, #0x270]
    and r0, r6, #0xff
    mov r1, r1, lsl #0x10
    cmp r0, r1, lsr #0x1c
    bne .L_f8
    ldr r0, [r4, #0x26c]
    orr r0, r0, #0x1000
    str r0, [r4, #0x26c]
    b .L_110
.L_f8:
    ldr r1, [r4, #0x270]
    and r0, r6, #0xff
    bic r1, r1, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x270]
.L_110:
    add r8, r8, #0x1
    cmp r8, r7
    blt .L_6c
.L_11c:
    add r0, r4, #0x154
    bl func_ov000_021ac760
    cmp r0, #0x0
    beq .L_260
    ldr r1, [r4, #0x270]
    add r0, r4, #0x154
    bic r1, r1, #0xf000
    bic r1, r1, #0xff0000
    orr r1, r1, #0xff0000
    bic r1, r1, #-16777216
    orr r1, r1, #0x6000000
    str r1, [r4, #0x270]
    bl func_ov000_021ac770
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    b .L_260
.L_168:
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x40
    beq .L_19c
    ldr r0, [r4, #0x26c]
    cmp r6, #0x1
    sub r6, r6, #0x1
    orr r0, r0, #0x800
    moveq r6, r7
    str r0, [r4, #0x26c]
    bl func_ov000_021ae4d8
    bl func_ov000_021ae654
    b .L_248
.L_19c:
    tst r0, #0x80
    beq .L_1cc
    add r6, r6, #0x1
    add r0, r7, #0x1
    cmp r6, r0
    ldr r0, [r4, #0x26c]
    moveq r6, #0x1
    orr r0, r0, #0x800
    str r0, [r4, #0x26c]
    bl func_ov000_021ae4d8
    bl func_ov000_021ae654
    b .L_248
.L_1cc:
    tst r0, #0x1
    beq .L_1e4
    ldr r0, [r4, #0x26c]
    orr r0, r0, #0x1000
    str r0, [r4, #0x26c]
    b .L_248
.L_1e4:
    tst r0, #0x2
    beq .L_248
    ldr r0, [r4, #0x26c]
    mov r1, r0, lsl #0x9
    movs r1, r1, lsr #0x1e
    beq .L_208
    mov r0, r0, lsl #0x15
    movs r0, r0, lsr #0x1e
    beq .L_248
.L_208:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r1, [r4, #0x270]
    ldr r0, [r4, #0x26c]
    bic r1, r1, #-16777216
    orr r1, r1, #0x6000000
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x15
    orr r1, r1, #0xff0000
    movs r0, r0, lsr #0x1e
    movne r6, #0x0
    str r1, [r4, #0x270]
    moveq r6, #0x2
.L_248:
    ldr r1, [r4, #0x270]
    and r0, r6, #0xff
    bic r1, r1, #0xf000
    mov r0, r0, lsl #0x1c
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x270]
.L_260:
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x8
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    ldr r0, [r4, #0x270]
    bic r0, r0, #0xff0000
    orr r1, r0, #0xff0000
    mov r0, r1, lsr #0x18
    bic r1, r1, #-16777216
    add r0, r0, #0x1
    orr r0, r1, r0, lsl #0x18
    str r0, [r4, #0x270]
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov000_021c758c
_LIT1: .word data_ov000_021b56b4
_LIT2: .word data_ov000_021c75c4
_LIT3: .word data_02104bac
