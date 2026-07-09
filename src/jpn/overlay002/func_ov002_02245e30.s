; func_ov002_02245e30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_ov002_021b9dec
        .extern func_ov002_021fbe84
        .extern func_ov002_021fbfd8
        .extern func_ov002_02245be0
        .global func_ov002_02245e30
        .arm
func_ov002_02245e30:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x18
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r5, #0x0
    mov r9, r1
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1e
    mov fp, r2
    mov r6, r5
    cmpne r0, #0x3
    bne .L_40
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r9, r0, lsr #0x1f
    moveq r5, #0x1
.L_40:
    cmp r5, #0x0
    beq .L_17c
    ldr r0, _LIT0
    mov r7, #0x0
    add r0, r0, #0x1
    str r0, [sp, #0xc]
    ldr r0, _LIT0
    add r0, r0, #0xb
    str r0, [sp, #0x14]
    ldr r0, _LIT0
    add r0, r0, #0x1
    str r0, [sp, #0x10]
    ldr r0, _LIT0
    sub r0, r0, #0xf
    str r0, [sp, #0x8]
    ldr r0, _LIT0
    sub r0, r0, #0x10
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    sub r8, r0, #0x10
    sub r4, r0, #0xf
.L_94:
    mov r0, r9
    mov r1, r7
    bl func_ov002_021b9dec
    ldr r1, _LIT0
    cmp r0, r1
    bgt .L_d8
    bge .L_100
    cmp r0, r4
    bgt .L_104
    cmp r0, r8
    blt .L_104
    ldr r1, [sp, #0x4]
    cmp r0, r1
    ldrne r1, [sp, #0x8]
    cmpne r0, r1
    beq .L_100
    b .L_104
.L_d8:
    ldr r1, [sp, #0xc]
    cmp r0, r1
    bgt .L_f4
    ldr r1, [sp, #0x10]
    cmp r0, r1
    beq .L_100
    b .L_104
.L_f4:
    ldr r1, [sp, #0x14]
    cmp r0, r1
    bne .L_104
.L_100:
    mov r6, #0x1
.L_104:
    add r7, r7, #0x1
    cmp r7, #0xa
    ble .L_94
    ldr r0, _LIT1
    and r1, r9, #0x1
    mul r2, r1, r0
    ldr r1, _LIT2
    mov r0, #0x0
    ldr r1, [r1, r2]
    cmp r1, #0x0
    bls .L_17c
    ldr r1, _LIT3
    mov r8, #0x1
    add r3, r1, r2
    ldr r2, _LIT4
    ldr r7, [r3, #0xc]
    add r1, r3, #0x120
    sub r3, r2, #0xa
    sub r4, r2, #0xb
.L_150:
    ldr ip, [r1]
    add r0, r0, #0x1
    mov ip, ip, lsl #0x13
    mov ip, ip, lsr #0x13
    cmp ip, r4
    cmpne ip, r3
    cmpne ip, r2
    moveq r6, r8
    cmp r0, r7
    add r1, r1, #0x4
    bcc .L_150
.L_17c:
    mov r8, #0x0
.L_180:
    mov r7, #0x0
.L_184:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9dec
    movs r4, r0
    beq .L_1e8
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, sl
    bl func_ov002_021fbe84
    cmp r0, #0x0
    beq .L_1e8
    cmp fp, #0x0
    cmpne r5, #0x0
    beq .L_1dc
    cmp r6, #0x0
    bne .L_1dc
    mov r0, sl
    mov r1, r4
    bl func_ov002_02245be0
    cmp r0, #0x0
    beq .L_1e8
.L_1dc:
    add sp, sp, #0x18
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    add r7, r7, #0x1
    cmp r7, #0xa
    ble .L_184
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_180
    ldr r0, _LIT1
    and r2, r9, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_2a0
    ldr r0, _LIT3
    add r0, r0, r1
    str r0, [sp]
    add r4, r0, #0x120
.L_230:
    ldr r1, [r4]
    mov r0, r9
    mov r3, r1, lsl #0x13
    mov r1, r7
    mov r2, sl
    mov r8, r3, lsr #0x13
    bl func_ov002_021fbfd8
    cmp r0, #0x0
    beq .L_288
    cmp fp, #0x0
    cmpne r5, #0x0
    beq .L_27c
    cmp r6, #0x0
    bne .L_27c
    mov r0, sl
    mov r1, r8
    bl func_ov002_02245be0
    cmp r0, #0x0
    beq .L_288
.L_27c:
    add sp, sp, #0x18
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_288:
    ldr r0, [sp]
    add r7, r7, #0x1
    ldr r0, [r0, #0xc]
    add r4, r4, #0x4
    cmp r7, r0
    bcc .L_230
.L_2a0:
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001af9
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00001b04
