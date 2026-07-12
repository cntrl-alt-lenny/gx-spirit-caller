; func_ov010_021b5b3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8c44
        .extern data_ov010_021b9160
        .extern data_ov010_021b9170
        .extern data_ov010_021b9194
        .extern data_ov010_021b9384
        .extern func_0207eb80
        .extern func_0207ecac
        .extern func_0207ef74
        .extern func_0208c75c
        .extern func_0208c79c
        .extern func_ov010_021b2824
        .extern func_ov010_021b4784
        .global func_ov010_021b5b3c
        .arm
func_ov010_021b5b3c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r0, _LIT1
    str r1, [sp]
    ldr r4, _LIT2
    bl func_0208c75c
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
    bl func_0207ecac
    ldr r0, _LIT4
    bl func_0207eb80
    add r0, sp, #0x0
    bl func_ov010_021b4784
    add r6, r0, #0x0
    ldr r0, _LIT5
    ldr r1, _LIT4
    add r2, sp, #0x0
    bl func_ov010_021b2824
    add r0, r6, r0
    cmp r0, #0x0
    ble .L_15b0
    mov r2, r0, lsl #0x10
    ldr r1, _LIT0
    add r0, r4, #0x10
    mov r2, r2, lsr #0x10
    bl func_0207ef74
.L_15b0:
    ldr r0, _LIT6
    mov r1, r5
    bl func_0208c79c
    ldr r0, _LIT7
    ldr r0, [r0, #0x64]
    cmp r0, #0x0
    bne .L_15f0
    ldr r2, [r4, #0x2c]
    mov r0, #0x2
    ldr r1, [r2, #0x70]
    bic r1, r1, #0x2
    str r1, [r2, #0x70]
    ldr r1, [r4, #0xf8]
    str r0, [r4, #0x4]
    bic r0, r1, #0x1
    str r0, [r4, #0xf8]
.L_15f0:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov010_021b9384
_LIT1: .word 0x0400006c
_LIT2: .word data_ov010_021b9160
_LIT3: .word 0x04001000
_LIT4: .word data_ov010_021b9170
_LIT5: .word data_ov010_021b9194
_LIT6: .word 0x0400106c
_LIT7: .word data_ov010_021b8c44
