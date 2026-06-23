; func_ov004_021cb904 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02104e6c
        .extern data_ov004_02209974
        .extern data_ov004_02209988
        .extern data_ov004_022099a0
        .extern data_ov004_022099b4
        .extern data_ov004_022099cc
        .extern data_ov004_022099ec
        .extern data_ov004_02209a00
        .extern data_ov004_0220b2a0
        .extern data_ov004_02210378
        .extern data_ov004_02291388
        .extern func_02001ba8
        .extern func_02001d48
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201d70c
        .extern func_0201e564
        .extern func_0202c06c
        .extern func_0208c858
        .extern func_0208dcb4
        .extern func_0208dd64
        .extern func_0208dfb8
        .extern func_02091554
        .extern func_02094410
        .extern func_0209445c
        .extern func_ov000_021abc70
        .extern func_ov004_021c9eec
        .extern func_ov004_021ca418
        .extern func_ov004_021cb55c
        .extern func_ov004_021cbe80
        .extern func_ov004_021d855c
        .global func_ov004_021cb904
        .arm
func_ov004_021cb904:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf4
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0xe
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x6
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r9, _LIT0
    mov r0, #0x0
    str r0, [r9, #0x44]
    bl func_ov004_021ca418
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d48
    ldr r2, _LIT2
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xc]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x410
    orr r0, r0, #0x4000
    strh r0, [r2]
    bl func_0208dd64
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094410
    bl func_0208dfb8
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x1000
    bl func_02094410
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0xcc
    bl func_0201d428
    ldr r0, _LIT4
    ldr r1, _LIT5
    ldrh r2, [sp, #0xe0]
    str r0, [sp, #0xd4]
    str r4, [sp, #0xcc]
    bic r0, r2, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0xe0]
    mov r0, #0x80
    strh r0, [sp, #0xdc]
    add r0, sp, #0xcc
    str r1, [sp, #0xd8]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r7, _LIT6
    mov sl, #0x1
    add r8, sp, #0xac
    mov fp, #0x4
    add r5, sp, #0xcc
    mvn r4, #0x0
.L_13c:
    mov r0, r8
    mov r1, r7
    add r2, sl, #0x1
    bl func_02091554
    mov r0, r8
    mov r1, fp
    mov r2, #0x0
    bl func_02006bf0
    mov r6, r0
    mov r0, r5
    bl func_0201d428
    add r0, sl, #0x4
    mov r0, r0, lsl #0x5
    ldrh r1, [sp, #0xe0]
    strh r0, [sp, #0xdc]
    str r6, [sp, #0xcc]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0xe0]
    mov r0, r5
    str r4, [sp, #0xd8]
    str r4, [sp, #0xd4]
    bl func_0201e564
    mov r0, r6
    bl func_02006e00
    add sl, sl, #0x1
    cmp sl, #0x4
    blt .L_13c
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0xcc
    bl func_0201d428
    ldrh r1, [sp, #0xe0]
    add r0, r9, #0x258
    add r2, r0, #0x5000
    ldr r3, _LIT8
    bic r1, r1, #0xf
    orr r5, r1, #0x7
    mov r1, #0x80
    add r0, sp, #0xcc
    str r4, [sp, #0xcc]
    strh r5, [sp, #0xe0]
    str r3, [sp, #0xd8]
    str r2, [sp, #0xd4]
    strh r1, [sp, #0xdc]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r2, _LIT9
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
    bl func_0208dcb4
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094410
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x84
    bl func_0201d428
    mov r0, #0x40
    ldrh r1, [sp, #0x98]
    str r0, [sp, #0x90]
    str r4, [sp, #0x84]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x98]
    mov r0, #0x0
    str r0, [sp, #0x8c]
    mov r0, #0x100
    ldrh r1, [sp, #0x98]
    strh r0, [sp, #0x94]
    bic r0, r1, #0x10
    strh r0, [sp, #0x98]
    add r0, sp, #0x84
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT11
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x5c
    bl func_0201d428
    ldrh r0, [sp, #0x70]
    mvn r3, #0x0
    mov r1, #0x400
    bic r0, r0, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x70]
    ldrh r2, [sp, #0x70]
    add r0, sp, #0x5c
    str r4, [sp, #0x5c]
    orr r2, r2, #0x10
    str r3, [sp, #0x68]
    strh r2, [sp, #0x70]
    strh r1, [sp, #0x6c]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r1, _LIT12
    ldr r2, _LIT13
    add r0, sp, #0x3c
    bl func_02001ba8
    ldr r1, _LIT14
    add r0, sp, #0x3c
    mov r2, #0x20
    bl func_0209445c
    ldr r1, _LIT15
    ldr r2, _LIT16
    add r0, sp, #0x3c
    bl func_02001ba8
    ldr r1, _LIT17
    add r0, sp, #0x3c
    mov r2, #0x20
    bl func_0209445c
    mov r0, #0x0
    bl func_ov004_021cbe80
    mov r5, #0x0
    mov r4, #0x80
.L_35c:
    add r0, r5, #0x3b8
    bl func_0202c06c
    mov r1, r0
    mov r2, r4
    add r0, r5, #0x6
    bl func_ov004_021cb55c
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_35c
    ldr r0, _LIT18
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x14
    bl func_0201d428
    ldrh r0, [sp, #0x28]
    mov r3, #0xc00
    mov r2, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x9
    mov r1, #0x20
    strh r0, [sp, #0x28]
    add r0, sp, #0x14
    str r3, [sp, #0x20]
    str r4, [sp, #0x14]
    str r2, [sp, #0x1c]
    strh r1, [sp, #0x24]
    bl func_0201e564
    mov r0, r4
    bl func_0201d70c
    add r1, r9, #0x2d8
    add r1, r1, #0x5c00
    mov r2, #0x20
    bl func_0209445c
    mov r0, r4
    bl func_02006e00
    mov r0, #0x1
    str r0, [sp]
    add r0, r9, #0xf90
    ldr r1, _LIT19
    ldr r3, _LIT20
    add r0, r0, #0x5000
    mov r2, #0x2
    bl func_ov004_021c9eec
    ldr r0, _LIT21
    bl func_ov004_021d855c
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0xe
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0xc
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    bl func_0208c858
    ldr r3, _LIT22
    mov r0, #0x0
    ldr r2, [r3]
    add r1, r9, #0x158
    orr r2, r2, #0x10000
    str r2, [r3]
    mov r2, #0xa0
    bl Fill32
    mvn r2, #0x0
    mov r1, #0x0
    mov r0, #0x2
    str r0, [r9, #0x98]
    str r2, [r9, #0x90]
    str r2, [r9, #0xa8]
    str r2, [r9, #0xac]
    str r2, [r9, #0xb0]
    str r1, [r9, #0xa0]
    mov r0, #0x9d
    str r0, [sp]
    mov r4, #0x14
    str r4, [sp, #0x4]
    str r4, [sp, #0x8]
    ldr r1, [r9, #0x98]
    mov r0, #0x6
    mul r0, r1, r0
    str r0, [sp, #0xc]
    add r0, r9, #0x1f8
    mov r1, #0xe4
    mov r2, #0x22
    mov r3, #0x1a
    str r4, [sp, #0x10]
    bl func_ov000_021abc70
    mov r0, #0x0
    str r0, [r9, #0x94]
    str r0, [r9, #0x8c]
    add sp, sp, #0xf4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02104e6c
_LIT2: .word 0x0400100c
_LIT3: .word data_ov004_02209974
_LIT4: .word data_ov004_02210378
_LIT5: .word 0x00005040
_LIT6: .word data_ov004_02209988
_LIT7: .word data_ov004_022099a0
_LIT8: .word 0x00007040
_LIT9: .word 0x0400100e
_LIT10: .word data_ov004_022099b4
_LIT11: .word data_ov004_022099cc
_LIT12: .word 0x00007fff
_LIT13: .word 0x00003128
_LIT14: .word 0x05000640
_LIT15: .word 0x00003860
_LIT16: .word 0x0000779b
_LIT17: .word 0x05000660
_LIT18: .word data_ov004_022099ec
_LIT19: .word data_ov004_02209a00
_LIT20: .word 0x00008080
_LIT21: .word data_ov004_02291388
_LIT22: .word 0x04001000
