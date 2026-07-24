; func_ov002_022a4920 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022d0f04
        .extern data_ov002_022d1330
        .extern func_0208b008
        .extern func_0208e230
        .extern func_0208e2f4
        .extern G2x_SetBGyAffine_
        .extern func_ov002_022aab80
        .global func_ov002_022a4920
        .arm
func_ov002_022a4920:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x4]
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1e
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mvnne r4, #0xb
    add r0, r2, r2, lsr #0x1f
    moveq r4, #0xc
    movs r0, r0, asr #0x1
    movne r5, #0x48
    ldr r0, [r6, #0x8]
    moveq r5, #0x58
    cmp r0, #0x10
    bge .L_ec
    ldr r3, _LIT1
    mov r1, #0x8
    ldr r2, [r3]
    ldr r0, [r3]
    and r2, r2, #0x1f00
    mov ip, r2, lsr #0x8
    bic r2, r0, #0x1f00
    orr r0, ip, #0x8
    orr r0, r2, r0, lsl #0x8
    str r0, [r3]
    ldr r2, [r6, #0x8]
    add r0, r3, #0x50
    add r3, r2, #0x1
    rsb lr, r3, #0x10
    mov ip, lr, lsl #0xa
    mov r2, ip, asr #0x2
    add r2, ip, r2, lsr #0x1d
    mov ip, r2, asr #0x3
    str r3, [r6, #0x8]
    mov r2, #0x3f
    rsb r7, ip, #0x1000
    str lr, [sp]
    bl func_0208e230
    add r0, sp, #0x8
    mov r1, r7
    mov r2, r7
    bl func_0208b008
    rsb r2, r4, #0x0
    str r2, [sp]
    rsb r4, r5, #0x0
    ldr r0, _LIT2
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl G2x_SetBGyAffine_
    mov r0, #0x0
    add sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_ec:
    bne .L_1c8
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    bne .L_140
    mov r1, #0x1000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    rsb r2, r4, #0x0
    str r2, [sp]
    rsb r4, r5, #0x0
    ldr r0, _LIT2
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl G2x_SetBGyAffine_
    ldr r1, _LIT3
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
.L_140:
    ldr r0, [r6, #0xc]
    add r0, r0, #0x1
    str r0, [r6, #0xc]
    ldr r0, [r6, #0x4]
    cmp r0, #0x3
    ldr r0, [r6, #0xc]
    beq .L_188
    cmp r0, #0x10
    movge r2, #0x1
    ldr r1, [r6, #0x8]
    movlt r2, #0x0
    add r1, r1, r2
    str r1, [r6, #0x8]
    ldr r0, _LIT4
    mov r1, #0x0
    strh r1, [r0]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_188:
    cmp r0, #0x20
    movge r1, #0x1
    ldr r0, [r6, #0x8]
    movlt r1, #0x0
    add r0, r0, r1
    str r0, [r6, #0x8]
    ldr r1, [r6, #0xc]
    cmp r1, #0x10
    addgt sp, sp, #0x18
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT4
    rsb r2, r1, #0x10
    mov r1, #0x8
    bl func_0208e2f4
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c8:
    cmp r0, #0x18
    bge .L_200
    add r1, r0, #0x1
    rsb r0, r1, #0x18
    mov r3, r0, lsl #0x1
    str r1, [r6, #0x8]
    rsb r4, r3, #0x10
    ldr r0, _LIT4
    mov r1, #0x8
    mov r2, #0x3f
    str r4, [sp]
    bl func_0208e230
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_200:
    ldr r3, _LIT1
    mov r0, #0x0
    ldr r2, [r3]
    ldr r1, [r3]
    and r2, r2, #0x1f00
    mov r4, r2, lsr #0x8
    bic r2, r1, #0x1f00
    bic r1, r4, #0x8
    orr r1, r2, r1, lsl #0x8
    str r1, [r3]
    strh r0, [r3, #0x50]
    ldr r1, [r6, #0x4]
    ldr r0, _LIT5
    bl func_ov002_022aab80
    mov r0, #0x0
    str r0, [r6]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02104e6c
_LIT1: .word 0x04001000
_LIT2: .word data_ov002_022d0f04
_LIT3: .word 0x0400100e
_LIT4: .word 0x04001050
_LIT5: .word data_ov002_022d1330
