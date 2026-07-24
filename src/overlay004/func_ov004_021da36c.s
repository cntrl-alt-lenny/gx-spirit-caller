; func_ov004_021da36c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern Task_Invoke
        .extern data_02104f4c
        .extern data_ov004_02200e00
        .extern data_ov004_0220a1b4
        .extern data_ov004_0220a1c8
        .extern data_ov004_0220a1e0
        .extern data_ov004_0220a1f4
        .extern data_ov004_0220a20c
        .extern data_ov004_0220a22c
        .extern data_ov004_0220a240
        .extern data_ov004_0220b500
        .extern data_ov004_022105d8
        .extern func_02001bc8
        .extern func_02001d68
        .extern func_02006c0c
        .extern func_0201d47c
        .extern func_0201d760
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_0208dd9c
        .extern func_0208de4c
        .extern func_0208e0a0
        .extern OS_SPrintf
        .extern func_02094504
        .extern func_02094550
        .extern func_ov000_021abd50
        .extern func_ov004_021c9fcc
        .extern func_ov004_021d9fc4
        .extern func_ov004_021da874
        .global func_ov004_021da36c
        .arm
func_ov004_021da36c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xf4
    ldr r0, _LIT0
    ldr r9, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_02001d68
    ldr r2, _LIT2
    mov r0, #0x0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r2]
    str r0, [r2, #0xc]
    ldrh r0, [r2]
    and r0, r0, #0x43
    orr r0, r0, #0x8
    orr r0, r0, #0x4400
    strh r0, [r2]
    bl func_0208de4c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094504
    bl func_0208e0a0
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x1000
    bl func_02094504
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0xcc
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    mov sl, #0x0
    mov fp, #0x2
    mov r8, #0x6
    add r7, sp, #0xac
    add r5, sp, #0xcc
    mvn r4, #0x0
.L_e8:
    cmp sl, #0x0
    movne r2, r8
    ldr r1, _LIT6
    moveq r2, fp
    mov r0, r7
    bl OS_SPrintf
    mov r0, r7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r6, r0
    mov r0, r5
    bl func_0201d47c
    add r0, sl, #0x5
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
    bl func_0201e5b8
    mov r0, r6
    bl Task_Invoke
    add sl, sl, #0x1
    cmp sl, #0x2
    blt .L_e8
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0xcc
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
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
    bl func_0208dd9c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x84
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT11
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x5c
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r1, _LIT12
    ldr r2, _LIT13
    add r0, sp, #0x3c
    bl func_02001bc8
    ldr r1, _LIT14
    add r0, sp, #0x3c
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT15
    ldr r2, _LIT16
    add r0, sp, #0x3c
    bl func_02001bc8
    ldr r1, _LIT17
    add r0, sp, #0x3c
    mov r2, #0x20
    bl func_02094550
    mov r0, #0x0
    bl func_ov004_021da874
    ldr r2, _LIT18
    mov r4, #0x0
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0xc
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r6, _LIT19
    mov r5, #0x80
.L_338:
    ldr r0, [r6, r4, lsl #0x2]
    add r0, r0, #0xb6
    add r0, r0, #0x300
    bl func_0202c0c0
    mov r1, r0
    mov r2, r5
    add r0, r4, #0x6
    bl func_ov004_021d9fc4
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_338
    ldr r0, _LIT20
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x14
    bl func_0201d47c
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
    bl func_0201e5b8
    mov r0, r4
    bl func_0201d760
    add r1, r9, #0x2d8
    add r1, r1, #0x5c00
    mov r2, #0x20
    bl func_02094550
    mov r0, r4
    bl Task_Invoke
    mov r0, #0x1
    str r0, [sp]
    add r0, r9, #0xf90
    ldr r1, _LIT21
    ldr r3, _LIT22
    add r0, r0, #0x5000
    mov r2, #0x2
    bl func_ov004_021c9fcc
    mov r0, #0x0
    add r1, r9, #0x158
    mov r2, #0xa0
    bl Fill32
    mov r1, #0x0
    sub r0, r1, #0x1
    str r0, [r9, #0x90]
    str r0, [r9, #0xa8]
    str r0, [r9, #0xac]
    str r0, [r9, #0xb0]
    str r0, [r9, #0x88]
    mov r0, #0x2
    str r0, [r9, #0x98]
    add r0, r9, #0x3000
    str r1, [r9, #0x54]
    str r1, [r9, #0xa0]
    str r1, [r0, #0xc90]
    str r1, [r0, #0xc94]
    mov r0, #0x9d
    str r0, [sp]
    mov r3, #0x14
    str r3, [sp, #0x4]
    str r3, [sp, #0x8]
    ldr r2, [r9, #0x98]
    mov r1, #0x6
    mul r1, r2, r1
    str r1, [sp, #0xc]
    str r3, [sp, #0x10]
    add r0, r9, #0x1f8
    mov r1, #0xe4
    mov r2, #0x22
    mov r3, #0x1a
    bl func_ov000_021abd50
    add sp, sp, #0xf4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_ov004_0220b500
_LIT2: .word 0x0400100c
_LIT3: .word data_ov004_0220a1b4
_LIT4: .word data_ov004_022105d8
_LIT5: .word 0x00005040
_LIT6: .word data_ov004_0220a1c8
_LIT7: .word data_ov004_0220a1e0
_LIT8: .word 0x00007040
_LIT9: .word 0x0400100e
_LIT10: .word data_ov004_0220a1f4
_LIT11: .word data_ov004_0220a20c
_LIT12: .word 0x00007fff
_LIT13: .word 0x00003128
_LIT14: .word 0x05000640
_LIT15: .word 0x00003860
_LIT16: .word 0x0000779b
_LIT17: .word 0x05000660
_LIT18: .word 0x04001000
_LIT19: .word data_ov004_02200e00+0xc8
_LIT20: .word data_ov004_0220a22c
_LIT21: .word data_ov004_0220a240
_LIT22: .word 0x00008480
