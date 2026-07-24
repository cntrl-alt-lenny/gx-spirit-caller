; func_ov006_021bf2a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_0224f448
        .extern data_ov006_02257548
        .extern func_02001d68
        .extern func_02001d84
        .extern func_02001d98
        .extern func_02004f58
        .extern func_020054f0
        .extern func_02005554
        .extern func_0202c0c0
        .extern func_0208dd9c
        .extern OS_SPrintf
        .extern func_02094504
        .extern func_ov006_021b9dec
        .extern func_ov006_021b9e08
        .global func_ov006_021bf2a4
        .arm
func_ov006_021bf2a4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    mov r7, r0
    ldr r5, _LIT0
    bl func_0208dd9c
    mov r4, r0
    ldr r3, _LIT1
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x800
    ldrh r6, [r3, #0x6c]
    bl func_02094504
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    add r0, r7, #0x4
    bne .L_44c
    mov r1, #0x9
    mov r2, #0x0
    bl func_02001d84
    b .L_454
.L_44c:
    mov r1, #0x5
    bl func_02001d98
.L_454:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    beq .L_478
    ldr r0, _LIT3
    bl func_0202c0c0
    mov r5, r0
    b .L_4f4
.L_478:
    cmp r6, #0x0
    bne .L_490
    ldr r0, _LIT4
    bl func_0202c0c0
    mov r5, r0
    b .L_4f4
.L_490:
    cmp r6, #0xa
    bge .L_4e8
    cmp r0, #0x0
    add r1, sp, #0x8
    bne .L_4b8
    rsbs r2, r6, #0xa
    rsbmi r2, r2, #0x0
    mov r0, r5
    bl func_ov006_021b9e08
    b .L_4c8
.L_4b8:
    rsbs r2, r6, #0xa
    rsbmi r2, r2, #0x0
    mov r0, r5
    bl func_ov006_021b9dec
.L_4c8:
    mov r0, #0x480
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x28
    add r2, sp, #0x8
    bl OS_SPrintf
    add r5, sp, #0x28
    b .L_4f4
.L_4e8:
    ldr r0, _LIT5
    bl func_0202c0c0
    mov r5, r0
.L_4f4:
    ldr r0, _LIT2
    mov r1, #0xa
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, r5
    bne .L_51c
    mov r2, #0x9
    bl func_020054f0
    b .L_524
.L_51c:
    mov r2, #0x5
    bl func_02005554
.L_524:
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
    bl func_02004f58
    mov r1, #0x0
    mov r2, r1
    add r0, r7, #0x4
    bl func_02001d84
    add r0, r7, #0x4
    mvn r1, #0x0
    bl func_02001d98
    mov r0, #0x1
    add sp, sp, #0x68
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov006_0224f448
_LIT1: .word data_ov006_02257548
_LIT2: .word data_02104f4c
_LIT3: .word 0x00000482
_LIT4: .word 0x0000047f
_LIT5: .word 0x00000481
