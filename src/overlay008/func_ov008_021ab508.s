; func_ov008_021ab508 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2510
        .extern data_ov008_021b2528
        .extern data_ov008_021b2548
        .extern data_ov008_021b2568
        .extern data_ov008_021b2588
        .extern data_ov008_021b259c
        .extern data_ov008_021b25c0
        .extern data_ov008_021b25dc
        .extern data_ov008_021b25fc
        .extern data_ov008_021b261c
        .extern data_ov008_021b263c
        .extern data_ov008_021b2658
        .extern data_ov008_021b2c80
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0202be4c
        .extern func_ov008_021ab3ac
        .extern func_ov008_021ac35c
        .global func_ov008_021ab508
        .arm
func_ov008_021ab508:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    ldrh r2, [sp, #0x14]
    str r0, [sp]
    mov r4, #0x800
    bic r0, r2, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    ldrh r2, [sp, #0x14]
    bic r0, r1, #0x1c000
    orr r1, r0, #0xc000
    orr r2, r2, #0x10
    mov r3, #0x0
    add r0, sp, #0x0
    str r4, [sp, #0xc]
    str r3, [sp, #0x8]
    strh r2, [sp, #0x14]
    str r1, [sp, #0x18]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    mov r0, #0x2f00
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    bic r0, r1, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x14]
    mov r0, #0x0
    ldrh r2, [sp, #0x14]
    ldr r1, [sp, #0x18]
    str r0, [sp, #0x8]
    strh r0, [sp, #0x10]
    bic r2, r2, #0x10
    bic r1, r1, #0x1c000
    add r0, sp, #0x0
    strh r2, [sp, #0x14]
    str r1, [sp, #0x18]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp]
    mov r0, #0x2f00
    mov r4, #0x0
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    str r4, [sp, #0x8]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x14]
    ldrh r0, [sp, #0x16]
    orr r0, r0, #0x8000
    strh r0, [sp, #0x16]
    ldrh r2, [sp, #0x14]
    ldr r1, [sp, #0x18]
    add r0, sp, #0x0
    bic r3, r2, #0x10
    bic r1, r1, #0x1c000
    orr r2, r1, #0x1c000
    sub r1, r4, #0x1
    strh r3, [sp, #0x14]
    str r2, [sp, #0x18]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    mov r2, r4
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    str r2, [sp, #0xc]
    bic r0, r1, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x14]
    ldrh r1, [sp, #0x14]
    sub r0, r2, #0x1
    strh r0, [sp, #0x10]
    ldr r0, [sp, #0x18]
    bic r1, r1, #0x10
    bic r0, r0, #0x1c000
    strh r1, [sp, #0x14]
    orr r1, r0, #0x1c000
    add r0, sp, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0x18]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    str r0, [sp]
    mov r0, r4
    ldrh r2, [sp, #0x14]
    strh r0, [sp, #0x10]
    ldrh r1, [sp, #0x16]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    orr r0, r1, #0x8000
    ldrh r1, [sp, #0x14]
    strh r0, [sp, #0x16]
    add r0, sp, #0x0
    orr r1, r1, #0x10
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT5
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    ldrh r1, [sp, #0x14]
    str r0, [sp]
    ldr r2, _LIT6
    bic r0, r1, #0xf
    orr r3, r0, #0x9
    mov r1, r4
    add r0, sp, #0x0
    strh r3, [sp, #0x14]
    str r2, [sp, #0xc]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT7
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    str r0, [sp]
    mov r0, #0x13000
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    bic r0, r1, #0xf
    ldr r1, [sp, #0x18]
    orr r0, r0, #0x9
    bic r1, r1, #0x1c000
    strh r0, [sp, #0x14]
    orr r1, r1, #0x1c000
    add r0, sp, #0x0
    str r1, [sp, #0x18]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT8
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    str r0, [sp]
    ldr r0, [sp, #0x18]
    ldr r1, _LIT9
    bic r0, r0, #0x1c000
    orr r0, r0, #0x1c000
    str r0, [sp, #0x18]
    ldrh r2, [sp, #0x14]
    str r1, [sp, #0xc]
    add r0, sp, #0x0
    bic r1, r2, #0xf
    orr r1, r1, #0x9
    strh r1, [sp, #0x14]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT10
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    str r0, [sp]
    ldr r1, _LIT11
    ldr r0, [sp, #0x18]
    ldrh r2, [sp, #0x14]
    str r1, [sp, #0xc]
    bic r0, r0, #0x1c000
    bic r1, r2, #0xf
    orr r1, r1, #0x9
    orr r0, r0, #0x1c000
    strh r1, [sp, #0x14]
    str r0, [sp, #0x18]
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT12
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    ldrh r2, [sp, #0x14]
    str r0, [sp]
    ldr r1, [sp, #0x18]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    bic r0, r1, #0x1c000
    orr r1, r0, #0x1c000
    ldr r2, _LIT13
    add r0, sp, #0x0
    str r2, [sp, #0xc]
    str r1, [sp, #0x18]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT14
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    str r0, [sp]
    mov r0, #0x14400
    ldrh r1, [sp, #0x14]
    str r0, [sp, #0xc]
    bic r0, r1, #0xf
    ldr r1, [sp, #0x18]
    orr r0, r0, #0x9
    bic r1, r1, #0x1c000
    strh r0, [sp, #0x14]
    orr r1, r1, #0x1c000
    add r0, sp, #0x0
    str r1, [sp, #0x18]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    ldr r0, _LIT15
    mov r1, #0x4
    mov r2, r4
    bl func_02006c0c
    str r0, [sp]
    mov r0, #0x20
    ldrh r2, [sp, #0x14]
    strh r0, [sp, #0x10]
    ldrh r1, [sp, #0x16]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    orr r0, r1, #0x8000
    strh r0, [sp, #0x16]
    add r0, sp, #0x0
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    add r0, sp, #0x0
    bl func_0201d47c
    mov r0, r4
    bl func_0202be4c
    ldrh r2, [sp, #0x14]
    str r0, [sp]
    ldrh r1, [sp, #0x16]
    bic r0, r2, #0xf
    orr r0, r0, #0x9
    orr r3, r1, #0x8000
    strh r0, [sp, #0x14]
    ldrh r0, [sp, #0x14]
    mov r1, #0x200
    strh r3, [sp, #0x16]
    orr r2, r0, #0x10
    add r0, sp, #0x0
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e5b8
    ldr r0, [sp]
    bl Task_Invoke
    mov r6, r4
    mov r5, #0x7
    ldr r4, _LIT16
    b .L_874
.L_864:
    mov r0, r6
    mov r1, r6
    bl func_ov008_021ac35c
    add r6, r6, #0x1
.L_874:
    ldrh r0, [r4, #0x5a]
    cmp r0, #0x6
    movhi r0, r5
    cmp r6, r0
    blt .L_864
    bl func_ov008_021ab3ac
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2510
_LIT1: .word data_ov008_021b2528
_LIT2: .word data_ov008_021b2548
_LIT3: .word data_ov008_021b2568
_LIT4: .word data_ov008_021b2588
_LIT5: .word data_ov008_021b259c
_LIT6: .word 0x00012100
_LIT7: .word data_ov008_021b25c0
_LIT8: .word data_ov008_021b25dc
_LIT9: .word 0x00013500
_LIT10: .word data_ov008_021b25fc
_LIT11: .word 0x00013f00
_LIT12: .word data_ov008_021b261c
_LIT13: .word 0x00014200
_LIT14: .word data_ov008_021b263c
_LIT15: .word data_ov008_021b2658
_LIT16: .word data_ov008_021b2c80
