; func_ov002_022a4dc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022d0ef4
        .extern data_ov002_022d0f04
        .extern func_0208b008
        .extern func_0208e230
        .extern func_0208e334
        .global func_ov002_022a4dc8
        .arm
func_ov002_022a4dc8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x4]
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1e
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mvnne r5, #0xb
    ldr r1, [r7, #0x8]
    add r0, r2, r2, lsr #0x1f
    moveq r5, #0xc
    movs r0, r0, asr #0x1
    add r1, r1, #0x1
    ldr r0, _LIT1
    str r1, [r7, #0x8]
    ldr r0, [r0]
    movne r6, #0x48
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    moveq r6, #0x58
    cmp r1, #0x8
    bic r4, r0, #0xc
    bge .L_d8
    rsb r0, r1, #0x8
    mov r2, r0, lsl #0xc
    mov r0, r2, asr #0x2
    add r3, r2, r0, lsr #0x1d
    mov r1, #0x1000
    add r0, sp, #0x18
    mov r2, r1
    mov r8, r3, asr #0x3
    bl func_0208b008
    add r1, r8, #0x1000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    ldr r1, [r7, #0x8]
    ldr r0, _LIT2
    mov r3, r1, lsl #0x1
    rsb r1, r3, #0x10
    str r1, [sp]
    mov r1, #0x8
    mov r2, #0x3f
    bl func_0208e230
    ldr r2, _LIT1
    orr r0, r4, #0x8
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_298
.L_d8:
    cmp r1, #0x10
    bge .L_128
    mov r1, #0x1000
    add r0, sp, #0x18
    mov r2, r1
    bl func_0208b008
    mov r1, #0x1000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    ldr r0, _LIT2
    mov r1, #0x0
    sub r2, r0, #0x50
    strh r1, [r0]
    ldr r1, [r2]
    orr r0, r4, #0x8
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_298
.L_128:
    cmp r1, #0x20
    bge .L_18c
    mov r1, #0x1000
    add r0, sp, #0x18
    mov r2, r1
    bl func_0208b008
    mov r1, #0x1000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    ldr r1, [r7, #0x8]
    ldr r0, _LIT2
    sub r3, r1, #0x10
    rsb r1, r3, #0x10
    str r1, [sp]
    mov r1, #0x4
    mov r2, #0x3f
    bl func_0208e230
    ldr r2, _LIT1
    orr r0, r4, #0xc
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_298
.L_18c:
    cmp r1, #0x28
    bge .L_1dc
    mov r1, #0x1000
    add r0, sp, #0x18
    mov r2, r1
    bl func_0208b008
    mov r1, #0x1000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    ldr r0, _LIT2
    mov r1, #0x0
    sub r2, r0, #0x50
    strh r1, [r0]
    ldr r1, [r2]
    orr r0, r4, #0x4
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_298
.L_1dc:
    cmp r1, #0x30
    bge .L_25c
    sub r0, r1, #0x28
    mov r1, r0, lsl #0xc
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r2, r0, asr #0x3
    add r1, r2, #0x1000
    add r0, sp, #0x18
    add r2, r2, #0x1000
    bl func_0208b008
    mov r1, #0x1000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    ldr r1, [r7, #0x8]
    ldr r0, _LIT2
    sub r1, r1, #0x28
    mov r1, r1, lsl #0x1
    rsb r3, r1, #0x10
    rsb r1, r3, #0x10
    str r1, [sp]
    mov r1, #0x4
    mov r2, #0x3f
    bl func_0208e230
    ldr r2, _LIT1
    orr r0, r4, #0x4
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    b .L_298
.L_25c:
    mov r1, #0x1000
    add r0, sp, #0x18
    mov r2, r1
    bl func_0208b008
    mov r1, #0x1000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    ldr r2, _LIT1
    mov r0, #0x0
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    orr r1, r1, r4, lsl #0x8
    str r1, [r2]
    str r0, [r7]
.L_298:
    rsb r5, r5, #0x0
    ldr r0, _LIT3
    add r1, sp, #0x18
    str r5, [sp]
    rsb r4, r6, #0x0
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_0208e334
    str r5, [sp]
    ldr r0, _LIT4
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_0208e334
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104e6c
_LIT1: .word 0x04001000
_LIT2: .word 0x04001050
_LIT3: .word data_ov002_022d0ef4
_LIT4: .word data_ov002_022d0f04
