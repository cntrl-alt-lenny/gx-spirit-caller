; func_ov004_021d06ac - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern data_02104c78
        .extern data_02104c7a
        .extern data_02104f4c
        .extern data_02105989
        .extern data_ov004_02209e10
        .extern data_ov004_02209e28
        .extern data_ov004_02209e44
        .extern data_ov004_02209e60
        .extern data_ov004_02209e70
        .extern data_ov004_02209e88
        .extern data_ov004_02209ea0
        .extern data_ov004_0220b500
        .extern func_02001bc8
        .extern func_02001d0c
        .extern func_02001d68
        .extern func_02001e94
        .extern func_02005088
        .extern func_020054a4
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201cfe0
        .extern func_0201d47c
        .extern func_0201d760
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_0208dd9c
        .extern func_0208deec
        .extern func_0208e014
        .extern func_0208e1ac
        .extern func_02094504
        .extern func_02094550
        .extern func_ov004_021c9fcc
        .extern func_ov004_021cfbec
        .extern func_ov004_021cfc64
        .extern func_ov004_021cfe08
        .extern func_ov004_021d0530
        .extern func_ov004_021d05f4
        .global func_ov004_021d06ac
        .arm
func_ov004_021d06ac:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xe8
    ldr r5, _LIT0
    mov r2, #0x0
    add r1, r5, #0x3000
    mov r3, r2
