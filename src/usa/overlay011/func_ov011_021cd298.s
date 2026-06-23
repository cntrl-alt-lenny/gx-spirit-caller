; func_ov011_021cd298 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov011_021d325a
        .extern data_ov011_021d3f20
        .extern data_ov011_021d3f5c
        .extern func_020060f4
        .extern func_ov011_021c9d4c
        .extern func_ov011_021ca320
        .extern func_ov011_021cc2b0
        .extern func_ov011_021cd018
        .global func_ov011_021cd298
        .arm
func_ov011_021cd298:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x2a4]
    ldr r0, [r0, #0x2b0]
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x1c
    mov r0, r0, lsl #0xb
    sub r6, r1, #0x1
    movs r0, r0, lsr #0x18
    mov r5, #0x1
    bne .L_84
    bl func_ov011_021c9d4c
    cmp r0, #0x0
    beq .L_84
    bl func_ov011_021cc2b0
    cmp r0, #0x0
    bne .L_84
    add r0, sp, #0x24
    add r1, sp, #0x20
    bl func_020060f4
    ldr r3, [sp, #0x24]
    ldr r0, [r4, #0x1fc]
    ldr r2, [sp, #0x20]
    ldr r1, [r4, #0x200]
    add r0, r3, r0, asr #0xc
    add r1, r2, r1, asr #0xc
    str r0, [sp, #0x24]
    str r1, [sp, #0x20]
    bl func_ov011_021ca320
    str r0, [sp, #0x10]
    b .L_e4
.L_84:
    ldr r0, [r4, #0x274]
    mov r0, r0, lsl #0xb
    movs r0, r0, lsr #0x18
    bne .L_d4
    ldr r0, _LIT2
    ldrh r0, [r0, #0x52]
    tst r0, #0xf0
    beq .L_d4
    bl func_ov011_021cc2b0
    cmp r0, #0x0
    bne .L_d4
    ldr r0, [r4, #0x230]
    ldr r1, [r4, #0x234]
    mov r0, r0, asr #0xc
    mov r1, r1, asr #0xc
    str r0, [sp, #0x24]
    str r1, [sp, #0x20]
    bl func_ov011_021ca320
    str r0, [sp, #0x10]
    b .L_e4
.L_d4:
    ldr r0, [r4, #0x270]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    str r0, [sp, #0x10]
.L_e4:
    mov r0, #0x72
    mul r2, r6, r0
    ldr r1, _LIT3
    ldr r3, [r4, #0x270]
    ldrb r0, [r1, r2]
    bic r3, r3, #0xff
    mov r6, #0x0
    cmp r0, #0x0
    addle sp, sp, #0x28
    str r3, [r4, #0x270]
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x10]
    add r8, r1, r2
    and r0, r0, #0xff
    mov r7, r6
    mov sl, r8
    mov r9, #0x1
    str r0, [sp, #0x14]
    mvn fp, #0x0
.L_130:
    ldr r0, [r4, #0x26c]
    mov r0, r0, lsl #0x7
    tst r5, r0, lsr #0x18
    beq .L_1e0
    add r0, sl, r6, lsl #0x2
    ldrh r3, [r0, #0xa]
    ldrh r1, [r0, #0xc]
    ldr r2, [r4, #0x1fc]
    ldr r0, [r4, #0x200]
    rsb r2, r2, r3, lsl #0xc
    rsb r0, r0, r1, lsl #0xc
    str r2, [sp, #0x18]
    str r0, [sp, #0x1c]
    add r0, sp, #0x18
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, r7
    mov r1, fp
    mov r2, #0x2
    mov r3, #0x1b
    bl func_ov011_021cd018
    ldrb r1, [r8, #0x4a]
    ldr r0, [sp, #0x10]
    cmp r0, r1
    bne .L_1e0
    add r0, sp, #0x18
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    mov r0, r9
    mov r1, fp
    mov r2, #0x2
    mov r3, #0x1b
    bl func_ov011_021cd018
    ldr r0, [r4, #0x270]
    bic r1, r0, #0xff
    ldr r0, [sp, #0x14]
    orr r0, r1, r0
    str r0, [r4, #0x270]
.L_1e0:
    mov r5, r5, lsl #0x1
    add r7, r7, #0x2
    add r8, r8, #0x1
    add r9, r9, #0x2
    add r6, r6, #0x1
    ldrb r0, [sl]
    cmp r6, r0
    blt .L_130
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov011_021d3f20
_LIT1: .word data_ov011_021d3f5c
_LIT2: .word data_02104acc
_LIT3: .word data_ov011_021d325a
