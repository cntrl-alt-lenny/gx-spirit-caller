; func_ov006_021c4db8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021cdd0c
        .extern func_02001cec
        .extern func_02001d48
        .extern func_02001d78
        .extern func_02004f3c
        .extern func_02005538
        .extern func_0202c06c
        .extern func_0208dcb4
        .extern func_02094410
        .global func_ov006_021c4db8
        .arm
func_ov006_021c4db8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    bl func_0208dcb4
    add r0, r0, #0x2040
    add r7, r0, #0x4000
    mov r1, r7
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094410
    ldr r1, [sl, #0x58]
    ldr r0, _LIT0
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    mov r2, #0x3
    cmp r0, #0x2
    moveq r0, #0x2
    movne r0, #0x1
    cmp r0, #0x2
    add r0, sl, #0x10
    bne .L_328
    mov r1, #0x10
    bl func_02001cec
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, sl, #0x10
    mov r1, #0x5
    bl func_02001d78
    mov r5, #0xc
    ldr r4, _LIT1
    mov r9, #0x0
    mov r6, r5
    mov fp, #0x5
.L_290:
    add r0, r9, #0x5b
    add r0, r0, #0x400
    bl func_0202c06c
    mov r1, r6
    mov r2, fp
    mov r8, r0
    bl func_02005538
    cmp r9, #0x0
    moveq r1, #0x43
    ldr r2, [r4, #0x4]
    movne r1, #0x3b
    add r0, r0, r0, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    ldr r1, [sl, #0x64]
    mov r2, r2, lsl #0x1d
    cmp r9, r1
    moveq r1, #0x5
    movne r1, #0x6
    str r1, [sp]
    movs r2, r2, lsr #0x1d
    moveq r3, #0x4
    movne r3, #0x6
    cmp r9, #0x0
    moveq r2, #0x0
    movne r2, #0x600
    add r3, r0, r3
    mov r1, r8
    add r2, r7, r2
    add r0, sl, #0x10
    str r5, [sp, #0x4]
    bl func_02004f3c
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_290
    add r0, sl, #0x10
    mvn r1, #0x0
    bl func_02001d78
    b .L_3a0
.L_328:
    mov r1, #0x20
    bl func_02001cec
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    add r0, sl, #0x10
    mov r1, #0x5
    bl func_02001d78
    ldr r0, _LIT2
    bl func_0202c06c
    mov r1, #0xc
    mov r2, #0x5
    mov r4, r0
    bl func_02005538
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r3, r0, #0x80
    mov r0, #0x5
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    mov r1, r4
    mov r2, r7
    add r0, sl, #0x10
    bl func_02004f3c
    add r0, sl, #0x10
    mvn r1, #0x0
    bl func_02001d78
.L_3a0:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021cdd0c
_LIT1: .word data_02104e6c
_LIT2: .word 0x0000045b
