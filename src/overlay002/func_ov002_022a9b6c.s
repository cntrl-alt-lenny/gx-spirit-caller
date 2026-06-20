; func_ov002_022a9b6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov002_022d0f98
        .extern func_0207f05c
        .extern func_ov002_021c820c
        .extern func_ov002_022a6e04
        .global func_ov002_022a9b6c
        .arm
func_ov002_022a9b6c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    add r0, sl, #0x500
    ldrh r3, [r0, #0x90]
    mov r1, r3, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    addhi sp, sp, #0x1c
    ldmhiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r2, [r0, #0xec]
    ldr r0, _LIT0
    cmp r2, r0
    bne .L_ec8
    mov r0, r3, lsl #0x1f
    add r2, sl, #0x1ec
    mov r0, r0, lsr #0x1f
    add r2, r2, #0x400
    bl func_ov002_021c820c
.L_ec8:
    mov r9, sl
    mov r6, #0x0
.L_ed0:
    mov r7, #0x0
    ldr r4, _LIT1
    ldr fp, _LIT2
    mov r5, r7
.L_ee0:
    add r0, r9, r7, lsl #0x1
    add r0, r0, #0x500
    ldrh r8, [r0, #0xec]
    and r0, r8, #0x100
    cmp r0, #0x0
    ble .L_f08
    ldr r0, [r4, #0x38]
    tst r0, #0x8
    movne r8, #0x6
    andeq r8, r8, #0xff
.L_f08:
    cmp r8, #0x0
    beq .L_f88
    add r0, sp, #0x4
    mov r1, sl
    mov r2, r6
    mov r3, r7
    str r5, [sp]
    bl func_ov002_022a6e04
    sub r0, r8, #0x1
    mov r0, r0, lsl #0x8
    add r0, r0, #0x3280
    add r1, r0, #0x8000
    ldr r0, [sp, #0x4]
    ldr r3, [sp, #0x8]
    str r0, [sp, #0x14]
    sub r0, r0, #0x8
    mov r2, r0, lsl #0x17
    sub r0, r3, #0x8
    and r0, r0, #0xff
    orr r0, r0, fp
    orr r0, r0, r2, lsr #0x7
    str r0, [sp, #0xc]
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r0, r0, asr #0x7
    orr r0, r0, #0x1400
    strh r0, [sp, #0x10]
    ldr r0, _LIT3
    add r1, sp, #0xc
    mov r2, #0x1
    str r3, [sp, #0x18]
    bl func_0207f05c
.L_f88:
    add r7, r7, #0x1
    cmp r7, #0xa
    ble .L_ee0
    add r6, r6, #0x1
    cmp r6, #0x2
    add r9, r9, #0x16
    blt .L_ed0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word data_021040ac
_LIT2: .word 0x40002000
_LIT3: .word data_ov002_022d0f98
