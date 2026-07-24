; func_ov002_022a4764 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov002_022cbd1c
        .extern data_ov002_022cbe5c
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_020371b8
        .extern func_0208b008
        .extern func_0208c7c8
        .extern func_0208deac
        .extern func_0208e230
        .extern G2x_SetBGyAffine_
        .extern OS_SPrintf
        .extern func_02094410
        .global func_ov002_022a4764
        .arm
func_ov002_022a4764:
    stmdb sp!, {r3, r4, r5, lr}
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
    orr r0, r0, #0x318
    orr r0, r0, #0x5c00
    strh r0, [r1]
    bl func_0208deac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094410
    ldr r2, [r4, #0x4]
    ldr r1, _LIT1
    add r0, sp, #0x40
    ldr r2, [r1, r2, lsl #0x2]
    ldr r1, _LIT2
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
    orr r0, r0, #0x8
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
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    bne .L_1038
    mov r0, #0x87
    sub r1, r0, #0x88
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_1038:
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
    mov r1, #0xc00
    movne r5, #0x48
    add r0, sp, #0x8
    mov r2, r1
    moveq r5, #0x58
    bl func_0208b008
    rsb r2, r4, #0x0
    str r2, [sp]
    rsb r4, r5, #0x0
    ldr r0, _LIT4
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl G2x_SetBGyAffine_
    mov r4, #0x10
    ldr r0, _LIT5
    mov r1, #0x8
    mov r2, #0x3f
    mov r3, #0x0
    str r4, [sp]
    bl func_0208e230
    ldr r2, _LIT6
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0400100e
_LIT1: .word data_ov002_022cbd1c
_LIT2: .word data_ov002_022cbe5c
_LIT3: .word data_02104e6c
_LIT4: .word 0x04001030
_LIT5: .word 0x04001050
_LIT6: .word 0x04001000
