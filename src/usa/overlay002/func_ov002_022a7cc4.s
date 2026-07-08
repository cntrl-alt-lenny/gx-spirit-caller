; func_ov002_022a7cc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc1ec
        .extern data_ov002_022cc204
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_ov002_021afab0
        .extern func_ov002_021c9570
        .global func_ov002_022a7cc4
        .arm
func_ov002_022a7cc4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x28
    mov r8, r0
    ldr r0, [r8, #0x5b4]
    mov r7, r1
    mov r6, r2
    mov r5, r3
    cmp r0, #0x0
    bne .L_e38
    ldr r0, [sp, #0x40]
    mov r1, #0x4
    cmp r0, #0x0
    ldrne r0, _LIT0
    mov r2, #0x0
    ldreq r0, _LIT1
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x0
    bl func_0201d428
    ldrh r0, [sp, #0x14]
    ldr r3, _LIT2
    mvn r1, #0x0
    bic r0, r0, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x14]
    ldrh r2, [sp, #0x14]
    add r0, sp, #0x0
    str r4, [sp]
    orr r2, r2, #0x10
    str r3, [sp, #0xc]
    strh r2, [sp, #0x14]
    strh r1, [sp, #0x10]
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
.L_e38:
    ldr r0, [sp, #0x40]
    cmp r0, #0x0
    beq .L_e80
    mov r0, #0x0
    str r0, [r8, #0x5bc]
    ldr r1, [r8, #0x5b4]
    add r0, r5, #0x1
    cmp r1, r0
    movle r1, r0
    str r1, [r8, #0x5b4]
    mov r0, r5
    str r1, [r8, #0x5b8]
    bl func_ov002_021afab0
    ldr r1, [r0]
    add sp, sp, #0x28
    bic r1, r1, #0x4000
    str r1, [r0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_e80:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_021c9570
    ldr r3, [r8, #0x5b4]
    mov r2, #0x0
    cmp r3, #0x0
    ble .L_ec4
.L_ea0:
    add r1, r8, r2, lsl #0x1
    add r1, r1, #0x500
    ldrh r1, [r1, #0xa0]
    cmp r0, r1
    addeq sp, sp, #0x28
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r2, r2, #0x1
    cmp r2, r3
    blt .L_ea0
.L_ec4:
    mvn r1, #0x0
    str r1, [r8, #0x5bc]
    ldr r1, [r8, #0x5b4]
    add r2, r1, #0x1
    add r1, r8, r1, lsl #0x1
    str r2, [r8, #0x5b4]
    add r1, r1, #0x500
    strh r0, [r1, #0xa0]
    ldr r0, [r8, #0x5b4]
    str r0, [r8, #0x5b8]
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cc1ec
_LIT1: .word data_ov002_022cc204
_LIT2: .word 0x0000ae80
