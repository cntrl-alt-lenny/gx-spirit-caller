; func_ov004_021d9db0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_02102bb0
        .extern data_ov004_0220ef44
        .extern func_02001cec
        .extern func_02004f3c
        .extern func_02005488
        .extern func_0208fc48
        .extern func_0209281c
        .extern func_02094410
        .global func_ov004_021d9db0
        .arm
func_ov004_021d9db0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r6, r2
    mov r2, r6, lsl #0x4
    add r2, r2, r2, lsr #0x1f
    mov r4, r2, asr #0x1
    mov r7, r0
    mov r5, r1
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r4
    mov r0, #0x0
    bl func_02094410
    mov r1, r6, asr #0x2
    add r1, r6, r1, lsr #0x1d
    ldr r0, _LIT0
    mov r1, r1, asr #0x3
    mov r2, #0x2
    bl func_02001cec
    ldr r8, _LIT1
    mov r0, r5
    mov r1, #0xc
    bl func_02005488
    str r0, [r8, r7, lsl #0x2]
    add r0, r0, r0, lsr #0x1f
    mov r1, r0, asr #0x1
    add r0, r6, r6, lsr #0x1f
    rsbs r3, r1, r0, asr #0x1
    mov r8, #0x1
    mov r1, r5
    ldr r0, _LIT0
    ldr r2, [sp, #0x8]
    movmi r3, #0x0
    str r8, [sp]
    mov r5, #0xc
    str r5, [sp, #0x4]
    bl func_02004f3c
    ldr r0, [sp, #0x8]
    mov r1, r4
    bl func_0209281c
    mov r0, r6, asr #0x4
    add r0, r6, r0, lsr #0x1b
    mov sl, r0, asr #0x5
    cmp sl, #0x0
    mov r5, #0x0
    ble .L_124
    mul r0, r7, r6
    mov r0, r0, lsl #0x4
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r6, r0, #0xc80
    ldr r7, [sp, #0x8]
    mov r9, r6
    add r4, r4, r4, lsr #0x1f
    mov fp, #0x80
.L_ec:
    mov r0, r7
    mov r1, r6
    mov r2, fp
    bl func_0208fc48
    mov r2, #0x80
    add r0, r7, r4, asr #0x1
    add r1, r9, r8, lsl #0x7
    bl func_0208fc48
    add r5, r5, #0x1
    cmp r5, sl
    add r6, r6, #0x100
    add r7, r7, #0x80
    add r8, r8, #0x2
    blt .L_ec
.L_124:
    ldr r0, [sp, #0x8]
    bl Task_InvokeLocked
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102bb0
_LIT1: .word data_ov004_0220ef44
