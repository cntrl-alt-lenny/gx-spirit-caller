; func_ov002_021de678 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a6
        .extern data_ov002_022d0650
        .extern func_ov002_021de134
        .extern func_ov002_021e276c
        .global func_ov002_021de678
        .arm
func_ov002_021de678:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    mov r4, r2
    mov sl, r1
    add r1, r4, sl, lsl #0x4
    mov r2, #0x1
    mov r5, r2, lsl r1
    mov r1, r5
    mov r2, #0xf
    bl func_ov002_021de134
    tst r5, r0
    beq .L_260
    ldr r1, _LIT0
    and r3, sl, #0x1
    mov r0, #0x14
    mul r2, r3, r1
    ldr r1, _LIT1
    mul r8, r4, r0
    add r0, r1, r2
    ldrh r9, [r8, r0]
    cmp r9, #0x0
    beq .L_254
    ldr r0, _LIT2
    add r0, r0, r2
    add r7, r0, #0x30
    ldr r0, _LIT3
    add r5, r0, #0x9b
    add r0, r0, #0xe
    str r0, [sp, #0x8]
    ldr r0, _LIT3
    add r0, r0, #0x20c
    str r0, [sp, #0x14]
    ldr r0, _LIT3
    add r6, r0, #0x9b
    ldr r0, _LIT4
    add r0, r0, #0xb6
    str r0, [sp, #0x20]
    ldr r0, _LIT4
    add r0, r0, #0xb7
    str r0, [sp, #0x28]
    ldr r0, _LIT4
    add r0, r0, #0xb6
    str r0, [sp, #0x24]
    ldr r0, _LIT4
    sub r0, r0, #0x2
    str r0, [sp, #0x1c]
    ldr r0, _LIT4
    sub r0, r0, #0x1
    str r0, [sp, #0x18]
    ldr r0, _LIT3
    add r0, r0, #0x4a
    str r0, [sp, #0x10]
    ldr r0, _LIT3
    add r0, r0, #0xe
    str r0, [sp, #0xc]
    ldr r0, _LIT4
    sub r0, r0, #0x24c
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    sub r0, r0, #0x42
    str r0, [sp]
    ldr r0, _LIT3
    sub fp, r0, #0x42
    ldr r0, _LIT4
    sub r4, r0, #0x24c
.L_104:
    ldr r0, _LIT5
    add r0, r0, r9, lsl #0x3
    ldrh r1, [r0, #0x2]
    ldrh r9, [r0, #0x6]
    mov r1, r1, lsl #0x1c
    mov r2, r1, lsr #0x1c
    cmp r2, #0x6
    bcs .L_24c
    ldrh r1, [r0]
    cmp r1, r6
    bgt .L_19c
    cmp r1, r5
    bge .L_204
    ldr r3, _LIT3
    cmp r1, r3
    bgt .L_170
    bge .L_204
    cmp r1, r4
    bgt .L_24c
    cmp r1, fp
    blt .L_24c
    ldr r3, [sp]
    cmp r1, r3
    ldrne r3, [sp, #0x4]
    cmpne r1, r3
    beq .L_204
    b .L_24c
.L_170:
    ldr r3, [sp, #0x8]
    cmp r1, r3
    bgt .L_18c
    ldr r3, [sp, #0xc]
    cmp r1, r3
    beq .L_204
    b .L_24c
.L_18c:
    ldr r3, [sp, #0x10]
    cmp r1, r3
    beq .L_204
    b .L_24c
.L_19c:
    ldr r3, _LIT4
    cmp r1, r3
    bgt .L_1dc
    ldr r3, [sp, #0x14]
    cmp r1, r3
    blt .L_1cc
    ldr r3, [sp, #0x18]
    cmp r1, r3
    ldrne r3, _LIT4
    cmpne r1, r3
    beq .L_204
    b .L_24c
.L_1cc:
    ldr r3, [sp, #0x1c]
    cmp r1, r3
    beq .L_204
    b .L_24c
.L_1dc:
    ldr r3, [sp, #0x20]
    cmp r1, r3
    bgt .L_1f8
    ldr r3, [sp, #0x24]
    cmp r1, r3
    beq .L_204
    b .L_24c
.L_1f8:
    ldr r3, [sp, #0x28]
    cmp r1, r3
    bne .L_24c
.L_204:
    ldrh ip, [r0, #0x2]
    ldr r3, [r7, r8]
    and r2, r2, #0xf
    mov ip, ip, lsl #0x18
    mov ip, ip, lsr #0x1c
    and ip, ip, #0xf
    orr r2, r2, ip, lsl #0x4
    mov ip, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r0, sl
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021e276c
.L_24c:
    cmp r9, #0x0
    bne .L_104
.L_254:
    add sp, sp, #0x2c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_260:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a6
_LIT2: .word data_ov002_022cf16c
_LIT3: .word 0x00001814
_LIT4: .word 0x00001a21
_LIT5: .word data_ov002_022d0650
