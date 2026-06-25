; func_0205790c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fffd8
        .extern data_020ffff0
        .extern data_020ffffc
        .extern data_02100008
        .extern data_02100014
        .extern func_02057ec8
        .extern func_020a6c60
        .extern func_020a7294
        .global func_0205790c
        .arm
func_0205790c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x1c
    mov sl, r0
    str r2, [sp, #0xc]
    mov r9, r1
    str r3, [sp, #0x10]
    movs r0, r2
    ldr r8, [sp, #0x44]
    bne .L_38
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6c60
.L_38:
    ldr r0, [sp, #0xc]
    mov r7, #0x0
    ldr fp, [r0, #0x8]
    ldr r4, [r0, #0xc]
    ldr r5, [r0]
    subs r6, fp, r4
    addeq sp, sp, #0x1c
    moveq r0, r7
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_5c:
    add r1, sp, #0x14
    str r1, [sp]
    add r0, sp, #0x18
    str r0, [sp, #0x4]
    add r2, r4, r7
    mov r0, sl
    mov r1, r9
    mov r3, r6
    add r2, r5, r2
    str r8, [sp, #0x8]
    bl func_02057ec8
    cmp r0, #0x0
    addne sp, sp, #0x1c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x18]
    cmp r0, #0x0
    addne r7, r7, r0
    subne r6, r6, r0
    cmp r0, #0x0
    beq .L_b4
    cmp r6, #0x0
    bne .L_5c
.L_b4:
    ldr r0, [sp, #0x40]
    cmp r0, #0x0
    beq .L_e0
    cmp r7, #0x0
    ble .L_e4
    mov r0, r5
    add r1, r5, r7
    add r2, r6, #0x1
    bl func_020a7294
    sub fp, fp, r7
    b .L_e4
.L_e0:
    add r4, r4, r7
.L_e4:
    cmp fp, #0x0
    bge .L_100
    ldr r0, _LIT3
    ldr r1, _LIT1
    ldr r3, _LIT4
    mov r2, #0x0
    bl func_020a6c60
.L_100:
    cmp r4, #0x0
    bge .L_11c
    ldr r0, _LIT5
    ldr r1, _LIT1
    ldr r3, _LIT6
    mov r2, #0x0
    bl func_020a6c60
.L_11c:
    cmp r4, fp
    ble .L_138
    ldr r0, _LIT7
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x1e0
    bl func_020a6c60
.L_138:
    ldr r0, [sp, #0xc]
    str fp, [r0, #0x8]
    str r4, [r0, #0xc]
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    ldrne r1, [sp, #0x14]
    strne r1, [r0]
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020fffd8
_LIT1: .word data_020ffff0
_LIT2: .word 0x000001b9
_LIT3: .word data_020ffffc
_LIT4: .word 0x000001de
_LIT5: .word data_02100008
_LIT6: .word 0x000001df
_LIT7: .word data_02100014
