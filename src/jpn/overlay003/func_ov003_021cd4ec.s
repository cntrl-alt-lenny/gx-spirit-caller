; func_ov003_021cd4ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b88
        .extern data_02104e6c
        .extern data_ov003_021cefb8
        .extern func_020193f8
        .extern func_0201e910
        .global func_ov003_021cd4ec
        .arm
func_ov003_021cd4ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x50
    ldr r4, _LIT0
    mov r5, r1
    ldr lr, [r4, r5, lsl #0x2]
    mov r6, r0
    mov r4, r2
    str r3, [sp, #0x20]
    cmp lr, #0x4b
    mov ip, #0x0
    bne .L_7c0
    ldr r0, _LIT1
    ldr r0, [r0, #0x928]
    cmp r0, #0x17
    movcs ip, #0x20
.L_7c0:
    cmp r4, #0x4
    addls pc, pc, r4, lsl #0x2
    b .L_7e0
    b .L_7e0
    b .L_7e8
    b .L_7f0
    b .L_7f8
    b .L_800
.L_7e0:
    mov r7, #0xc0
    b .L_804
.L_7e8:
    mov r7, #0x180
    b .L_804
.L_7f0:
    mov r7, #0x200
    b .L_804
.L_7f8:
    mov r7, #0x300
    b .L_804
.L_800:
    mov r7, #0x380
.L_804:
    ldr sl, _LIT2
    add r9, sp, #0x30
    ldmia sl!, {r0, r1, r2, r3}
    str r9, [sp, #0x24]
    stmia r9!, {r0, r1, r2, r3}
    cmp r5, #0x0
    movne r8, #0x1
    ldmia sl, {r0, r1, r2, r3}
    moveq r8, #0x2
    stmia r9, {r0, r1, r2, r3}
    add fp, r4, #0x1
    cmp r4, #0x4
    bne .L_874
    ldr r0, _LIT3
    ldr r2, [r6, #0x18]
    ldr r1, [r0, #0x38]
    sub r0, r2, #0x38
    mov r1, r1, asr #0x3
    and r2, r1, #0x7
    ldr r1, [sp, #0x24]
    ldr r1, [r1, r2, lsl #0x2]
    add r2, ip, #0x40
    add r1, r2, r1
    mov r2, r0, lsl #0xc
    mov r0, r1, lsl #0xc
    str r2, [sp, #0x28]
    str r0, [sp, #0x2c]
    b .L_8b8
.L_874:
    mov r0, lr
    mov r9, #0x60
    bl func_020193f8
    cmp r0, #0x0
    beq .L_8a4
    ldr r0, _LIT3
    add r1, sp, #0x30
    ldr r0, [r0, #0x38]
    mov r0, r0, asr #0x3
    and r0, r0, #0x7
    ldr r0, [r1, r0, lsl #0x2]
    add r9, r9, r0
.L_8a4:
    ldr r1, [r6, #0x18]
    mov r0, r9, lsl #0xc
    mov r1, r1, lsl #0xc
    str r1, [sp, #0x28]
    str r0, [sp, #0x2c]
.L_8b8:
    mov r0, #0x1b8
    mla r1, r5, r0, r6
    mov r3, #0x0
    str r3, [sp]
    mov r0, #0x48
    mla r1, r4, r0, r1
    ldr r2, [sp, #0x7c]
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    ldr r0, [sp, #0x80]
    add r2, sp, #0x28
    str r0, [sp, #0xc]
    mov r0, r7, lsl #0x7
    str r0, [sp, #0x10]
    mov r0, fp, lsl #0x9
    str r0, [sp, #0x14]
    ldr r0, [sp, #0x20]
    str r3, [sp, #0x18]
    add r0, r1, r0, lsl #0x2
    str r3, [sp, #0x1c]
    ldr r0, [r0, #0x1b8]
    ldr r1, [sp, #0x78]
    ldr r4, [r0, #0x2c]
    mov r0, r8
    add r1, r4, r1, lsl #0x3
    bl func_0201e910
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02104b88
_LIT1: .word data_02104e6c
_LIT2: .word data_ov003_021cefb8
_LIT3: .word data_02103fcc
