; func_ov002_022a8bb4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0eb8
        .extern func_0207ef74
        .extern func_ov002_021bc1a8
        .extern func_ov002_022a6cc8
        .global func_ov002_022a8bb4
        .arm
func_ov002_022a8bb4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    ldr r0, [sl, #0x618]
    cmp r0, #0x0
    bge .L_74
    mov r6, #0x0
    mov r8, r6
    str r6, [sl, #0x618]
    add r9, sl, #0x218
    mov r4, #0x1
    mov r5, r6
.L_30:
    mov r7, r5
.L_34:
    mov r0, r6
    mov r1, r7
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_58
    ldr r1, [r9, #0x400]
    add r0, r7, r8
    orr r0, r1, r4, lsl r0
    str r0, [r9, #0x400]
.L_58:
    add r7, r7, #0x1
    cmp r7, #0xa
    blt .L_34
    add r6, r6, #0x1
    cmp r6, #0x2
    add r8, r8, #0x10
    blt .L_30
.L_74:
    ldr r0, [sl, #0x618]
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    mov r8, #0x0
    mov r1, #-2147483648
    ldr r4, _LIT1
    mov r7, r8
    str r1, [sp, #0x14]
    strh r0, [sp, #0x18]
    mov r5, r8
    add fp, sp, #0x4
    mov r6, #0x1
.L_ac:
    mov r9, #0x0
.L_b0:
    ldr r1, [sl, #0x618]
    add r0, r9, r7
    and r0, r1, r6, lsl r0
    cmp r0, #0x0
    ble .L_120
    mov r0, fp
    mov r1, sl
    str r5, [sp]
    mov r2, r8
    mov r3, r9
    bl func_ov002_022a6cc8
    ldr r0, [sp, #0x4]
    ldr r2, [sp, #0x8]
    str r0, [sp, #0xc]
    sub r0, r0, #0x10
    ldr r3, [sp, #0x14]
    mov r1, r0, lsl #0x17
    sub r0, r2, #0x10
    str r2, [sp, #0x10]
    and r2, r0, #0xff
    and r3, r3, r4
    orr r2, r3, r2
    orr r1, r2, r1, lsr #0x7
    str r1, [sp, #0x14]
    ldr r0, _LIT2
    add r1, sp, #0x14
    mov r2, #0x1
    bl func_0207ef74
.L_120:
    add r9, r9, #0x1
    cmp r9, #0xa
    blt .L_b0
    add r8, r8, #0x1
    cmp r8, #0x2
    add r7, r7, #0x10
    blt .L_ac
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00004c68
_LIT1: .word 0xfe00ff00
_LIT2: .word data_ov002_022d0eb8
