; func_ov004_021d7910 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220a0c0
        .extern data_ov004_0220a0dc
        .extern data_ov004_0220a0f0
        .extern data_ov004_0220a104
        .extern data_ov004_0220b500
        .extern data_ov004_022113d8
        .extern data_ov004_02211490
        .extern func_02001bc8
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201d760
        .extern func_0201e5b8
        .extern func_0202c0c0
        .extern func_0208dd9c
        .extern func_02094504
        .extern func_02094550
        .extern func_ov004_021c9ef0
        .extern func_ov004_021c9fcc
        .extern func_ov004_021d6f20
        .extern func_ov004_021d7854
        .global func_ov004_021d7910
        .arm
func_ov004_021d7910:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x9c
    ldr r5, _LIT0
    mov r2, #0x0
    str r2, [r5, #0x6c]
    ldr r1, _LIT1
    str r2, [r5, #0x68]
    ldrh r0, [r1]
    bic r0, r0, #0x3
    orr r0, r0, #0x3
    strh r0, [r1]
    str r2, [r1, #0xe]
    ldrh r0, [r1]
    and r0, r0, #0x43
    orr r0, r0, #0x284
    orr r0, r0, #0x4400
    strh r0, [r1]
    bl func_0208dd9c
    mov r1, r0
    mov r0, #0x0
    mov r2, #0x40
    bl func_02094504
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x74
    bl func_0201d47c
    mov r0, #0x40
    ldrh r1, [sp, #0x88]
    str r0, [sp, #0x80]
    str r4, [sp, #0x74]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x88]
    mov r0, #0x0
    str r0, [sp, #0x7c]
    mov r0, #0x200
    ldrh r2, [sp, #0x88]
    strh r0, [sp, #0x84]
    ldr r1, [sp, #0x8c]
    orr r0, r2, #0x10
    strh r0, [sp, #0x88]
    bic r0, r1, #0x1c000
    orr r0, r0, #0xc000
    str r0, [sp, #0x8c]
    add r0, sp, #0x74
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x4c
    bl func_0201d47c
    ldrh r0, [sp, #0x60]
    ldr r1, [sp, #0x68]
    str r4, [sp, #0x4c]
    bic r0, r0, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x60]
    mov r0, #0x440
    str r0, [sp, #0x58]
    ldr r0, [sp, #0x64]
    bic r1, r1, #0xff
    bic r0, r0, #0x7f
    orr r1, r1, #0x40
    orr r0, r0, #0x20
    str r1, [sp, #0x68]
    str r0, [sp, #0x64]
    ldrh r2, [sp, #0x60]
    bic r1, r0, #0x1c000
    mov r6, #0x0
    orr r3, r2, #0x10
    orr r2, r1, #0xc000
    mov r1, #0x400
    add r0, sp, #0x4c
    str r6, [sp, #0x54]
    strh r3, [sp, #0x60]
    str r2, [sp, #0x64]
    strh r1, [sp, #0x5c]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    ldr r4, _LIT4
    ldr r0, _LIT5
    ldr r1, [r4]
    ldr r2, [r4]
    and r1, r1, #0x1f00
    mov r1, r1, lsr #0x8
    bic r1, r1, #0x4
    bic r2, r2, #0x1f00
    orr r1, r1, #0x8
    orr r3, r2, r1, lsl #0x8
    mov r1, #0x4
    mov r2, r6
    str r3, [r4]
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x24
    bl func_0201d47c
    mov r0, #0xc00
    ldrh r1, [sp, #0x38]
    str r0, [sp, #0x30]
    str r4, [sp, #0x24]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x38]
    mov r0, r6
    str r0, [sp, #0x2c]
    mov r0, #0x20
    strh r0, [sp, #0x34]
    add r0, sp, #0x24
    bl func_0201e5b8
    mov r0, r4
    bl func_0201d760
    ldr r1, _LIT6
    mov r2, #0x20
    bl func_02094550
    mov r0, r4
    bl Task_Invoke
    mov r2, #0x2
    ldr r0, _LIT7
    ldr r1, _LIT8
    mov r3, #0x3080
    str r2, [sp]
    bl func_ov004_021c9fcc
    ldr r2, _LIT9
    add r0, sp, #0x4
    mov r1, #0x3040
    bl func_02001bc8
    ldr r1, _LIT10
    add r0, sp, #0x4
    mov r2, #0x20
    bl func_02094550
    ldr r1, _LIT11
    add r0, sp, #0x4
    mov r2, #0x5500
    bl func_02001bc8
    ldr r1, _LIT12
    add r0, sp, #0x4
    mov r2, #0x20
    bl func_02094550
    mov r7, r6
    mov r6, #0xc0
    mov r4, r7
.L_1430:
    add r0, r7, #0x3c4
    bl func_0202c0c0
    mov r1, r0
    mov r0, r7
    mov r2, r6
    bl func_ov004_021d6f20
    add r0, r5, r7, lsl #0x2
    add r0, r0, #0x3000
    add r7, r7, #0x1
    str r4, [r0, #0xc94]
    cmp r7, #0x3
    blt .L_1430
    ldr r0, [r5, #0x54]
    str r4, [r5, #0x90]
    cmp r0, #0x1
    movgt r0, #0x3
    strgt r0, [r5, #0x54]
    bl func_ov004_021d7854
    add r1, r5, #0x3000
    str r0, [r1, #0xcc8]
    str r0, [r1, #0xca0]
    mov r0, #0x0
    str r0, [r1, #0xc90]
    bl func_ov004_021c9ef0
    add sp, sp, #0x9c
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x0400100e
_LIT2: .word data_ov004_0220a0c0
_LIT3: .word data_ov004_0220a0dc
_LIT4: .word 0x04001000
_LIT5: .word data_ov004_0220a0f0
_LIT6: .word data_ov004_022113d8
_LIT7: .word data_ov004_02211490
_LIT8: .word data_ov004_0220a104
_LIT9: .word 0x00006a71
_LIT10: .word 0x05000640
_LIT11: .word 0x00007fff
_LIT12: .word 0x05000660
