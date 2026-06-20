; func_ov002_022a4874 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_ov002_022cbe10
        .extern data_ov002_022cbf50
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_02037208
        .extern func_0208b0f0
        .extern func_0208c8b0
        .extern func_0208df94
        .extern func_0208e318
        .extern func_0208e334
        .extern func_02091554
        .extern func_02094504
        .global func_ov002_022a4874
        .arm
func_ov002_022a4874:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x60
    mov r4, r0
    mov r0, #0x5
    bl func_0208c8b0
    ldr r1, _LIT0
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x318
    orr r0, r0, #0x5c00
    strh r0, [r1]
    bl func_0208df94
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r2, [r4, #0x4]
    ldr r1, _LIT1
    add r0, sp, #0x40
    ldr r2, [r1, r2, lsl #0x2]
    ldr r1, _LIT2
    bl func_02091554
    add r0, sp, #0x18
    bl func_0201d47c
    add r0, sp, #0x40
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
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
    bl func_0201e5b8
    ldr r0, [sp, #0x18]
    bl func_02006e1c
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    bne .L_1038
    mov r0, #0x87
    sub r1, r0, #0x88
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
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
    bl func_0208b0f0
    rsb r2, r4, #0x0
    str r2, [sp]
    rsb r4, r5, #0x0
    ldr r0, _LIT4
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x10
    str r4, [sp, #0x4]
    bl func_0208e334
    mov r4, #0x10
    ldr r0, _LIT5
    mov r1, #0x8
    mov r2, #0x3f
    mov r3, #0x0
    str r4, [sp]
    bl func_0208e318
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
_LIT1: .word data_ov002_022cbe10
_LIT2: .word data_ov002_022cbf50
_LIT3: .word data_02104f4c
_LIT4: .word 0x04001030
_LIT5: .word 0x04001050
_LIT6: .word 0x04001000
