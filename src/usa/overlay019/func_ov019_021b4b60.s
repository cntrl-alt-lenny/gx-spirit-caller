; func_ov019_021b4b60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102bb0
        .extern data_02104e6c
        .extern data_ov019_021b593c
        .extern func_02001cec
        .extern func_02001d48
        .extern func_0200506c
        .extern func_02005488
        .extern func_020117b0
        .extern func_020119e0
        .extern func_02011a48
        .extern func_02018a88
        .extern func_02018ce8
        .extern func_020191dc
        .extern func_0202c06c
        .extern func_0208de24
        .extern func_02094410
        .global func_ov019_021b4b60
        .arm
func_ov019_021b4b60:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x20
    mov r7, r0
    ldr r4, [r7, #0xc0]
    bl func_0208de24
    add r1, r0, #0x580
    mov r0, #0x0
    mov r2, #0x500
    bl func_02094410
    add r0, r4, #0x178
    add r0, r0, #0x400
    bl func_0202c06c
    mov r6, r0
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001cec
    mov r0, r6
    mov r1, #0xc
    mov r5, #0x0
    bl func_02005488
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r5, r5, #0x14
    rsblt r0, r0, #0x8e
    addlt r5, r5, r0
    bl func_0208de24
    mov r3, r0
    mov r2, #0x1
    mov r1, r6
    str r2, [sp]
    mov r6, #0xc
    add r2, r3, #0x580
    ldr r0, _LIT0
    add r3, r5, #0x6
    str r6, [sp, #0x4]
    bl func_0200506c
    mov r5, #0x0
    bl func_0208de24
    add r1, r0, #0xa80
    mov r0, r5
    mov r2, #0x500
    bl func_02094410
    mov r0, r4
    bl func_020191dc
    mov r4, r0
    ldr r0, _LIT1
    ldr r6, [r0, #0x928]
    mov r0, r6
    bl func_02018a88
    mov r1, r0
    mov r3, #0x1
    str r3, [sp]
    ldr r3, _LIT1
    mov r2, r6
    ldr r3, [r3, #0x92c]
    mov r0, r4
    sub r1, r1, #0x1
    bl func_020117b0
    movs r4, r0
    bne .L_100
    mov r0, r5
    bl func_0202c06c
    b .L_104
.L_100:
    bl func_020119e0
.L_104:
    mov r6, r0
    ldr r0, _LIT0
    mov r1, #0x14
    mov r2, #0x2
    bl func_02001cec
    mov r0, r6
    mov r1, #0xc
    bl func_02005488
    cmp r0, #0x90
    ble .L_140
    mov r0, #0x0
    bl func_0202c06c
    mov r1, #0xc
    mov r6, r0
    bl func_02005488
.L_140:
    rsb r1, r0, #0x90
    cmp r1, #0x14
    addge r5, r5, #0x14
    rsblt r0, r0, #0x8e
    addlt r5, r5, r0
    bl func_0208de24
    mov r3, r0
    mov r2, #0x1
    mov r1, r6
    str r2, [sp]
    mov r6, #0xc
    add r2, r3, #0xa80
    ldr r0, _LIT0
    add r3, r5, #0x6
    str r6, [sp, #0x4]
    bl func_0200506c
    ldr r6, _LIT2
    add r5, sp, #0x8
    ldmia r6!, {r0, r1, r2, r3}
    stmia r5!, {r0, r1, r2, r3}
    ldmia r6, {r0, r1}
    stmia r5, {r0, r1}
    mov r0, r4
    bl func_02011a48
    bl func_02018ce8
    mov r4, r0
    cmp r4, #0x5
    mov r0, #0x0
    movgt r4, #0x5
    bl func_02001d48
    bl func_0208de24
    add r1, r0, #0xf80
    mov r0, #0x0
    mov r2, #0x3c0
    bl func_02094410
    add r1, sp, #0x8
    ldr r5, [r1, r4, lsl #0x2]
    ldr r0, _LIT0
    mov r1, #0xa
    mov r2, #0x3
    bl func_02001cec
    mov r0, r5
    mov r1, #0xc
    bl func_02005488
    mov r4, r0
    bl func_0208de24
    rsb r2, r4, #0x50
    add r2, r2, r2, lsr #0x1f
    mov r3, r2, asr #0x1
    add r2, r0, #0xf80
    mov r0, #0x9
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, r5
    bl func_0200506c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    mov r0, #0x0
    str r0, [r7, #0xb8]
    mov r0, #0x1
    str r0, [r7, #0xbc]
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02102bb0
_LIT1: .word data_02104e6c
_LIT2: .word data_ov019_021b593c
