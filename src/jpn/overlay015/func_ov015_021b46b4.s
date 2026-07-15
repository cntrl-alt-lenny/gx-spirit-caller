; func_ov015_021b46b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104e3c
        .extern data_0210686c
        .extern data_ov000_021b1cb4
        .extern data_ov000_021b1cdc
        .extern data_ov015_021b5974
        .extern data_ov015_021b5c2c
        .extern data_ov015_021b5d08
        .extern data_ov015_021b5d14
        .extern data_ov015_021b5d24
        .extern data_ov015_021b5d34
        .extern data_ov015_021b6150
        .extern data_ov015_021b6574
        .extern data_ov015_021b6674
        .extern data_ov015_021b679c
        .extern data_ov015_021b67a0
        .extern func_02001a14
        .extern func_02005910
        .extern func_02005be0
        .extern func_0200a2d8
        .extern func_0207ddc8
        .extern func_0207e7d0
        .extern func_0207f050
        .extern func_0207f338
        .extern func_0208c7e4
        .extern func_0208cba8
        .extern func_0208cf48
        .extern func_0208cfd4
        .extern func_0208d050
        .extern func_0208d0fc
        .extern func_0208d6c4
        .extern func_0208d7d8
        .extern func_0208d944
        .extern func_02094410
        .extern func_ov000_021ac9cc
        .extern func_ov005_021aae28
        .extern func_ov005_021aaf2c
        .extern func_ov005_021ab24c
        .extern func_ov005_021ab2e8
        .extern func_ov005_021ab308
        .extern func_ov005_021ac9c4
        .extern func_ov015_021b225c
        .extern func_ov015_021b2764
        .extern func_ov015_021b2af8
        .extern func_ov015_021b3478
        .extern func_ov015_021b3db4
        .extern func_ov015_021b3e80
        .extern func_ov015_021b3f28
        .global func_ov015_021b46b4
        .arm
