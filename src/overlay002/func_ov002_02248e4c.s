; func_ov002_02248e4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202df78
        .extern func_ov002_021ca3f0
        .extern func_ov002_02253458
        .global func_ov002_02248e4c
        .arm
func_ov002_02248e4c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    ldr r2, _LIT0
    mov sl, r0
    cmp r1, r2
    beq .L_28
    ldr r0, _LIT1
    cmp r1, r0
    beq .L_3c
    b .L_4c
.L_28:
    sub r1, r2, #0x3
    sub r0, r2, #0x1
    str r1, [sp]
    str r0, [sp, #0x4]
    b .L_4c
.L_3c:
    ldr r1, _LIT2
    rsb r0, r1, #0x2340
    str r1, [sp]
    str r0, [sp, #0x4]
.L_4c:
    ldr r0, _LIT3
    and r2, sl, #0x1
    mul r1, r2, r0
    ldr r0, _LIT4
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    addls sp, sp, #0x8
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT5
    add r4, sp, #0x0
    add r8, r0, r1
    add r0, r8, #0x18
    add r7, r0, #0x400
    mov fp, r5
.L_88:
    mov r6, fp
.L_8c:
    ldr r0, [r7]
    ldr r9, [r4, r6, lsl #0x2]
    mov r0, r0, lsl #0x13
    mov r1, r9
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_d4
    mov r0, sl
    mov r1, r9
    bl func_ov002_021ca3f0
    cmp r0, #0x0
    beq .L_d4
    mov r0, sl
    mov r1, #0xe
    mov r2, r5
    bl func_ov002_02253458
    b .L_e0
.L_d4:
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_8c
.L_e0:
    ldr r0, [r8, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x4
    bcc .L_88
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00001294
_LIT1: .word 0x00001631
_LIT2: .word 0x00000fc9
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf180
_LIT5: .word data_ov002_022cf16c
