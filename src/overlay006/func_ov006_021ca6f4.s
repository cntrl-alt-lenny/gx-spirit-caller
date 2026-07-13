; func_ov006_021ca6f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4728
        .extern data_02104f4c
        .extern data_ov006_021cec04
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001d98
        .extern func_02001e94
        .extern func_02005088
        .extern func_02005554
        .extern func_0202b100
        .extern func_0202c0c0
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern func_0208ff84
        .extern func_02094504
        .extern func_020a978c
        .global func_ov006_021ca6f4
        .arm
func_ov006_021ca6f4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10c
    ldr r1, _LIT0
    mov sl, r0
    ldr r0, [r1, #0x4]
    ldr r1, [sl, #0x4c]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    ldreq r2, _LIT1
    mov r0, #0x14
    ldrne r2, _LIT2
    mla r7, r1, r0, r2
    ldrsh r3, [r7, #0x8]
    ldrsh r2, [r7, #0xc]
    ldrsh r1, [r7, #0xa]
    ldrsh r0, [r7, #0xe]
    add r2, r3, r2
    add r3, r2, #0x7
    add r0, r1, r0
    add r2, r0, #0x7
    mov r0, r3, asr #0x2
    mov r1, r2, asr #0x2
    add r0, r3, r0, lsr #0x1d
    add r1, r2, r1, lsr #0x1d
    mov r4, r0, asr #0x3
    mov r5, r1, asr #0x3
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    mov r1, r4
    mov r2, r5
    add r0, sl, #0x4
    bl func_02001d0c
    bl func_0208e0a0
    mov r1, r0
    ldr r2, [sl, #0x40]
    ldr r3, [sl, #0x44]
    add r0, sl, #0x4
    bl func_02001e94
    bl func_0208de4c
    mul r5, r4, r5
    ldr r1, [sl, #0x40]
    mov r2, r5, lsl #0x5
    add r4, r0, r1, lsl #0x5
    mov r0, #0x0
    mov r1, r4
    bl func_02094504
    ldrsh r0, [r7, #0x10]
    mov r6, #0x0
    cmp r0, #0x0
    beq .L_130
    bl func_0202c0c0
    ldrsh r1, [r7, #0x2]
    mov r6, r0
    cmp r1, #0x1
    bne .L_104
    ldr r0, [sl, #0x50]
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0xc
    mov r1, r6
    bl func_020a978c
    b .L_12c
.L_104:
    cmp r1, #0x2
    add r0, sp, #0xc
    bne .L_124
    ldr r2, [sl, #0x50]
    mov r1, r6
    add r2, r2, #0x1
    bl func_020a978c
    b .L_12c
.L_124:
    mov r1, r6
    bl func_020a978c
.L_12c:
    add r6, sp, #0xc
.L_130:
    cmp r6, #0x0
    beq .L_1a4
    ldrsh r0, [r7, #0x2]
    cmp r0, #0x2
    bne .L_154
    ldr r0, [sl, #0x50]
    ldrb r0, [r0]
    bl func_02001d68
    b .L_168
.L_154:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
.L_168:
    add r0, sl, #0x4
    mov r1, #0x5
    bl func_02001d98
    ldrsh r2, [r7, #0xa]
    mov r0, #0xc
    mov r1, r6
    str r2, [sp]
    str r0, [sp, #0x4]
    ldrsh r3, [r7, #0x8]
    mov r2, r4
    add r0, sl, #0x4
    bl func_02005088
    add r0, sl, #0x4
    mvn r1, #0x0
    bl func_02001d98
.L_1a4:
    ldrsh r0, [r7, #0x12]
    mov r6, #0x0
    cmp r0, #0x0
    beq .L_1bc
    bl func_0202c0c0
    mov r6, r0
.L_1bc:
    cmp r6, #0x0
    beq .L_214
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, sl, #0x4
    mov r1, #0x5
    bl func_02001d98
    ldrsh r0, [r7, #0xa]
    mov r1, r6
    mov r2, r4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldrsh r3, [r7, #0x8]
    add r0, sl, #0x4
    bl func_02005088
    add r0, sl, #0x4
    mvn r1, #0x0
    bl func_02001d98
.L_214:
    ldrsh r0, [r7]
    cmp r0, #0x0
    beq .L_338
    add r0, sl, #0x4
    mov r1, #0x20
    mov r2, #0x4
    bl func_02001d0c
    bl func_0208e0a0
    ldr r1, [sl, #0x5c]
    ldr r2, [sl, #0x40]
    sub r1, r1, #0x4
    add r1, r0, r1, lsl #0x6
    ldr r3, [sl, #0x44]
    add r2, r2, r5
    add r0, sl, #0x4
    bl func_02001e94
    bl func_0208de4c
    ldr r1, [sl, #0x40]
    mov r2, #0x1000
    add r1, r1, r5
    add r0, r0, r1, lsl #0x5
    str r0, [sp, #0x8]
    ldr r1, [sp, #0x8]
    mov r0, #0x0
    bl func_02094504
    ldrsh r0, [r7]
    ldr r7, [sl, #0x60]
    cmp r0, #0x1
    ldreq r5, _LIT3
    beq .L_298
    cmp r0, #0x2
    ldreq r5, _LIT4
    movne r5, #0x0
.L_298:
    cmp r7, #0x0
    mov r6, #0x0
    ble .L_338
    rsb r9, r7, #0x1
    mvn fp, #0x0
.L_2ac:
    mov r0, r6, lsl #0x1
    ldrsh r0, [r5, r0]
    bl func_0202c0c0
    mov r1, #0xc
    mov r2, #0x5
    mov r4, r0
    bl func_02005554
    add r1, r0, r0, lsr #0x1f
    ldr r2, [sl, #0x58]
    mov r1, r1, asr #0x1
    mov r0, r2, lsl #0x3
    add r0, r0, r0, lsr #0x1f
    rsb r1, r1, r0, asr #0x1
    mov r0, r9, lsl #0x6
    add r0, r0, r0, lsr #0x1f
    add r8, r1, r0, asr #0x1
    add r0, sl, #0x4
    mov r1, #0x5
    bl func_02001d98
    mov r0, #0x5
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r2, [sp, #0x8]
    mov r1, r4
    mov r3, r8
    add r0, sl, #0x4
    bl func_02005088
    add r0, sl, #0x4
    mov r1, fp
    bl func_02001d98
    add r6, r6, #0x1
    add r9, r9, #0x2
    cmp r6, r7
    blt .L_2ac
.L_338:
    ldr r1, [sl, #0x44]
    ldr r0, _LIT5
    mov r1, r1, lsl #0x5
    mov r2, #0x20
    bl func_0208ff84
    mov r0, #0x1
    add sp, sp, #0x10c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov006_021cec04+0x6
_LIT2: .word data_ov006_021cec04+0x24a
_LIT3: .word data_ov006_021cec04+0x2
_LIT4: .word data_ov006_021cec04
_LIT5: .word data_020b4728
