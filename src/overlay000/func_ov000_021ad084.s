; func_ov000_021ad084 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020b4748
        .extern data_ov000_021b566c
        .extern data_ov000_021b567c
        .extern data_ov000_021b65e4
        .extern data_ov000_021b6600
        .extern data_ov000_021c758c
        .extern data_ov000_021c75c4
        .extern func_02006c0c
        .extern func_0201d47c
        .extern func_0201d4b4
        .extern func_0201d530
        .extern func_0201e5b8
        .extern func_0201e7e0
        .extern func_0201ef3c
        .extern func_0201ef90
        .extern func_0208c8b0
        .extern func_0208ff84
        .extern func_0208ffec
        .extern func_02094504
        .extern func_ov000_021ab4ec
        .extern func_ov000_021ab8f8
        .extern func_ov000_021acef8
        .extern func_ov000_021ad464
        .extern func_ov000_021af3f0
        .global func_ov000_021ad084
        .arm
func_ov000_021ad084:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x60
    mov r0, #0x1
    mov r1, #0xc
    ldr r4, _LIT0
    bl func_ov000_021ab4ec
    bl func_ov000_021ab8f8
    mov r0, #0x0
    bl func_0208c8b0
    ldr r2, _LIT1
    mov r0, #0x7
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x184
    strh r1, [r2]
    ldrh r1, [r2, #0x2]
    and r1, r1, #0x43
    orr r1, r1, #0x310
    strh r1, [r2, #0x2]
    bl func_0201d4b4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    mov r0, #0x8
    bl func_0201d4b4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r1, _LIT3
    str r0, [r1, #0x298]
    mov r0, #0x1
    bl func_ov000_021acef8
    ldr r0, _LIT3
    ldr r0, [r0, #0x2ac]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    bne .L_300
    add r0, sp, #0x38
    bl func_0201d47c
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0x5e]
    ldrh r3, [sp, #0x4c]
    ldrh r2, [sp, #0x5c]
    bic r1, r1, #0xff
    bic r3, r3, #0xf
    orr r1, r1, #0x20
    strh r1, [sp, #0x5e]
    bic r1, r2, #0xff
    strh r1, [sp, #0x5c]
    orr r3, r3, #0x7
    ldr r2, [sp, #0x50]
    strh r3, [sp, #0x4c]
    bic r5, r2, #0x7f
    mov lr, #0x2040
    mov ip, #0x800
    ldrh r1, [sp, #0x5e]
    bic r7, r5, #0x3f80
    str r0, [sp, #0x38]
    ldrh r6, [sp, #0x5c]
    bic r5, r1, #0xff00
    bic r0, r7, #0x1c000
    orr r7, r5, #0x400
    bic r1, r6, #0xff00
    ldrh r3, [sp, #0x4e]
    mvn r5, #0x0
    ldrh r2, [sp, #0x4c]
    orr r6, r3, #0x4000
    strh r1, [sp, #0x5c]
    orr r3, r2, #0x10
    orr r2, r0, #0x1c000
    add r0, sp, #0x38
    strh r7, [sp, #0x5e]
    strh r6, [sp, #0x4e]
    str r5, [sp, #0x40]
    str lr, [sp, #0x44]
    strh ip, [sp, #0x48]
    strh r3, [sp, #0x4c]
    str r2, [sp, #0x50]
    bl func_0201e5b8
    ldr r0, [r4, #0x26c]
    ldr r1, [sp, #0x38]
    orr r0, r0, #0x20
    str r1, [r4, #0x25c]
    str r0, [r4, #0x26c]
.L_300:
    ldr r0, _LIT5
    mov r1, #0x1a0
    mov r2, #0x20
    bl func_0208ffec
    ldr r0, _LIT5
    mov r1, #0x0
    mov r2, #0x20
    bl func_0208ff84
    ldr r1, [r4, #0x26c]
    mov r0, r1, lsl #0x1b
    movs r0, r0, lsr #0x1f
    bne .L_418
    ldr r0, [r4]
    orr r1, r1, #0x10
    str r1, [r4, #0x26c]
    cmp r0, #0x0
    beq .L_350
    add r1, r4, #0x8
    add r2, r4, #0x28
    bl func_0201ef3c
.L_350:
    ldr r0, _LIT6
    add ip, sp, #0x28
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    bl func_0201e7e0
    mov r0, #0x600
    str r0, [sp]
    mov r1, #0x2
    str r1, [sp, #0x4]
    add r0, sp, #0x28
    str r0, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r1, r4, #0x28
    str r1, [sp, #0x14]
    mov r0, r4
    add r1, r4, #0x4
    add r2, r4, #0x8
    mov r3, #0x1c000
    bl func_0201ef90
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    beq .L_3c0
    add r1, r4, #0x40
    add r2, r4, #0x68
    bl func_0201ef3c
.L_3c0:
    ldr r0, _LIT7
    add ip, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    bl func_0201e7e0
    mov r0, #0x1a0
    str r0, [sp]
    mov r1, #0x1
    str r1, [sp, #0x4]
    add r0, sp, #0x18
    str r0, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r1, #0x20
    str r1, [sp, #0x10]
    add ip, r4, #0x68
    mov r0, r4
    add r1, r4, #0x4
    add r2, r4, #0x40
    mov r3, #0x1c400
    str ip, [sp, #0x14]
    bl func_0201ef90
.L_418:
    mov r0, #0x8
    bl func_0201d4b4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    mov r0, #0x8
    bl func_0201d530
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094504
    ldr r0, _LIT3
    ldr r0, [r0, #0x2b0]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    bne .L_464
    bl func_ov000_021af3f0
    b .L_46c
.L_464:
    mov r0, #0x0
    bl func_ov000_021ad464
.L_46c:
    ldr r2, _LIT8
    mov r0, #0x1c00000
    str r0, [r2]
    str r0, [r2, #0x4]
    sub r1, r2, #0xe
    ldrh r0, [r1]
    sub r4, r2, #0xc
    sub r3, r2, #0xa
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1]
    ldrh r2, [r4]
    mov r0, #0x1
    mov r1, #0x4
    bic r2, r2, #0x3
    orr r2, r2, #0x1
    strh r2, [r4]
    ldrh r2, [r3]
    bic r2, r2, #0x3
    strh r2, [r3]
    bl func_ov000_021ab4ec
    mov r0, #0x1
    add sp, sp, #0x60
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov000_021c75c4
_LIT1: .word 0x0400100c
_LIT2: .word data_ov000_021b65e4
_LIT3: .word data_ov000_021c758c
_LIT4: .word data_ov000_021b6600
_LIT5: .word data_020b4748
_LIT6: .word data_ov000_021b566c
_LIT7: .word data_ov000_021b567c
_LIT8: .word 0x04001018
