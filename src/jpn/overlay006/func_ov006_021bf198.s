; func_ov006_021bf198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_0224f328
        .extern data_ov006_02257428
        .extern func_02001d48
        .extern func_02001d64
        .extern func_02001d78
        .extern func_02004f3c
        .extern func_020054d4
        .extern func_02005538
        .extern func_0202c06c
        .extern func_0208dcb4
        .extern OS_SPrintf
        .extern func_02094410
        .extern func_ov006_021b9cec
        .extern func_ov006_021b9d08
        .global func_ov006_021bf198
        .arm
func_ov006_021bf198:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    mov r7, r0
    ldr r5, _LIT0
    bl func_0208dcb4
    mov r4, r0
    ldr r3, _LIT1
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x800
    ldrh r6, [r3, #0x6c]
    bl func_02094410
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    add r0, r7, #0x4
    bne .L_2f4
    mov r1, #0x9
    mov r2, #0x0
    bl func_02001d64
    b .L_2fc
.L_2f4:
    mov r1, #0x5
    bl func_02001d78
.L_2fc:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    beq .L_320
    ldr r0, _LIT3
    bl func_0202c06c
    mov r5, r0
    b .L_39c
.L_320:
    cmp r6, #0x0
    bne .L_338
    ldr r0, _LIT4
    bl func_0202c06c
    mov r5, r0
    b .L_39c
.L_338:
    cmp r6, #0xa
    bge .L_390
    cmp r0, #0x0
    add r1, sp, #0x8
    bne .L_360
    rsbs r2, r6, #0xa
    rsbmi r2, r2, #0x0
    mov r0, r5
    bl func_ov006_021b9d08
    b .L_370
.L_360:
    rsbs r2, r6, #0xa
    rsbmi r2, r2, #0x0
    mov r0, r5
    bl func_ov006_021b9cec
.L_370:
    mov r0, #0x480
    bl func_0202c06c
    mov r1, r0
    add r0, sp, #0x28
    add r2, sp, #0x8
    bl OS_SPrintf
    add r5, sp, #0x28
    b .L_39c
.L_390:
    ldr r0, _LIT5
    bl func_0202c06c
    mov r5, r0
.L_39c:
    ldr r0, _LIT2
    mov r1, #0xa
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, r5
    bne .L_3c4
    mov r2, #0x9
    bl func_020054d4
    b .L_3cc
.L_3c4:
    mov r2, #0x5
    bl func_02005538
.L_3cc:
    add r0, r0, r0, lsr #0x1f
    mov r3, r0, asr #0x1
    mov r0, #0x4
    mov r1, r5
    str r0, [sp]
    mov r5, #0xa
    add r0, r7, #0x4
    add r2, r4, #0x40
    rsb r3, r3, #0xa4
    str r5, [sp, #0x4]
    bl func_02004f3c
    mov r1, #0x0
    mov r2, r1
    add r0, r7, #0x4
    bl func_02001d64
    add r0, r7, #0x4
    mvn r1, #0x0
    bl func_02001d78
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov006_0224f328
_LIT1: .word data_ov006_02257428
_LIT2: .word data_02104e6c
_LIT3: .word 0x00000482
_LIT4: .word 0x0000047f
_LIT5: .word 0x00000481