func_ov015_021b46b4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    ldr r6, _LIT0
    ldr r2, _LIT1
    mov r1, r6
    mov r0, #0x0
    bl Fill32
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207ddc8
    bl func_02005910
    ldr r0, _LIT4
    bl func_0208d0fc
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094410
    bl func_0208cba8
    ldr r0, _LIT5
    bl func_0207e7d0
    mov r0, #0xf
    bl func_02001a14
    bl func_ov015_021b2af8
    ldr r4, _LIT6
    mov r0, #0x200
    ldrh r3, [r4]
    mov r1, #0x7000000
    mov r2, #0x400
    orr r3, r3, #0x8000
    strh r3, [r4]
    bl func_02094410
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x1
    bl func_0208d944
    mov r2, #0x4000000
    ldr r1, [r2]
    mov r0, #0x30
    bic r1, r1, #0x7000000
    str r1, [r2]
    ldr r1, [r2]
    bic r1, r1, #0x38000000
    str r1, [r2]
    bl func_0208d7d8
    mov r0, #0x40
    bl func_0208d6c4
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c7e4
    ldr r4, _LIT7
    mov r3, #0x4000000
    ldrh r2, [r4]
    ldr r1, _LIT8
    mov r0, #0x1
    and r2, r2, #0x43
    orr r2, r2, #0x384
    orr r2, r2, #0x400
    strh r2, [r4]
    ldr r2, [r3]
    and r1, r2, r1
    orr r1, r1, #0x10
    str r1, [r3]
    bl func_02005be0
    bl func_0207f338
    mov r1, #0x0
    ldr r0, _LIT9
    mov r3, r1
    mov r2, #0x80
    bl func_0207f050
    ldr r1, _LIT10
    mov r0, #0x200
    mov r2, #0x400
    bl func_02094410
    ldr r1, _LIT11
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094410
    mov r0, #0x4
    bl func_0208d050
    mov r0, #0x8
    bl func_0208cfd4
    mov r0, #0x80
    bl func_0208cf48
    ldr r2, _LIT12
    mov r0, #0x2
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0xd10
    strh r1, [r2]
    ldrh r1, [r2, #0x2]
    and r1, r1, #0x43
    orr r1, r1, #0xf00
    strh r1, [r2, #0x2]
    ldrh r1, [r2, #0x4]
    and r1, r1, #0x43
    orr r1, r1, #0x388
    orr r1, r1, #0x1c00
    strh r1, [r2, #0x4]
    ldrh r1, [r2, #0x6]
    and r1, r1, #0x43
    orr r1, r1, #0x388
    orr r1, r1, #0x1c00
    strh r1, [r2, #0x6]
    bl func_02005be0
    ldr r2, _LIT13
    ldr r0, _LIT8
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f338
    ldr r0, _LIT14
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f050
    ldr r0, _LIT15
    ldr r1, _LIT16
    bl func_ov015_021b3478
    ldr r0, _LIT17
    ldr r1, _LIT18
    str r0, [r1, #0x864]
    bl func_ov015_021b225c
    ldr r0, _LIT19
    bl func_ov015_021b2764
    ldr r0, _LIT20
    ldr r1, _LIT18
    ldr r2, _LIT21
    str r0, [r1, #0x890]
    str r2, [r1, #0x894]
    bl func_ov005_021aae28
    ldr r0, _LIT22
    ldrh r8, [r0, #0xa4]
    cmp r8, #0x0
    ble .L_2d4
    ldr r0, [r6, #0x874]
    mov r1, r8
    bl func_ov005_021aaf2c
    str r0, [r6, #0x87c]
    cmp r8, #0x1
    mov r7, #0x1
    blt .L_2dc
    mov r4, #0x4
    mov r5, r7
.L_258:
    sub r0, r7, #0x1
    bl func_0200a2d8
    mov r9, r0
    ldrh r3, [r9]
    ldr r0, [r6, #0x874]
    mov r1, r7
    mov r2, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x18
    bl func_ov005_021ab2e8
    ldr r0, [r6, #0x874]
    mov r1, r7
    mov r2, r5
    bl func_ov005_021ab24c
    ldrh r0, [r9, #0x4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_2b8
    ldr r0, [r6, #0x874]
    mov r1, r7
    mov r2, r4
    bl func_ov005_021ab24c
.L_2b8:
    ldrh r0, [r9, #0x4]
    add r7, r7, #0x1
    cmp r7, r8
    orr r0, r0, #0x4
    strh r0, [r9, #0x4]
    ble .L_258
    b .L_2dc
.L_2d4:
    mov r0, #0x0
    str r0, [r6, #0x87c]
.L_2dc:
    ldr r0, [r6, #0x87c]
    cmp r0, #0x0
    beq .L_35c
    ldr r0, _LIT23
    mov r4, #0xf
    ldrh r3, [r0, #0x14]
    ldrh r2, [r0, #0x16]
    ldr r1, _LIT24
    strh r3, [sp, #0x8]
    strh r2, [sp, #0xa]
    ldrh r5, [r0, #0x18]
    ldrh r0, [r0, #0x1a]
    add r2, sp, #0x8
    mov r3, #0x0
    strh r5, [sp, #0xc]
    strh r0, [sp, #0xe]
    str r4, [sp]
    str r1, [sp, #0x4]
    ldr r0, [r6, #0x878]
    ldr r1, [r6, #0x874]
    bl func_ov005_021ab308
    ldr r2, [r6, #0x878]
    ldr r1, _LIT25
    ldrh r0, [r2, #0x5c]
    bic r0, r0, #0x3c0
    orr r0, r0, #0x40
    strh r0, [r2, #0x5c]
    ldr r0, [r6, #0x878]
    bl func_ov005_021ac9c4
    ldr r0, [r6, #0x878]
    ldr r1, _LIT26
    bl func_ov000_021ac9cc
.L_35c:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov015_021b5d24
_LIT1: .word 0x00000a88
_LIT2: .word data_02104e3c
_LIT3: .word data_ov015_021b5d14
_LIT4: .word 0x000001ff
_LIT5: .word data_ov015_021b6674
_LIT6: .word 0x04000304
_LIT7: .word 0x0400000e
_LIT8: .word 0xffcfffef
_LIT9: .word data_ov015_021b5d34
_LIT10: .word 0x07000400
_LIT11: .word 0x05000400
_LIT12: .word 0x04001008
_LIT13: .word 0x04001000
_LIT14: .word data_ov015_021b6150
_LIT15: .word data_ov015_021b679c
_LIT16: .word data_ov015_021b67a0
_LIT17: .word data_ov015_021b5c2c
_LIT18: .word data_ov015_021b5d08
_LIT19: .word data_ov015_021b6574
_LIT20: .word data_ov000_021b1cb4
_LIT21: .word data_ov000_021b1cdc
_LIT22: .word data_0210686c
_LIT23: .word data_ov015_021b5974
_LIT24: .word func_ov015_021b3db4
_LIT25: .word func_ov015_021b3e80
_LIT26: .word func_ov015_021b3f28