.L_2d8:
    add r0, r5, r2, lsl #0x2
    add r0, r0, #0x3000
    str r3, [r0, #0xc64]
    str r3, [r0, #0xc6c]
    str r3, [r0, #0xc74]
    add r2, r2, #0x1
    str r3, [r1, #0xc7c]
    cmp r2, #0x2
    blt .L_2d8
    add r0, r5, #0x3000
    ldr r1, [r0, #0xc0c]
    str r3, [r0, #0xc80]
    cmp r1, #0x0
    movle r3, #0x2
    add r0, r5, #0x3000
    str r3, [r0, #0xc84]
    bl func_ov004_021cfe08
    ldr r3, _LIT1
    mov r1, #0x0
    ldrh r2, [r3]
    add r0, sp, #0xc0
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r3]
    str r1, [r3, #0xe]
    ldrh r1, [r3]
    and r1, r1, #0x43
    orr r1, r1, #0x188
    orr r1, r1, #0xc00
    strh r1, [r3]
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r1, [sp, #0xd4]
    str r0, [sp, #0xc0]
    ldr r2, [sp, #0xd8]
    bic r0, r1, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0xd4]
    add r0, r5, #0xd8
    add r0, r0, #0x5400
    str r0, [sp, #0xc8]
    bic r0, r2, #0x1c000
    ldrh r1, [sp, #0xd4]
    orr r0, r0, #0xc000
    str r0, [sp, #0xd8]
    orr r2, r1, #0x10
    mov r1, #0x1800
    str r1, [sp, #0xcc]
    mov r1, #0x0
    add r0, sp, #0xc0
    strh r2, [sp, #0xd4]
    strh r1, [sp, #0xd0]
    bl func_0201e5b8
    ldr r0, [sp, #0xc0]
    bl func_02006e1c
    bl func_0208e014
    mov r1, r0
    add r0, r5, #0xd8
    add r0, r0, #0x5400
    mov r2, #0x600
    bl func_02094550
    add r0, sp, #0xc0
    bl func_0201d47c
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0xc0]
    mov r0, #0x0
    ldrh r1, [sp, #0xd4]
    str r0, [sp, #0xcc]
    bic r0, r1, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0xd4]
    add r0, r5, #0x258
    add r0, r0, #0x5000
    str r0, [sp, #0xc8]
    ldrh r0, [sp, #0xd4]
    ldr r1, [sp, #0xd8]
    orr r0, r0, #0x10
    bic r1, r1, #0x1c000
    strh r0, [sp, #0xd4]
    mov r0, #0x200
    orr r1, r1, #0xc000
    strh r0, [sp, #0xd0]
    add r0, sp, #0xc0
    str r1, [sp, #0xd8]
    bl func_0201e5b8
    ldr r0, [sp, #0xc0]
    bl func_02006e1c
    add r0, sp, #0xc0
    bl func_0201d47c
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r2, [sp, #0xd8]
    mov r6, #0xc00
    bic r2, r2, #0x1c000
    orr r3, r2, #0xc000
    ldrh r1, [sp, #0xd4]
    str r0, [sp, #0xc0]
    str r6, [sp, #0xcc]
    bic r0, r1, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0xd4]
    ldrh r1, [sp, #0xd4]
    add r0, r5, #0x358
    add r4, r0, #0x5000
    orr r2, r1, #0x10
    mov r1, #0x400
    add r0, sp, #0xc0
    str r4, [sp, #0xc8]
    str r3, [sp, #0xd8]
    strh r2, [sp, #0xd4]
    strh r1, [sp, #0xd0]
    bl func_0201e5b8
    ldr r0, [sp, #0xc0]
    bl func_02006e1c
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r1, r1, r0, lsl #0x8
    ldr r0, _LIT0
    str r1, [r2]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_598
    add r0, r5, #0xf90
    mov r2, #0x0
    str r2, [r5, #0x5c]
    mov r4, #0x1
    ldr r1, _LIT5
    add r0, r0, #0x5000
    mov r2, #0x2
    mov r3, r6
    str r4, [sp]
    bl func_ov004_021c9fcc
    mov r0, #0x14
    mov r1, #0x0
    bl func_ov004_021cfbec
    mov r6, #0x0
    mov r8, r5
    mov r9, r6
    mov r4, r6
.L_538:
    add r2, r5, r6, lsl #0x2
    add r0, r2, #0x3000
    ldr r1, [r0, #0xc0c]
    add r0, r2, #0xc
    mov r7, r4
    cmp r1, #0x0
    add sl, r0, #0x3c00
    ble .L_57c
.L_558:
    add r0, r8, r7, lsl #0x2
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc14]
    add r0, r7, r9
    bl func_ov004_021cfbec
    ldr r0, [sl]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_558
.L_57c:
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0x28
    add r9, r9, #0xa
    blt .L_538
    add sp, sp, #0xe8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_598:
    add r2, r2, #0x1000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x7
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r3, _LIT6
    mov r1, #0x0
    ldrh r2, [r3]
    add r0, sp, #0x98
    bic r2, r2, #0x3
    orr r2, r2, #0x3
    strh r2, [r3]
    str r1, [r3, #0xc]
    ldrh r1, [r3]
    and r1, r1, #0x43
    orr r1, r1, #0x8c
    orr r1, r1, #0x400
    strh r1, [r3]
    bl func_0201d47c
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r3, #0x0
    ldr r1, [sp, #0xb0]
    mov r4, #0x40
    ldrh r2, [sp, #0xac]
    str r0, [sp, #0x98]
    bic r1, r1, #0x1c000
    bic r0, r2, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0xac]
    orr r2, r1, #0x8000
    ldrh r0, [sp, #0xac]
    str r4, [sp, #0xa4]
    str r3, [sp, #0xa0]
    orr r1, r0, #0x10
    add r0, sp, #0x98
    str r2, [sp, #0xb0]
    strh r1, [sp, #0xac]
    strh r3, [sp, #0xa8]
    bl func_0201e5b8
    ldr r0, [sp, #0x98]
    bl func_02006e1c
    ldr r2, _LIT8
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xe]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x204
    orr r0, r0, #0x400
    strh r0, [r2]
    bl func_0208dd9c
    mov r1, r0
    mov r0, #0x0
    mov r2, r4
    bl func_02094504
    ldr r0, _LIT9
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x70
    bl func_0201d47c
    ldrh r0, [sp, #0x84]
    mov r3, #0x40
    mov r2, #0x0
    bic r0, r0, #0xf
    orr r6, r0, #0x8
    mov r1, #0x100
    add r0, sp, #0x70
    str r4, [sp, #0x70]
    strh r6, [sp, #0x84]
    str r3, [sp, #0x7c]
    str r2, [sp, #0x78]
    strh r1, [sp, #0x80]
    bl func_0201e5b8
    mov r0, r4
    bl func_02006e1c
    ldr r1, _LIT10
    ldr r2, _LIT11
    add r0, sp, #0x50
    bl func_02001bc8
    ldr r1, _LIT12
    add r0, sp, #0x50
    mov r2, #0x20
    bl func_02094550
    ldr r2, _LIT10
    add r0, sp, #0x50
    mov r1, #0x3040
    bl func_02001bc8
    ldr r1, _LIT13
    add r0, sp, #0x50
    mov r2, #0x20
    bl func_02094550
    ldr r2, _LIT14
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r2]
    str r0, [r2, #0xa]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x208
    strh r0, [r2]
    bl func_0208e1ac
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x800
    bl func_02094504
    ldr r0, _LIT15
    mov r1, #0x12
    mov r2, #0x3
    bl func_02001d0c
    bl func_0208deec
    add r1, r0, #0x20
    mov r0, #0x0
    mov r2, #0x6c0
    bl func_02094504
    bl func_0201cfe0
    ldr r1, _LIT16
    ldrsb r0, [r1, r0]
    bl func_02001d68
    bl func_0201cfe0
    mov r1, #0x1a
    mul r6, r0, r1
    ldr r7, _LIT17
    bl func_0208deec
    mov r4, r0
    add r0, r7, r6
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0x80
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x1
    mov r0, #0x1
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT15
    add r1, r7, r6
    add r2, r4, #0x20
    bl func_02005088
    bl func_0208e1ac
    add r1, r0, #0x5e
    ldr r0, _LIT15
    mov r2, #0x1
    mov r3, #0x0
    bl func_02001e94
    ldr r0, _LIT15
    mov r1, #0x12
    mov r2, #0x3
    bl func_02001d0c
    bl func_0208deec
    add r1, r0, #0x6e0
    mov r0, #0x0
    mov r2, #0x6c0
    bl func_02094504
    ldr r0, _LIT18
    ldrb r0, [r0, #0xa3c]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r6, _LIT19
    bl func_0208deec
    mov r4, r0
    mov r0, r6
    mov r1, #0xc
    bl func_020054a4
    rsb r0, r0, #0x80
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r3, r0, #0x3
    mov r0, #0x5
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT15
    mov r1, r6
    add r2, r4, #0x6e0
    bl func_02005088
    bl func_0208e1ac
    add r0, r0, #0x2
    add r1, r0, #0x500
    ldr r0, _LIT15
    mov r2, #0x37
    mov r3, #0x0
    bl func_02001e94
    ldr r0, _LIT18
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    add r0, r5, #0x3000
    ldr r0, [r0, #0xc84]
    cmp r0, #0x0
    movne r0, #0x9
    moveq r0, #0xc
    add r0, r0, #0xb6
    add r0, r0, #0x300
    bl func_ov004_021d0530
    ldr r4, _LIT20
    ldr r0, _LIT21
    ldr r2, [r4]
    ldr r1, [r4]
    and r2, r2, #0x1f00
    mov r3, r2, lsr #0x8
    bic r2, r1, #0x1f00
    orr r1, r3, #0xe
    orr r3, r2, r1, lsl #0x8
    mov r1, #0x4
    mov r2, #0x0
    str r3, [r4]
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d47c
    mov r0, #0x0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    str r0, [sp, #0x30]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mov r0, #0x20
    strh r0, [sp, #0x38]
    add r0, sp, #0x28
    str r4, [sp, #0x28]
    bl func_0201e5b8
    mov r0, r4
    bl func_0201d760
    add r1, r5, #0x2d8
    add r1, r1, #0x5c00
    mov r2, #0x20
    bl func_02094550
    mov r0, r4
    bl func_02006e1c
    mov r0, #0x1
    str r0, [sp]
    add r0, r5, #0xf90
    ldr r1, _LIT5
    add r0, r0, #0x5000
    mov r2, #0x2
    mov r3, #0xc80
    bl func_ov004_021c9fcc
    ldr r2, _LIT10
    add r0, sp, #0x8
    mov r1, #0x3040
    bl func_02001bc8
    ldr r1, _LIT22
    add r0, sp, #0x8
    mov r2, #0x20
    bl func_02094550
    ldr r0, _LIT23
    bl func_0202c0c0
    mov r1, r0
    mov r0, #0x0
    bl func_ov004_021cfc64
    mov r0, #0x14
    mov r1, #0x0
    bl func_ov004_021cfbec
    mov r6, #0x0
    mov r8, r5
    mov r9, r6
    mov r4, r6
.L_9e4:
    add r2, r5, r6, lsl #0x2
    add r0, r2, #0x3000
    ldr r1, [r0, #0xc0c]
    add r0, r2, #0xc
    mov r7, r4
    cmp r1, #0x0
    add sl, r0, #0x3c00
    ble .L_a28
.L_a04:
    add r0, r8, r7, lsl #0x2
    add r0, r0, #0x3000
    ldr r1, [r0, #0xc14]
    add r0, r7, r9
    bl func_ov004_021cfbec
    ldr r0, [sl]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_a04
.L_a28:
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0x28
    add r9, r9, #0xa
    blt .L_9e4
    mov r0, #0x1
    bl func_ov004_021d05f4
    add sp, sp, #0xe8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x0400000e
_LIT2: .word data_ov004_02209e10
_LIT3: .word data_ov004_02209e28
_LIT4: .word data_ov004_02209e44
_LIT5: .word data_ov004_02209e60
_LIT6: .word 0x0400100c
_LIT7: .word data_ov004_02209e70
_LIT8: .word 0x0400100e
_LIT9: .word data_ov004_02209e88
_LIT10: .word 0x00007fff
_LIT11: .word 0x00003128
_LIT12: .word 0x05000400
_LIT13: .word 0x05000420
_LIT14: .word 0x0400100a
_LIT15: .word data_02102c90
_LIT16: .word data_02104c78
_LIT17: .word data_02104c7a
_LIT18: .word data_02104f4c
_LIT19: .word data_02105989
_LIT20: .word 0x04001000
_LIT21: .word data_ov004_02209ea0
_LIT22: .word 0x05000640
_LIT23: .word 0x000003be
