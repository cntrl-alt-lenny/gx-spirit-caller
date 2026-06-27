; func_ov004_021d3390 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_02209e10
        .extern data_ov004_02209e88
        .extern data_ov004_0220b500
        .extern data_ov004_022109d8
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0208dd9c
        .extern func_0208e014
        .extern func_02094504
        .extern func_02094550
        .extern func_ov004_021cfe08
        .extern func_ov004_021d0168
        .global func_ov004_021d3390
        .arm
func_ov004_021d3390:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x50
    bl func_ov004_021cfe08
    ldr r3, _LIT0
    mov r1, #0x0
    ldrh r2, [r3]
    add r0, sp, #0x28
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
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldr r1, [sp, #0x40]
    ldr r4, _LIT2
    bic r1, r1, #0x1c000
    orr r3, r1, #0xc000
    mov r1, #0x0
    ldrh r2, [sp, #0x3c]
    str r0, [sp, #0x28]
    str r3, [sp, #0x40]
    bic r0, r2, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0x3c]
    ldrh r0, [sp, #0x3c]
    str r4, [sp, #0x30]
    strh r1, [sp, #0x38]
    orr r2, r0, #0x10
    mov r0, #0x1800
    str r0, [sp, #0x34]
    add r0, sp, #0x28
    strh r2, [sp, #0x3c]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl Task_Invoke
    bl func_0208e014
    mov r1, r0
    mov r0, r4
    mov r2, #0x600
    bl func_02094550
    ldr r2, _LIT3
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
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d47c
    ldrh r0, [sp, #0x14]
    mov ip, #0x40
    mov r3, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x14]
    ldrh r2, [sp, #0x14]
    mov r1, #0x100
    add r0, sp, #0x0
    bic r2, r2, #0x10
    str r4, [sp]
    str ip, [sp, #0xc]
    str r3, [sp, #0x8]
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    mov r0, r4
    bl Task_Invoke
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    add r2, r2, #0x1000
    ldr r0, [r2]
    ldr r1, [r2]
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    bic r0, r0, #0x4
    bic r1, r1, #0x1f00
    orr r0, r0, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r1, _LIT5
    mov r2, #0x0
    mov r0, #0x1
    str r2, [r1]
    bl func_ov004_021d0168
    add sp, sp, #0x50
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0400000e
_LIT1: .word data_ov004_02209e10
_LIT2: .word data_ov004_022109d8
_LIT3: .word 0x0400100e
_LIT4: .word data_ov004_02209e88
_LIT5: .word data_ov004_0220b500
