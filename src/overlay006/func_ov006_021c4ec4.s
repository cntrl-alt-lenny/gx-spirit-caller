; func_ov006_021c4ec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov006_021cde2c
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001d98
        .extern func_02004f58
        .extern func_02005554
        .extern func_0202c0c0
        .extern func_0208dd9c
        .extern func_02094504
        .global func_ov006_021c4ec4
        .arm
func_ov006_021c4ec4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    bl func_0208dd9c
    add r0, r0, #0x2040
    add r7, r0, #0x4000
    mov r1, r7
    mov r0, #0x0
    mov r2, #0xc00
    bl func_02094504
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
    bne .L_418
    mov r1, #0x10
    bl func_02001d0c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, sl, #0x10
    mov r1, #0x5
    bl func_02001d98
    mov r5, #0xc
    ldr r4, _LIT1
    mov r9, #0x0
    mov r6, r5
    mov fp, #0x5
.L_380:
    add r0, r9, #0x5b
    add r0, r0, #0x400
    bl func_0202c0c0
    mov r1, r6
    mov r2, fp
    mov r8, r0
    bl func_02005554
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
    bl func_02004f58
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_380
    add r0, sl, #0x10
    mvn r1, #0x0
    bl func_02001d98
    b .L_490
.L_418:
    mov r1, #0x20
    bl func_02001d0c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, sl, #0x10
    mov r1, #0x5
    bl func_02001d98
    ldr r0, _LIT2
    bl func_0202c0c0
    mov r1, #0xc
    mov r2, #0x5
    mov r4, r0
    bl func_02005554
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
    bl func_02004f58
    add r0, sl, #0x10
    mvn r1, #0x0
    bl func_02001d98
.L_490:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021cde2c
_LIT1: .word data_02104f4c
_LIT2: .word 0x0000045b
