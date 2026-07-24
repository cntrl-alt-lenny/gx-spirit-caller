; func_ov009_021aacc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_ov009_021adbcc
        .extern data_ov009_021adc00
        .extern data_ov009_021adc54
        .extern func_02001d0c
        .extern func_02005088
        .extern func_020054a4
        .extern func_0202b100
        .extern func_0202c0c0
        .extern Vram_GetBankBaseCD
        .extern func_0208e1ac
        .extern func_0208e200
        .extern OS_SPrintf
        .extern func_02094504
        .extern func_020a978c
        .extern func_ov009_021ab838
        .global func_ov009_021aacc4
        .arm
func_ov009_021aacc4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x110
    mov r5, r1
    str r0, [sp, #0x8]
    mov r4, r2
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x28
    bl func_02094504
    bl func_0208e200
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    bl func_0208e1ac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    ldr r0, [sp, #0x8]
    mov r1, #0x0
    str r1, [r0]
    str r1, [r0, #0x18]
    cmp r5, #0x0
    str r4, [r0, #0x10]
    beq .L_898
    cmp r5, #0x1
    beq .L_920
    cmp r5, #0x2
    beq .L_94c
    b .L_96c
.L_898:
    str r1, [r0, #0x8]
    ldr r0, [r0, #0x10]
    cmp r0, #0xa
    beq .L_8bc
    cmp r0, #0xb
    beq .L_8dc
    cmp r0, #0xc
    beq .L_8f4
    b .L_96c
.L_8bc:
    add r0, r0, #0x1b8
    bl func_0202c0c0
    ldr r2, _LIT1
    mov r1, r0
    ldr r2, [r2]
    add r0, sp, #0x10
    bl OS_SPrintf
    b .L_96c
.L_8dc:
    add r0, r0, #0x1b8
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    b .L_96c
.L_8f4:
    add r0, r0, #0x1b8
    bl func_0202c0c0
    mov r4, r0
    ldr r0, _LIT2
    bl func_ov009_021ab838
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x10
    mov r1, r4
    bl func_020a978c
    b .L_96c
.L_920:
    mov r1, #0x1
    str r1, [r0, #0x8]
    ldr r0, [r0, #0x10]
    add r0, r0, #0x1b8
    bl func_0202c0c0
    ldr r2, _LIT1
    mov r1, r0
    ldr r2, [r2]
    add r0, sp, #0x10
    bl OS_SPrintf
    b .L_96c
.L_94c:
    mov r1, #0x2
    str r1, [r0, #0x8]
    ldr r0, [r0, #0x10]
    add r0, r0, #0x1b8
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
.L_96c:
    bl Vram_GetBankBaseCD
    mov r4, r0
    add r1, r4, #0x2d00
    mov r0, #0x0
    mov r2, #0x1c00
    bl func_02094504
    ldr r0, _LIT3
    mov r1, #0x1c
    mov r2, #0x8
    bl func_02001d0c
    mov r3, #0x2
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    add r2, r4, #0x2d00
    bl func_02005088
    ldr r0, _LIT3
    ldr r0, [r0, #0xc]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x1c]
    ldr r0, [r0, #0x8]
    cmp r0, #0x0
    beq .L_9e0
    cmp r0, #0x1
    beq .L_a68
    b .L_b40
.L_9e0:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x1c]
    mov r0, #0x1f
    add r2, r1, #0x8
    ldr r1, [sp, #0x8]
    str r2, [r1, #0x1c]
    str r2, [r1, #0x20]
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    mov r0, #0x1f
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0xe0
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x2
    ldr r0, [sp, #0x8]
    add r2, r4, #0x2d00
    ldr r1, [r0, #0x1c]
    mov r0, #0xc
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    bl func_02005088
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x1c]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x1c]
    b .L_b40
.L_a68:
    ldr r0, [sp, #0x8]
    ldr r1, [r0, #0x1c]
    mov r0, #0x1d
    add r2, r1, #0x8
    ldr r1, [sp, #0x8]
    str r2, [r1, #0x1c]
    str r2, [r1, #0x20]
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    mov r0, #0x1d
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0x70
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    ldr r0, [sp, #0x8]
    add r2, r4, #0x2d00
    ldr r1, [r0, #0x1c]
    mov r0, #0xc
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    bl func_02005088
    mov r0, #0x1e
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x10
    bl OS_SPrintf
    mov r0, #0x1e
    bl func_0202c0c0
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0x70
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x70
    ldr r0, [sp, #0x8]
    add r2, r4, #0x2d00
    ldr r1, [r0, #0x1c]
    mov r0, #0xc
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x10
    bl func_02005088
    ldr r0, [sp, #0x8]
    ldr r0, [r0, #0x1c]
    add r1, r0, #0xc
    ldr r0, [sp, #0x8]
    str r1, [r0, #0x1c]
.L_b40:
    bl func_0208e200
    ldr r1, [sp, #0x8]
    add r5, r0, #0x44
    ldr r1, [r1, #0x1c]
    mov r6, #0x0
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1d
    mov r4, r0, asr #0x3
    adds r0, r2, r1, ror #0x1d
    addne r4, r4, #0x1
    mov r2, #0x168
    cmp r4, #0x0
    ble .L_bb8
    mov r3, r6
.L_b80:
    mov r7, r3
.L_b84:
    add r0, r2, #0x1
    mov r1, r7, lsl #0x1
    orr r2, r2, #0x7000
    mov r0, r0, lsl #0x10
    add r7, r7, #0x1
    strh r2, [r5, r1]
    cmp r7, #0x1c
    mov r2, r0, lsr #0x10
    blt .L_b84
    add r6, r6, #0x1
    cmp r6, r4
    add r5, r5, #0x40
    blt .L_b80
.L_bb8:
    bl func_0208e1ac
    add r1, r4, #0x2
    str r1, [sp, #0xc]
    cmp r1, #0x0
    add sl, r0, #0x2
    mov r8, #0x0
    ble .L_c8c
    ldr r2, _LIT4
    add r6, r4, #0x1
    sub r3, r2, #0x3
    sub ip, r2, #0x6
    sub lr, r2, #0x2
    sub r5, r2, #0x4
    sub r7, r2, #0x7
    mov fp, #0x160
    mov r4, #0x164
.L_bf8:
    mov r9, #0x0
.L_bfc:
    cmp r9, #0x0
    beq .L_c10
    cmp r9, #0x1d
    beq .L_c2c
    b .L_c48
.L_c10:
    cmp r8, #0x0
    moveq r0, r7
    beq .L_c60
    cmp r8, r6
    movlt r0, r5
    movge r0, r4
    b .L_c60
.L_c2c:
    cmp r8, #0x0
    moveq r0, fp
    beq .L_c60
    cmp r8, r6
    movlt r0, lr
    addge r0, r2, #0x1
    b .L_c60
.L_c48:
    cmp r8, #0x0
    moveq r0, ip
    beq .L_c60
    cmp r8, r6
    movlt r0, r3
    movge r0, r2
.L_c60:
    orr r1, r0, #0x8000
    mov r0, r9, lsl #0x1
    strh r1, [sl, r0]
    add r9, r9, #0x1
    cmp r9, #0x1e
    blt .L_bfc
    ldr r0, [sp, #0xc]
    add r8, r8, #0x1
    add sl, sl, #0x40
    cmp r8, r0
    blt .L_bf8
.L_c8c:
    ldr r0, [sp, #0x8]
    ldr r1, _LIT5
    ldr r0, [r0, #0x1c]
    ldr r3, _LIT6
    add r2, r0, #0x10
    ldr r0, [sp, #0x8]
    str r2, [r0, #0x1c]
    and r0, r1, r2, lsl #0x10
    str r0, [r3]
    ldr r0, [sp, #0x8]
    sub r2, r3, #0x10
    ldr r0, [r0, #0x1c]
    and r0, r1, r0, lsl #0x10
    str r0, [r3, #0x4]
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x3
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    mov r0, #0x1
    add sp, sp, #0x110
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov009_021adbcc
_LIT1: .word data_ov009_021adc54
_LIT2: .word data_ov009_021adc00
_LIT3: .word data_02102c90
_LIT4: .word 0x00000165
_LIT5: .word 0x01ff0000
_LIT6: .word 0x04001010
