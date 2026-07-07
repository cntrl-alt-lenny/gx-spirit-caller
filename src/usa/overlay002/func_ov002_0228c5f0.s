; func_ov002_0228c5f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021afff0
        .extern func_ov002_0227afa0
        .global func_ov002_0228c5f0
        .arm
func_ov002_0228c5f0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x58
    mov sl, r0
    mvn r4, #0x0
    mov r6, #0x0
    mov r9, r2
    mov fp, r4
    mov r3, r6
    mov r5, sl, lsl #0x4
    add r0, sp, #0x2c
    mov r2, #0x1
.L_2cc:
    tst r1, r2, lsl r5
    strne r3, [r0, r6, lsl #0x2]
    add r3, r3, #0x1
    addne r6, r6, #0x1
    cmp r3, #0x4
    add r5, r5, #0x1
    ble .L_2cc
    sub r7, r6, #0x1
    cmp r7, #0x0
    ble .L_31c
    add r5, sp, #0x2c
.L_2f8:
    add r0, r7, #0x1
    bl func_ov002_021afff0
    ldr r2, [r5, r7, lsl #0x2]
    ldr r1, [r5, r0, lsl #0x2]
    str r1, [r5, r7, lsl #0x2]
    sub r7, r7, #0x1
    str r2, [r5, r0, lsl #0x2]
    cmp r7, #0x0
    bgt .L_2f8
.L_31c:
    cmp r6, #0x0
    mov r8, #0x0
    ble .L_3a8
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mla r7, r1, r0, r2
.L_338:
    add r0, sp, #0x2c
    cmp r9, #0x0
    ldr r5, [r0, r8, lsl #0x2]
    blt .L_35c
    mov r0, #0x14
    mla r0, r5, r0, r7
    ldrh r0, [r0, #0x36]
    cmp r9, r0
    bne .L_39c
.L_35c:
    mov r0, sl
    mov r1, r5
    add r2, sp, #0x0
    bl func_ov002_0227afa0
    mov r0, #0x14
    mla r0, r5, r0, r7
    ldrh r0, [r0, #0x36]
    cmp r0, #0x0
    ldrne r0, [sp, #0x18]
    ldreq r0, [sp, #0x14]
    cmp r4, #0x0
    blt .L_394
    cmp r0, r4
    ble .L_39c
.L_394:
    mov fp, r5
    mov r4, r0
.L_39c:
    add r8, r8, #0x1
    cmp r8, r6
    blt .L_338
.L_3a8:
    mov r0, fp
    add sp, sp, #0x58
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
