; func_ov010_021b4220 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_ov010_021b90b4
        .extern data_ov010_021b9160
        .extern data_ov010_021b92d0
        .extern func_02001c78
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001e20
        .extern func_02004f9c
        .extern func_020051f4
        .extern func_0208de58
        .extern func_0208e118
        .extern func_ov005_021ab2d4
        .extern func_ov010_021b22f4
        .extern func_ov010_021b2350
        .extern func_ov010_021b2cdc
        .extern func_ov010_021b4094
        .extern func_ov010_021b411c
        .extern func_ov010_021b466c
        .global func_ov010_021b4220
        .arm
func_ov010_021b4220:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2, #0x128]
    mov r9, r1
    mov r1, r4
    ldr r5, _LIT1
    ldr r6, _LIT2
    bl func_ov005_021ab2d4
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    bl func_0208de58
    mov r1, #0x0
    mov r7, r0
    mov r0, r4
    mov r2, r1
    bl func_ov010_021b466c
    mov r4, r0
    mov r0, #0x1
    mov r1, r8
    bl func_ov010_021b4094
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r2, r8
    mov r8, r0
    mov r0, #0x1a
    strh r0, [r6, #0x4]
    mov r0, #0x1
    mov r1, r8
    bl func_ov010_021b411c
    ldrh r1, [r6, #0x4]
    ldr r0, _LIT3
    mov r2, #0x100
    bl func_02001cec
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    mov r0, #0xe
    str r0, [sp]
    ldr r0, _LIT3
    mov r1, r4
    mov r2, #0x4
    mov r3, #0x1
    bl func_02004f9c
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e20
    mov r0, #0xc
    str r0, [sp]
    ldr r3, [sp, #0x8]
    ldr r0, _LIT3
    mov r1, r8
    mov r2, #0x4
    add r3, r3, #0x11
    bl func_02004f9c
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e20
    ldr r0, [sp, #0x8]
    add r0, r0, #0x13
    mov r0, r0, asr #0x3
    strh r0, [r6, #0x6]
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_12c
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r6]
.L_12c:
    ldrh r3, [r6, #0x4]
    ldrh r0, [r6, #0x6]
    mov r1, #0x4
    mov r2, #0x0
    mul r0, r3, r0
    mov sl, r0, lsl #0x6
    mov r0, sl
    bl Task_PostLocked
    str r0, [r9]
    mov r1, r0
    mov r2, sl
    mov r0, #0x0
    bl Fill32
    ldrh r1, [r6, #0x4]
    ldrh r2, [r6, #0x6]
    ldr r0, _LIT3
    bl func_02001cec
    mov r0, #0xb
    mov r1, #0x1
    bl func_02001c78
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    ldr r2, [r9]
    mov r1, r4
    mov r3, #0x4
    bl func_020051f4
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e20
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c78
    ldr r1, [sp, #0x8]
    mov r0, #0xc
    add r1, r1, #0x11
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    ldr r2, [r9]
    mov r1, r8
    mov r3, #0x4
    bl func_020051f4
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e20
    ldr r0, [sp, #0xc]
    mov r1, r7
    cmp r0, #0x4
    ldrle r4, [sp, #0x8]
    ldrgt r0, [sp, #0x8]
    mov r2, #0x40
    addgt r4, r0, #0xc
    mov r0, #0x0
    bl Fill32
    ldrh r2, [r6, #0x4]
    ldr r0, [r9]
    add r1, r7, #0x40
    mov r2, r2, lsl #0xb
    bl Copy32
    mov r2, #0x0
    str r2, [sp, #0x8]
    mvn r1, #0x0
.L_238:
    add r0, r6, r2, lsl #0x1
    add r2, r2, #0x1
    strh r1, [r0, #0x8]
    cmp r2, #0x20
    blt .L_238
    mov r0, #0x4
    str r2, [sp, #0x8]
    bl func_ov010_021b2cdc
    bl func_0208e118
    ldrh r1, [r6, #0x6]
    mov ip, #0x0
    mov r2, #0x1
    cmp r1, #0x20
    movcs r1, #0x20
    mov r1, r1, lsl #0x10
    mov r3, r1, lsr #0x10
    str ip, [sp, #0x8]
    cmp r3, #0x0
    add r0, r0, #0x2
    ble .L_2e8
    mov r1, ip
.L_28c:
    add r7, r6, ip, lsl #0x1
    strh ip, [r7, #0x8]
    ldrh r9, [r6, #0x4]
    str r1, [sp, #0xc]
    cmp r9, #0x0
    ble .L_2cc
.L_2a4:
    strh r2, [r0], #0x2
    ldr r7, [sp, #0xc]
    add r2, r2, #0x1
    mov r2, r2, lsl #0x10
    add r7, r7, #0x1
    ldrh r9, [r6, #0x4]
    str r7, [sp, #0xc]
    mov r2, r2, lsr #0x10
    cmp r7, r9
    blt .L_2a4
.L_2cc:
    ldr r7, [sp, #0x8]
    rsb r9, r9, #0x20
    add ip, r7, #0x1
    str ip, [sp, #0x8]
    cmp ip, r3
    add r0, r0, r9, lsl #0x1
    blt .L_28c
.L_2e8:
    mov r0, r8
    bl Task_InvokeLocked
    sub r2, r4, #0x97
    mov r1, #0x0
    strh r1, [r6, #0x48]
    strh r1, [r6, #0x4a]
    str r2, [sp, #0x8]
    cmp r2, #0x0
    ldr r0, [r5, #0x2c]
    ble .L_318
    bl func_ov010_021b2350
    b .L_320
.L_318:
    mov r2, r1
    bl func_ov010_021b2350
.L_320:
    ldr r0, [r5, #0x2c]
    mov r1, #0x0
    bl func_ov010_021b22f4
    mov r1, #0x1
    mov r0, #0x0
    strh r1, [r6, #0x4c]
    strh r0, [r6, #0x4e]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov010_021b90b4
_LIT1: .word data_ov010_021b9160
_LIT2: .word data_ov010_021b92d0
_LIT3: .word data_02102bb0
_LIT4: .word data_02104e6c
