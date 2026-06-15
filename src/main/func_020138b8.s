; func_020138b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c59c4
        .extern data_02104f4c
        .extern data_02105a4d
        .extern data_02105a68
        .extern func_02011b9c
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202af40
        .extern func_0202ba94
        .extern func_0202c070
        .extern func_0202c0c0
        .extern func_0202c1ac
        .extern func_020aadf8
        .global func_020138b8
        .arm
func_020138b8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x3c
    add r0, sp, #0x0
    bl func_0202adf8
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    ldr r0, _LIT1
    ldr r1, _LIT2
    bl func_02011b9c
    mov r0, #0x29
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT3
    bl func_020aadf8
    ldr r0, _LIT0
    ldr r5, _LIT1
    ldr r1, [r0, #0x4]
    mov r4, #0x0
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    strb r1, [r0, #0xb00]
    ldr r0, [r5]
    cmp r0, #0x0
    bls .L_13b0
    mov r6, #0x1
.L_1390:
    add r0, r5, r4, lsl #0x1
    ldrh r0, [r0, #0xc]
    mov r1, r6
    bl func_0202ba94
    ldr r0, [r5]
    add r4, r4, #0x1
    cmp r4, r0
    bcc .L_1390
.L_13b0:
    bl func_0202c1ac
    bl func_0202af40
    add sp, sp, #0x3c
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_02105a68
_LIT2: .word data_020c59c4
_LIT3: .word data_02105a4d
