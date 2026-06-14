; func_ov015_021b47cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104f1c
        .extern data_0210694c
        .extern data_ov000_021b1db4
        .extern data_ov000_021b1ddc
        .extern data_ov015_021b5a8c
        .extern data_ov015_021b5d4c
        .extern data_ov015_021b5e28
        .extern data_ov015_021b5e34
        .extern data_ov015_021b5e44
        .extern data_ov015_021b5e54
        .extern data_ov015_021b6270
        .extern data_ov015_021b6694
        .extern data_ov015_021b6794
        .extern data_ov015_021b68bc
        .extern data_ov015_021b68c0
        .extern func_02001a34
        .extern func_0200592c
        .extern func_02005bfc
        .extern func_0200a2f4
        .extern func_0207deb0
        .extern func_0207e8b8
        .extern func_0207f138
        .extern func_0207f420
        .extern func_0208c8cc
        .extern func_0208cc90
        .extern func_0208d030
        .extern func_0208d0bc
        .extern func_0208d138
        .extern func_0208d1e4
        .extern func_0208d7ac
        .extern func_0208d8c0
        .extern func_0208da2c
        .extern func_02094504
        .extern func_ov005_021aaf08
        .extern func_ov005_021ab00c
        .extern func_ov005_021ab32c
        .extern func_ov005_021ab3c8
        .extern func_ov005_021ab3e8
        .extern func_ov005_021acacc
        .extern func_ov005_021acad4
        .extern func_ov015_021b235c
        .extern func_ov015_021b2864
        .extern func_ov015_021b2bf8
        .extern func_ov015_021b3578
        .extern func_ov015_021b3ecc
        .extern func_ov015_021b3f98
        .extern func_ov015_021b4040
        .global func_ov015_021b47cc
        .arm
func_ov015_021b47cc:
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
    bl func_0207deb0
    bl func_0200592c
    ldr r0, _LIT4
    bl func_0208d1e4
    mov r0, #0x0
    mov r1, #0x6800000
    mov r2, #0xa4000
    bl func_02094504
    bl func_0208cc90
    ldr r0, _LIT5
    bl func_0207e8b8
    mov r0, #0xf
    bl func_02001a34
    bl func_ov015_021b2bf8
    ldr r4, _LIT6
    mov r0, #0x200
    ldrh r3, [r4]
    mov r1, #0x7000000
    mov r2, #0x400
    orr r3, r3, #0x8000
    strh r3, [r4]
    bl func_02094504
    mov r0, #0x0
    mov r1, #0x5000000
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x1
    bl func_0208da2c
    mov r2, #0x4000000
    ldr r1, [r2]
    mov r0, #0x30
    bic r1, r1, #0x7000000
    str r1, [r2]
    ldr r1, [r2]
    bic r1, r1, #0x38000000
    str r1, [r2]
    bl func_0208d8c0
    mov r0, #0x40
    bl func_0208d7ac
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r1
    bl func_0208c8cc
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
    bl func_02005bfc
    bl func_0207f420
    mov r1, #0x0
    ldr r0, _LIT9
    mov r3, r1
    mov r2, #0x80
    bl func_0207f138
    ldr r1, _LIT10
    mov r0, #0x200
    mov r2, #0x400
    bl func_02094504
    ldr r1, _LIT11
    mov r0, #0x0
    mov r2, #0x400
    bl func_02094504
    mov r0, #0x4
    bl func_0208d138
    mov r0, #0x8
    bl func_0208d0bc
    mov r0, #0x80
    bl func_0208d030
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
    bl func_02005bfc
    ldr r2, _LIT13
    ldr r0, _LIT8
    ldr r1, [r2]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2]
    bl func_0207f420
    ldr r0, _LIT14
    mov r1, #0x0
    mov r2, #0x80
    mov r3, #0x1
    bl func_0207f138
    ldr r0, _LIT15
    ldr r1, _LIT16
    bl func_ov015_021b3578
    ldr r0, _LIT17
    ldr r1, _LIT18
    str r0, [r1, #0x864]
    bl func_ov015_021b235c
    ldr r0, _LIT19
    bl func_ov015_021b2864
    ldr r0, _LIT20
    ldr r1, _LIT18
    ldr r2, _LIT21
    str r0, [r1, #0x890]
    str r2, [r1, #0x894]
    bl func_ov005_021aaf08
    ldr r0, _LIT22
    ldrh r8, [r0, #0xa4]
    cmp r8, #0x0
    ble .L_2d4
    ldr r0, [r6, #0x874]
    mov r1, r8
    bl func_ov005_021ab00c
    str r0, [r6, #0x87c]
    cmp r8, #0x1
    mov r7, #0x1
    blt .L_2dc
    mov r4, #0x4
    mov r5, r7
.L_258:
    sub r0, r7, #0x1
    bl func_0200a2f4
    mov r9, r0
    ldrh r3, [r9]
    ldr r0, [r6, #0x874]
    mov r1, r7
    mov r2, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x10
    mov r3, r3, lsr #0x18
    bl func_ov005_021ab3c8
    ldr r0, [r6, #0x874]
    mov r1, r7
    mov r2, r5
    bl func_ov005_021ab32c
    ldrh r0, [r9, #0x4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_2b8
    ldr r0, [r6, #0x874]
    mov r1, r7
    mov r2, r4
    bl func_ov005_021ab32c
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
    bl func_ov005_021ab3e8
    ldr r2, [r6, #0x878]
    ldr r1, _LIT25
    ldrh r0, [r2, #0x5c]
    bic r0, r0, #0x3c0
    orr r0, r0, #0x40
    strh r0, [r2, #0x5c]
    ldr r0, [r6, #0x878]
    bl func_ov005_021acacc
    ldr r0, [r6, #0x878]
    ldr r1, _LIT26
    bl func_ov005_021acad4
.L_35c:
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov015_021b5e44
_LIT1: .word 0x00000a88
_LIT2: .word data_02104f1c
_LIT3: .word data_ov015_021b5e34
_LIT4: .word 0x000001ff
_LIT5: .word data_ov015_021b6794
_LIT6: .word 0x04000304
_LIT7: .word 0x0400000e
_LIT8: .word 0xffcfffef
_LIT9: .word data_ov015_021b5e54
_LIT10: .word 0x07000400
_LIT11: .word 0x05000400
_LIT12: .word 0x04001008
_LIT13: .word 0x04001000
_LIT14: .word data_ov015_021b6270
_LIT15: .word data_ov015_021b68bc
_LIT16: .word data_ov015_021b68c0
_LIT17: .word data_ov015_021b5d4c
_LIT18: .word data_ov015_021b5e28
_LIT19: .word data_ov015_021b6694
_LIT20: .word data_ov000_021b1db4
_LIT21: .word data_ov000_021b1ddc
_LIT22: .word data_0210694c
_LIT23: .word data_ov015_021b5a8c
_LIT24: .word func_ov015_021b3ecc
_LIT25: .word func_ov015_021b3f98
_LIT26: .word func_ov015_021b4040
