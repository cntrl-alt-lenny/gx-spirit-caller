; func_ov010_021b7d60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8d44
        .extern data_ov010_021b9890
        .extern data_ov010_021b98a8
        .extern data_ov010_021b98cc
        .extern data_ov010_021b9bec
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0207f05c
        .extern func_0208c844
        .extern func_0208c884
        .extern func_ov010_021b2924
        .extern func_ov010_021b6c4c
        .global func_ov010_021b7d60
        .arm
func_ov010_021b7d60:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r4, _LIT2
    bl func_0208c844
    ldr r1, _LIT3
    mov r5, r0
    ldr r0, [r1]
    mov r3, #0x1dc0000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1f00
    str r0, [r1]
    ldrh ip, [r1, #0x8]
    mov r2, #0x0
    ldr r0, _LIT4
    bic ip, ip, #0x3
    orr ip, ip, #0x2
    strh ip, [r1, #0x8]
    ldrh ip, [r1, #0xa]
    bic ip, ip, #0x3
    strh ip, [r1, #0xa]
    ldrh ip, [r1, #0xc]
    bic ip, ip, #0x3
    orr ip, ip, #0x1
    strh ip, [r1, #0xc]
    ldrh ip, [r1, #0xe]
    bic ip, ip, #0x3
    orr ip, ip, #0x3
    strh ip, [r1, #0xe]
    str r3, [r1, #0x10]
    str r2, [r1, #0x14]
    str r2, [r1, #0x18]
    str r2, [r1, #0x1c]
    ldr r2, [r1]
    orr r2, r2, #0x10000
    str r2, [r1]
    bl func_0207ed94
    ldr r0, _LIT4
    bl func_0207ec68
    add r0, sp, #0x0
    bl func_ov010_021b6c4c
    add r6, r0, #0x0
    ldr r0, _LIT5
    ldr r1, _LIT4
    add r2, sp, #0x0
    bl func_ov010_021b2924
    add r0, r6, r0
    cmp r0, #0x0
    ble .L_11f4
    mov r2, r0, lsl #0x10
    ldr r1, _LIT0
    add r0, r4, #0x18
    mov r2, r2, lsr #0x10
    bl func_0207f05c
.L_11f4:
    ldr r0, _LIT6
    mov r1, r5
    bl func_0208c884
    ldr r0, _LIT7
    ldr r0, [r0, #0x64]
    cmp r0, #0x0
    bne .L_1234
    ldr r2, [r4, #0x34]
    mov r0, #0x2
    ldr r1, [r2, #0x70]
    bic r1, r1, #0x2
    str r1, [r2, #0x70]
    ldr r1, [r4, #0x100]
    str r0, [r4]
    bic r0, r1, #0x1
    str r0, [r4, #0x100]
.L_1234:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov010_021b9bec
_LIT1: .word 0x0400006c
_LIT2: .word data_ov010_021b9890
_LIT3: .word 0x04001000
_LIT4: .word data_ov010_021b98a8
_LIT5: .word data_ov010_021b98cc
_LIT6: .word 0x0400106c
_LIT7: .word data_ov010_021b8d44
