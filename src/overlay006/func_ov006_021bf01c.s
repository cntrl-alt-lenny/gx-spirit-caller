; func_ov006_021bf01c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
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
        .extern func_02091554
        .extern func_02094504
        .extern func_ov006_021b9dec
        .extern func_ov006_021b9e08
        .global func_ov006_021bf01c
        .arm
func_ov006_021bf01c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x68
    mov r7, r0
    ldr r5, _LIT0
    bl func_0208dd9c
    ldr r1, _LIT1
    mov r4, r0
    ldrh r6, [r1, #0x6c]
    ldrh r3, [r1, #0x76]
    add r1, r4, #0x40
    mov r0, #0x0
    mov r2, #0x1000
    sub r6, r6, r3
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
    bne .L_1cc
    mov r1, #0x9
    mov r2, #0x0
    bl func_02001d84
    b .L_1d4
.L_1cc:
    mov r1, #0x5
    bl func_02001d98
.L_1d4:
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    beq .L_1f8
    ldr r0, _LIT3
    bl func_0202c0c0
    mov r5, r0
    b .L_2a8
.L_1f8:
    cmp r6, #0x0
    bne .L_210
    ldr r0, _LIT4
    bl func_0202c0c0
    mov r5, r0
    b .L_2a8
.L_210:
    add r1, sp, #0x8
    bge .L_26c
    cmp r0, #0x0
    bne .L_238
    cmp r6, #0x0
    rsblt r6, r6, #0x0
    mov r0, r5
    mov r2, r6
    bl func_ov006_021b9e08
    b .L_24c
.L_238:
    cmp r6, #0x0
    rsblt r6, r6, #0x0
    mov r0, r5
    mov r2, r6
    bl func_ov006_021b9dec
.L_24c:
    ldr r0, _LIT5
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x28
    add r2, sp, #0x8
    bl func_02091554
    add r5, sp, #0x28
    b .L_2a8
.L_26c:
    cmp r0, #0x0
    mov r0, r5
    bne .L_284
    mov r2, r6
    bl func_ov006_021b9e08
    b .L_28c
.L_284:
    mov r2, r6
    bl func_ov006_021b9dec
.L_28c:
    ldr r0, _LIT6
    bl func_0202c0c0
    mov r1, r0
    add r0, sp, #0x28
    add r2, sp, #0x8
    bl func_02091554
    add r5, sp, #0x28
.L_2a8:
    ldr r0, _LIT2
    mov r1, #0xa
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, r5
    bne .L_2d0
    mov r2, #0x9
    bl func_020054f0
    b .L_2d8
.L_2d0:
    mov r2, #0x5
    bl func_02005554
.L_2d8:
    ldr r1, [r7, #0x74]
    add r0, r0, r0, lsr #0x1f
    cmp r1, #0x0
    moveq r0, r0, asr #0x1
    rsbeq r3, r0, #0xa5
    moveq r0, #0xd
    beq .L_300
    mov r0, r0, asr #0x1
    rsb r3, r0, #0xa5
    mov r0, #0x7
.L_300:
    str r0, [sp]
    mov r0, #0xa
    mov r1, r5
    str r0, [sp, #0x4]
    add r0, r7, #0x4
    add r2, r4, #0x40
    bl func_02004f58
    ldr r0, [r7, #0x74]
    cmp r0, #0x0
    beq .L_398
    ldr r0, _LIT7
    bl func_0202c0c0
    ldr r1, _LIT2
    mov r5, r0
    ldr r1, [r1, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1d
    mov r1, #0xa
    bne .L_358
    mov r2, #0x9
    bl func_020054f0
    b .L_360
.L_358:
    mov r2, #0x5
    bl func_02005554
.L_360:
    ldr r1, _LIT2
    rsb r3, r0, #0xab
    ldr r0, [r1, #0x4]
    mov r1, r5
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1d
    mov r0, #0x16
    str r0, [sp]
    mov r5, #0xa
    addne r3, r3, #0x10
    add r0, r7, #0x4
    add r2, r4, #0x40
    str r5, [sp, #0x4]
    bl func_02004f58
.L_398:
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
_LIT3: .word 0x00000479
_LIT4: .word 0x00000476
_LIT5: .word 0x00000477
_LIT6: .word 0x00000478
_LIT7: .word 0x0000047a
