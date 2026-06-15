; func_020484c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02048108
        .extern func_020489c4
        .extern func_02052ddc
        .extern func_02052df4
        .extern func_02052f04
        .extern func_02053644
        .extern func_02055938
        .extern func_02055a18
        .extern func_020aaf40
        .global func_020484c0
        .arm
func_020484c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov r9, r1
    ldr r1, [r9]
    mov sl, r0
    cmp r1, #0x0
    mov fp, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT0
    mov r8, fp
    ldr r1, [r4]
    ldr r0, [r1, #0x14]
    cmp r0, #0x0
    ble .L_2d8
    add r0, r9, #0x8e
    mov r7, fp
    mov r5, #0x1
    str r0, [sp]
.L_1f8:
    ldr r0, [r1, #0x18]
    add r0, r0, r7
    bl func_02053644
    cmp r0, #0x1
    bne .L_260
    bl func_02048108
    ldr r1, [r4]
    add r2, sp, #0x4
    ldr r1, [r1, #0x18]
    add r1, r1, r7
    bl func_02052ddc
    ldr r1, [sp]
    add r0, sp, #0x4
    bl func_020aaf40
    cmp r0, #0x0
    bne .L_2c0
    ldr r1, [r9, #0x4]
    mov r0, sl
    bl func_02055a18
    ldr r0, [r4]
    ldr r1, [r9, #0x4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02052df4
    mov fp, r5
    b .L_2c0
.L_260:
    ldr r0, [r4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02053644
    cmp r0, #0x3
    beq .L_290
    ldr r0, [r4]
    ldr r0, [r0, #0x18]
    add r0, r0, r7
    bl func_02053644
    cmp r0, #0x2
    bne .L_2c0
.L_290:
    ldr r6, [r9, #0x4]
    bl func_02048108
    ldr r1, [r4]
    ldr r1, [r1, #0x18]
    add r1, r1, r7
    bl func_02052f04
    cmp r6, r0
    bne .L_2c0
    mov r0, sl
    mov r1, r6
    bl func_02055a18
    mov fp, r5
.L_2c0:
    ldr r1, [r4]
    add r8, r8, #0x1
    ldr r0, [r1, #0x14]
    add r7, r7, #0xc
    cmp r8, r0
    blt .L_1f8
.L_2d8:
    cmp fp, #0x0
    beq .L_2f0
    ldr r0, [r9, #0x4]
    bl func_020489c4
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_2f0:
    ldr r1, [r9, #0x4]
    mov r0, sl
    bl func_02055938
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219dc80
