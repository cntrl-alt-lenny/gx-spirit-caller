; func_ov010_021b4320 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .extern Fill32
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102c90
        .extern data_02104f4c
        .extern data_ov010_021b91b4
        .extern data_ov010_021b9260
        .extern data_ov010_021b93d0
        .extern func_02001c98
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e40
        .extern func_02004fb8
        .extern func_02005210
        .extern Vram_GetBankBaseCD
        .extern func_0208e200
        .extern func_ov005_021ab3b4
        .extern func_ov010_021b23f4
        .extern func_ov010_021b2450
        .extern func_ov010_021b2ddc
        .extern func_ov010_021b4194
        .extern func_ov010_021b421c
        .extern func_ov010_021b476c
        .global func_ov010_021b4320
        .arm
func_ov010_021b4320:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    ldr r2, _LIT0
    mov r4, r0
    ldr r0, [r2, #0x128]
    mov r9, r1
    mov r1, r4
    ldr r5, _LIT1
    ldr r6, _LIT2
    bl func_ov005_021ab3b4
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    bl Vram_GetBankBaseCD
    mov r1, #0x0
    mov r7, r0
    mov r0, r4
    mov r2, r1
    bl func_ov010_021b476c
    mov r4, r0
    mov r0, #0x1
    mov r1, r8
    bl func_ov010_021b4194
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r2, r8
    mov r8, r0
    mov r0, #0x1a
    strh r0, [r6, #0x4]
    mov r0, #0x1
    mov r1, r8
    bl func_ov010_021b421c
    ldrh r1, [r6, #0x4]
    ldr r0, _LIT3
    mov r2, #0x100
    bl func_02001d0c
    ldr r0, _LIT4
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    mov r0, #0xe
    str r0, [sp]
    ldr r0, _LIT3
    mov r1, r4
    mov r2, #0x4
    mov r3, #0x1
    bl func_02004fb8
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e40
    mov r0, #0xc
    str r0, [sp]
    ldr r3, [sp, #0x8]
    ldr r0, _LIT3
    mov r1, r8
    mov r2, #0x4
    add r3, r3, #0x11
    bl func_02004fb8
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e40
    ldr r0, [sp, #0x8]
    add r0, r0, #0x13
    mov r0, r0, asr #0x3
    strh r0, [r6, #0x6]
    ldr r0, [r6]
    cmp r0, #0x0
    beq .L_2b8
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r6]
.L_2b8:
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
    bl func_02001d0c
    mov r0, #0xb
    mov r1, #0x1
    bl func_02001c98
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xe
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    ldr r2, [r9]
    mov r1, r4
    mov r3, #0x4
    bl func_02005210
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e40
    mov r0, #0xf
    mov r1, #0x1
    bl func_02001c98
    ldr r1, [sp, #0x8]
    mov r0, #0xc
    add r1, r1, #0x11
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r0, _LIT3
    ldr r2, [r9]
    mov r1, r8
    mov r3, #0x4
    bl func_02005210
    ldr r0, _LIT3
    add r1, sp, #0xc
    add r2, sp, #0x8
    bl func_02001e40
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
.L_3c4:
    add r0, r6, r2, lsl #0x1
    add r2, r2, #0x1
    strh r1, [r0, #0x8]
    cmp r2, #0x20
    blt .L_3c4
    mov r0, #0x4
    str r2, [sp, #0x8]
    bl func_ov010_021b2ddc
    bl func_0208e200
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
    ble .L_474
    mov r1, ip
.L_418:
    add r7, r6, ip, lsl #0x1
    strh ip, [r7, #0x8]
    ldrh r9, [r6, #0x4]
    str r1, [sp, #0xc]
    cmp r9, #0x0
    ble .L_458
.L_430:
    strh r2, [r0], #0x2
    ldr r7, [sp, #0xc]
    add r2, r2, #0x1
    mov r2, r2, lsl #0x10
    add r7, r7, #0x1
    ldrh r9, [r6, #0x4]
    str r7, [sp, #0xc]
    mov r2, r2, lsr #0x10
    cmp r7, r9
    blt .L_430
.L_458:
    ldr r7, [sp, #0x8]
    rsb r9, r9, #0x20
    add ip, r7, #0x1
    str ip, [sp, #0x8]
    cmp ip, r3
    add r0, r0, r9, lsl #0x1
    blt .L_418
.L_474:
    mov r0, r8
    bl Task_InvokeLocked
    sub r2, r4, #0x97
    mov r1, #0x0
    strh r1, [r6, #0x48]
    strh r1, [r6, #0x4a]
    str r2, [sp, #0x8]
    cmp r2, #0x0
    ldr r0, [r5, #0x2c]
    ble .L_4a4
    bl func_ov010_021b2450
    b .L_4ac
.L_4a4:
    mov r2, r1
    bl func_ov010_021b2450
.L_4ac:
    ldr r0, [r5, #0x2c]
    mov r1, #0x0
    bl func_ov010_021b23f4
    mov r1, #0x1
    mov r0, #0x0
    strh r1, [r6, #0x4c]
    strh r0, [r6, #0x4e]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov010_021b91b4
_LIT1: .word data_ov010_021b9260
_LIT2: .word data_ov010_021b93d0
_LIT3: .word data_02102c90
_LIT4: .word data_02104f4c
