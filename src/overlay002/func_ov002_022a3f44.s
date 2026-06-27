; func_ov002_022a3f44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cbed8
        .extern data_ov002_022cbef8
        .extern data_ov002_022cbf18
        .extern data_ov002_022cbf34
        .extern data_ov002_022d1b7c
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201174c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208cf44
        .extern func_0208cf58
        .extern func_0208da2c
        .extern func_0208df94
        .extern func_0208e014
        .extern func_0208e0a0
        .extern func_0208e120
        .extern func_0208e2f4
        .extern func_02094504
        .extern func_ov002_022b809c
        .global func_ov002_022a3f44
        .arm
func_ov002_022a3f44:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    bl func_0201174c
    cmp r0, #0x0
    mov r1, #0x4
    mov r2, #0x0
    beq .L_3fc
    ldr r0, _LIT0
    bl func_02006c0c
    mov r4, r0
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    b .L_418
.L_3fc:
    ldr r0, _LIT2
    bl func_02006c0c
    mov r4, r0
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
.L_418:
    mov r5, r0
    mov r1, #0x33
    ldr r0, _LIT4
    sub r2, r1, #0x43
    bl func_0208e2f4
    mov r1, #0x33
    ldr r0, _LIT5
    sub r2, r1, #0x43
    bl func_0208e2f4
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_0208cf58
    bl func_0208cf44
    mov r0, #0x60
    bl func_0208da2c
    mov r0, #0x1
    mov r1, #0x5
    mov r2, r0
    bl func_0208c8cc
    ldr r1, _LIT6
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x4700
    strh r0, [r1]
    bl func_0208e120
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r1, _LIT7
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x304
    orr r0, r0, #0x4c00
    strh r0, [r1]
    bl func_0208e014
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    add r0, sp, #0x28
    bl func_0201d47c
    mov r1, #0x0
    ldrh r0, [sp, #0x3c]
    str r4, [sp, #0x28]
    str r1, [sp, #0x30]
    bic r0, r0, #0xf
    orr r0, r0, #0x2
    strh r0, [sp, #0x3c]
    str r1, [sp, #0x34]
    add r0, sp, #0x28
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    add r0, sp, #0x28
    bl func_0201d47c
    mov r2, #0x0
    ldrh r3, [sp, #0x3c]
    sub r1, r2, #0x1
    add r0, sp, #0x28
    bic r3, r3, #0xf
    orr r3, r3, #0x3
    str r5, [sp, #0x28]
    strh r3, [sp, #0x3c]
    str r2, [sp, #0x30]
    str r2, [sp, #0x34]
    strh r1, [sp, #0x38]
    bl func_0201e5b8
    mov r0, #0x5
    bl func_0208c8b0
    ldr r1, _LIT8
    ldrh r0, [r1]
    bic r0, r0, #0x3
    strh r0, [r1]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0xe10
    orr r0, r0, #0x5000
    strh r0, [r1]
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r1, _LIT9
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
    add r0, sp, #0x0
    bl func_0201d47c
    mov r0, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x14]
    mov r0, #0x200
    ldrh r2, [sp, #0x14]
    strh r0, [sp, #0x10]
    ldr r1, [sp, #0x18]
    orr r0, r2, #0x10
    strh r0, [sp, #0x14]
    bic r0, r1, #0x1c000
    orr r0, r0, #0x1c000
    str r0, [sp, #0x18]
    add r0, sp, #0x0
    str r4, [sp]
    bl func_0201e5b8
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r1, [sp, #0x14]
    mov ip, #0x0
    ldr r0, [sp, #0x18]
    bic r1, r1, #0xf
    orr r1, r1, #0x8
    strh r1, [sp, #0x14]
    ldrh r1, [sp, #0x14]
    bic r0, r0, #0x1c000
    orr r2, r0, #0x1c000
    orr r3, r1, #0x10
    mov r1, #0x200
    add r0, sp, #0x0
    str r5, [sp]
    str ip, [sp, #0x8]
    str ip, [sp, #0xc]
    strh r3, [sp, #0x14]
    str r2, [sp, #0x18]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    mov r0, r5
    bl Task_Invoke
    ldr r0, _LIT10
    mov r1, #0x1a
    mov r2, #0x0
    bl func_ov002_022b809c
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cbed8
_LIT1: .word data_ov002_022cbef8
_LIT2: .word data_ov002_022cbf18
_LIT3: .word data_ov002_022cbf34
_LIT4: .word 0x04000050
_LIT5: .word 0x04001050
_LIT6: .word 0x0400000c
_LIT7: .word 0x0400000e
_LIT8: .word 0x0400100c
_LIT9: .word 0x0400100e
_LIT10: .word data_ov002_022d1b7c
