; func_ov002_022a4b80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022cbe74
        .extern data_ov002_022d0ef4
        .extern data_ov002_022d0f04
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_020371b8
        .extern func_0208b008
        .extern func_0208c7c8
        .extern func_0208deac
        .extern func_0208dfb8
        .extern G2x_SetBGyAffine_
        .extern OS_SPrintf
        .extern func_02094410
        .global func_ov002_022a4b80
        .arm
func_ov002_022a4b80:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x60
    mov r4, r0
    mov r0, #0x5
    bl func_0208c7c8
    ldr r1, _LIT0
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x5000
    strh r0, [r1]
    bl func_0208dfb8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r1, _LIT1
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x318
    orr r0, r0, #0x5c00
    strh r0, [r1]
    bl func_0208deac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r1, _LIT2
    ldr r2, [r4, #0x4]
    add r0, sp, #0x40
    bl OS_SPrintf
    add r0, sp, #0x18
    bl func_0201d428
    add r0, sp, #0x40
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x18]
    mov r0, #0x0
    ldrh r1, [sp, #0x2c]
    str r0, [sp, #0x20]
    str r0, [sp, #0x24]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x2c]
    mov r0, #0x200
    ldrh r2, [sp, #0x2c]
    strh r0, [sp, #0x28]
    ldr r1, [sp, #0x30]
    orr r0, r2, #0x10
    strh r0, [sp, #0x2c]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x1c000
    str r0, [sp, #0x30]
    add r0, sp, #0x18
    bl func_0201e564
    ldr r0, [sp, #0x18]
    bl func_02006e00
    ldr r1, [r4, #0x4]
    add r0, sp, #0x40
    rsb r2, r1, #0x1
    ldr r1, _LIT2
    bl OS_SPrintf
    add r0, sp, #0x18
    bl func_0201d428
    add r0, sp, #0x40
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, #0x0
    ldrh r2, [sp, #0x2c]
    ldr r1, [sp, #0x30]
    str r0, [sp, #0x18]
    bic r2, r2, #0xf
    orr r2, r2, #0x8
    strh r2, [sp, #0x2c]
    ldrh r2, [sp, #0x2c]
    bic r0, r1, #0x1c000
    mov r1, #0x200
    orr r3, r2, #0x10
    orr r2, r0, #0x1c000
    add r0, sp, #0x18
    str r4, [sp, #0x20]
    str r4, [sp, #0x24]
    strh r3, [sp, #0x2c]
    str r2, [sp, #0x30]
    strh r1, [sp, #0x28]
    bl func_0201e564
    ldr r0, [sp, #0x18]
    bl func_02006e00
    ldr r0, _LIT3
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1b
    mov r2, r0, lsr #0x1e
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    mvnne r4, #0xb
    add r0, r2, r2, lsr #0x1f
    moveq r4, #0xc
    movs r0, r0, asr #0x1
    mov r1, #0x1000
    movne r6, #0x48
    add r0, sp, #0x8
    mov r2, r1
    moveq r6, #0x58
    bl func_0208b008
    rsb r5, r4, #0x0
    ldr r0, _LIT4
    add r1, sp, #0x8
    str r5, [sp]
    rsb r4, r6, #0x0
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl G2x_SetBGyAffine_
    mov r1, #0x2000
    add r0, sp, #0x8
    mov r2, r1
    bl func_0208b008
    str r5, [sp]
    ldr r0, _LIT5
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl G2x_SetBGyAffine_
    mov r0, #0x89
    sub r1, r0, #0x8a
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x60
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0400100c
_LIT1: .word 0x0400100e
_LIT2: .word data_ov002_022cbe74
_LIT3: .word data_02104e6c
_LIT4: .word data_ov002_022d0ef4
_LIT5: .word data_ov002_022d0f04
