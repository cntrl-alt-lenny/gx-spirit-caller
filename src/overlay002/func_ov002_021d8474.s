; func_ov002_021d8474 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf282
        .extern data_ov002_022d0650
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .global func_ov002_021d8474
        .arm
func_ov002_021d8474:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    ldr r8, [sp, #0x58]
    mov r9, r3
    and r3, r0, #0x1
    mov sl, r2
    ldr r6, [sp, #0x5c]
    ldr r5, [sp, #0x60]
    and r4, r9, #0x1
    mov r0, r8, lsl #0x1b
    orr r0, r4, r0, lsr #0x1a
    mov r2, r0, lsl #0x10
    mov r1, r1, lsl #0x1b
    orr r0, r3, r1, lsr #0x1a
    mov r7, sl, lsl #0x16
    orr r0, r0, r7, lsr #0x10
    and r3, r6, #0xff
    and r1, r5, #0xff
    orr r1, r3, r1, lsl #0x8
    mov r3, r1, lsl #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x41
    bl func_ov002_021d479c
    ldr r0, _LIT0
    ldr r1, _LIT1
    mul r0, r4, r0
    ldrh r7, [r1, r0]
    cmp r7, #0x0
    addeq sp, sp, #0x30
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    add r5, r0, #0x9b
    add r0, r0, #0xe
    str r0, [sp, #0xc]
    ldr r0, _LIT2
    add r0, r0, #0x20c
    str r0, [sp, #0x18]
    ldr r0, _LIT2
    add r6, r0, #0x9b
    ldr r0, _LIT3
    add r0, r0, #0xb6
    str r0, [sp, #0x24]
    ldr r0, _LIT3
    add r0, r0, #0xb7
    str r0, [sp, #0x2c]
    ldr r0, _LIT3
    add r0, r0, #0xb6
    str r0, [sp, #0x28]
    ldr r0, _LIT3
    sub r0, r0, #0x2
    str r0, [sp, #0x20]
    ldr r0, _LIT3
    sub r0, r0, #0x1
    str r0, [sp, #0x1c]
    ldr r0, _LIT2
    add r0, r0, #0x4a
    str r0, [sp, #0x14]
    ldr r0, _LIT2
    add r0, r0, #0xe
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    sub r0, r0, #0x24c
    str r0, [sp, #0x8]
    ldr r0, _LIT2
    sub r0, r0, #0x42
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    sub fp, r0, #0x42
    ldr r0, _LIT3
    sub r4, r0, #0x24c
.L_124:
    ldr r0, _LIT4
    add r0, r0, r7, lsl #0x3
    ldrh r1, [r0, #0x2]
    ldrh r7, [r0, #0x6]
    mov r1, r1, lsl #0x1c
    mov r1, r1, lsr #0x1c
    cmp r1, #0x6
    bcs .L_264
    ldrh r2, [r0]
    cmp r2, r6
    bgt .L_1bc
    cmp r2, r5
    bge .L_224
    ldr r3, _LIT2
    cmp r2, r3
    bgt .L_190
    bge .L_224
    cmp r2, r4
    bgt .L_264
    cmp r2, fp
    blt .L_264
    ldr r3, [sp, #0x4]
    cmp r2, r3
    ldrne r3, [sp, #0x8]
    cmpne r2, r3
    beq .L_224
    b .L_264
.L_190:
    ldr r3, [sp, #0xc]
    cmp r2, r3
    bgt .L_1ac
    ldr r3, [sp, #0x10]
    cmp r2, r3
    beq .L_224
    b .L_264
.L_1ac:
    ldr r3, [sp, #0x14]
    cmp r2, r3
    beq .L_224
    b .L_264
.L_1bc:
    ldr r3, _LIT3
    cmp r2, r3
    bgt .L_1fc
    ldr r3, [sp, #0x18]
    cmp r2, r3
    blt .L_1ec
    ldr r3, [sp, #0x1c]
    cmp r2, r3
    ldrne r3, _LIT3
    cmpne r2, r3
    beq .L_224
    b .L_264
.L_1ec:
    ldr r3, [sp, #0x20]
    cmp r2, r3
    beq .L_224
    b .L_264
.L_1fc:
    ldr r3, [sp, #0x24]
    cmp r2, r3
    bgt .L_218
    ldr r3, [sp, #0x28]
    cmp r2, r3
    beq .L_224
    b .L_264
.L_218:
    ldr r3, [sp, #0x2c]
    cmp r2, r3
    bne .L_264
.L_224:
    ldrh r3, [r0, #0x4]
    cmp r3, sl
    bne .L_264
    and r3, r1, #0xf
    mov r1, #0x0
    str r1, [sp]
    ldrh ip, [r0, #0x2]
    mov r0, r9
    mov r1, r8
    mov ip, ip, lsl #0x18
    mov ip, ip, lsr #0x1c
    and ip, ip, #0xf
    orr r3, r3, ip, lsl #0x4
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d59cc
.L_264:
    cmp r7, #0x0
    bne .L_124
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf282
_LIT2: .word 0x00001814
_LIT3: .word 0x00001a21
_LIT4: .word data_ov002_022d0650
