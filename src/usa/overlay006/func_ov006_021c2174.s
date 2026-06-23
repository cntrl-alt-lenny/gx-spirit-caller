; func_ov006_021c2174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fb4e0
        .extern data_020fb8a0
        .extern data_020fc080
        .extern data_ov006_021cdd0c
        .extern data_ov006_0224f328
        .extern data_ov006_0225ca5c
        .extern data_ov006_0225ca68
        .extern data_ov006_0225ca98
        .extern func_02021174
        .extern func_02021278
        .extern func_02021428
        .extern func_02022228
        .extern func_ov006_021b5e60
        .extern func_ov006_021b6aac
        .extern func_ov006_021b6ae0
        .extern func_ov006_021c30c4
        .extern func_ov006_021c3608
        .extern func_ov006_021c3b6c
        .extern func_ov006_021c4160
        .extern func_ov006_021c47d4
        .extern func_ov006_021c4a14
        .extern func_ov006_021c4ac8
        .extern func_ov006_021c4bb8
        .extern func_ov006_021c4db8
        .global func_ov006_021c2174
        .arm
func_ov006_021c2174:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    mov r0, #0x0
    str r0, [sl, #0x68]
    str r0, [sl, #0x74]
    str r0, [sl, #0x78]
    str r0, [sl, #0x4c]
    ldr r1, [sl, #0x70]
    cmp r1, #0x0
    beq .L_8c
    ldr r1, _LIT0
    ldr r6, _LIT1
    ldr r2, [r1, #0xc]
    ldr r4, _LIT2
    str r2, [r1, #0x94]
    ldr r2, [r1, #0x18]
    str r2, [r1, #0xa0]
    ldr r2, [r1, #0x10]
    str r2, [r1, #0x98]
    ldr r2, [r1, #0x14]
    str r2, [r1, #0x9c]
.L_54:
    add r5, r6, r0, lsl #0x4
    ldr r2, [r5, #0x10]
    add r3, r4, r0, lsl #0x4
    ldr r1, [r5, #0x14]
    str r2, [r3, #0x9c]
    add r0, r0, #0x1
    ldr r2, [r5, #0x18]
    str r1, [r3, #0xa0]
    ldr r1, [r5, #0x1c]
    str r2, [r3, #0xa4]
    str r1, [r3, #0xa8]
    cmp r0, #0x2
    blt .L_54
    b .L_140
.L_8c:
    str r0, [sl, #0x64]
    ldr r1, [sl, #0x58]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    mov r7, #0x0
    cmp r0, #0x2
    moveq r9, #0x2
    movne r9, #0x1
    cmp r9, #0x0
    ble .L_140
    ldr fp, _LIT4
    add r8, sl, #0x9c
    mov r5, #0x1
    mov r4, #0x32
    mov r6, r7
.L_cc:
    add r0, sl, r7, lsl #0x4
    str r6, [r0, #0x9c]
    str r6, [r0, #0xa0]
    cmp r7, #0x0
    movne r0, r5
    moveq r0, r6
    cmp r0, #0x0
    addeq r0, sl, r7, lsl #0x4
    streq r4, [r0, #0xa4]
    beq .L_108
    mov r0, fp
    mov r1, #0x1
    bl func_ov006_021b6aac
    add r1, sl, r7, lsl #0x4
    str r0, [r1, #0xa4]
.L_108:
    add r0, sl, r7, lsl #0x4
    ldr r0, [r0, #0xa4]
    add r7, r7, #0x1
    cmp r0, #0x6
    movgt r2, #0x1
    ldr r0, [r8, #0xc]
    movle r2, #0x0
    bic r1, r0, #0x1
    and r0, r2, #0x1
    orr r0, r1, r0
    str r0, [r8, #0xc]
    cmp r7, r9
    add r8, r8, #0x10
    blt .L_cc
.L_140:
    ldr r0, [sl, #0x8]
    cmp r0, #0x0
    bne .L_15c
    ldr r0, _LIT5
    bl func_02021174
    str r0, [sl, #0x8]
    bl func_02021428
.L_15c:
    ldr r0, [sl]
    cmp r0, #0x0
    beq .L_174
    bl func_02021278
    mov r0, #0x0
    str r0, [sl]
.L_174:
    ldr r0, [sl, #0x4]
    cmp r0, #0x0
    bne .L_190
    ldr r0, _LIT6
    bl func_02021174
    str r0, [sl, #0x4]
    bl func_02021428
.L_190:
    ldr r0, [sl, #0xc]
    cmp r0, #0x0
    bne .L_1ac
    ldr r0, _LIT7
    bl func_02021174
    str r0, [sl, #0xc]
    bl func_02021428
.L_1ac:
    mov r6, #0x0
    add r5, sl, #0xbc
    mov r4, r6
.L_1b8:
    mov r1, r5
    mov r0, r6
    strb r4, [r5], #0x20
    bl func_02022228
    add r6, r6, #0x1
    cmp r6, #0x7d
    blt .L_1b8
    ldr r4, _LIT4
    mov r0, r4
    bl func_ov006_021b5e60
    mov r0, sl
    bl func_ov006_021c30c4
    mov r1, #0x1
    mov r0, sl
    mov r2, r1
    mov r3, r1
    bl func_ov006_021c3608
    mov r0, sl
    mov r1, #0x1
    bl func_ov006_021c3b6c
    mov r0, sl
    bl func_ov006_021c4160
    mov r0, sl
    bl func_ov006_021c47d4
    mov r0, sl
    bl func_ov006_021c4a14
    mov r0, sl
    bl func_ov006_021c4ac8
    mov r0, sl
    bl func_ov006_021c4bb8
    mov r0, sl
    bl func_ov006_021c4db8
    ldr r0, [sl, #0x58]
    cmp r0, #0x6
    bne .L_268
    mov r1, #0x7
    mov r0, r4
    str r1, [sl, #0x7c]
    mov r3, #0xc
    mov r1, #0x3
    mov r2, #0x0
    str r3, [sl, #0x80]
    bl func_ov006_021b6ae0
    str r0, [sl, #0x84]
.L_268:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_0225ca5c
_LIT1: .word data_ov006_0225ca68
_LIT2: .word data_ov006_0225ca98
_LIT3: .word data_ov006_021cdd0c
_LIT4: .word data_ov006_0224f328
_LIT5: .word data_020fb4e0
_LIT6: .word data_020fb8a0
_LIT7: .word data_020fc080
