; func_02066010 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021016f4
        .extern data_02101700
        .extern data_0210170c
        .extern data_02101714
        .extern data_02101718
        .extern data_0210171c
        .extern data_0210172c
        .extern data_02101738
        .extern data_02101744
        .extern data_0219eb6c
        .extern data_0219eb70
        .extern func_02054ca8
        .extern func_02055330
        .extern func_02066a88
        .extern func_02066ea0
        .extern func_02067294
        .extern func_020672f4
        .extern func_0206e778
        .extern func_020a978c
        .global func_02066010
        .arm
func_02066010:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov sl, r0
    mov r9, r1
    mov r3, #0x0
    add r0, sp, #0x24
    add r2, sl, #0x84
    mov r1, #0x3
    str r3, [sp, #0x824]
    bl func_02066ea0
    ldr r4, _LIT1
    mov r8, #0x0
    ldr r0, [r4]
    cmp r0, #0x0
    ble .L_fc
    ldr fp, _LIT2
    ldr r5, _LIT3
    add r7, sp, #0x10
    add r6, sp, #0x24
.L_b8:
    mov r0, r7
    mov r1, fp
    mov r2, r8
    bl func_020a978c
    mov r0, r6
    mov r1, r7
    bl func_02067294
    add r0, r5, r8, lsl #0x2
    ldmia r0, {r0}
    bl func_0206e778
    mov r1, r0
    mov r0, r6
    bl func_02067294
    add r8, r8, #0x1
    ldr r0, [r4]
    cmp r8, r0
    blt .L_b8
.L_fc:
    ldr r1, _LIT4
    add r0, sp, #0x24
    bl func_02067294
    ldr r1, [sl, #0xc0]
    add r0, sp, #0x24
    bl func_020672f4
    ldr r1, _LIT5
    add r0, sp, #0x24
    bl func_02067294
    ldr r0, [sl, #0xc8]
    cmp r0, #0x0
    ldrne r1, _LIT6
    add r0, sp, #0x24
    ldreq r1, _LIT7
    bl func_02067294
    cmp r9, #0x0
    beq .L_158
    ldr r1, _LIT8
    add r0, sp, #0x24
    bl func_02067294
    add r0, sp, #0x24
    mov r1, r9
    bl func_020672f4
.L_158:
    ldr r1, _LIT9
    add r0, sp, #0x24
    bl func_02067294
    add r0, sp, #0x24
    add r1, sl, #0x4
    bl func_02067294
    ldr r0, [sl, #0xa8]
    cmp r0, #0x0
    beq .L_1b0
    ldr r1, _LIT10
    add r0, sp, #0x24
    bl func_02067294
    ldr r1, [sl, #0x104]
    add r0, sp, #0x24
    bl func_020672f4
    ldr r1, _LIT11
    add r0, sp, #0x24
    bl func_02067294
    add r0, sl, #0x100
    ldrh r1, [r0, #0x8]
    add r0, sp, #0x24
    bl func_020672f4
.L_1b0:
    cmp r9, #0x2
    beq .L_1e0
    mov r2, #0xff
    str r2, [sp]
    mov r3, #0x0
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    add r1, sp, #0x24
    mov r0, sl
    str r3, [sp, #0xc]
    bl func_02066a88
    b .L_200
.L_1e0:
    ldr r2, [sp, #0x824]
    rsb r0, r2, #0x800
    cmp r0, #0x1
    addge r1, r2, #0x1
    strge r1, [sp, #0x824]
    addge r0, sp, #0x24
    movge r1, #0x0
    strgeb r1, [r0, r2]
.L_200:
    add r0, sl, #0xcc
    str r0, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [sl]
    ldr r2, [sp, #0x824]
    add r1, sp, #0x24
    mov r3, #0x0
    bl func_02054ca8
    bl func_02055330
    str r0, [sl, #0xac]
    ldr r0, [sl, #0xac]
    cmp r9, #0x0
    str r0, [sl, #0xb0]
    movne r0, #0x0
    strne r0, [sl, #0xb4]
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000082c
_LIT1: .word data_0219eb6c
_LIT2: .word data_021016f4
_LIT3: .word data_0219eb70
_LIT4: .word data_02101700
_LIT5: .word data_0210170c
_LIT6: .word data_02101714
_LIT7: .word data_02101718
_LIT8: .word data_0210171c
_LIT9: .word data_0210172c
_LIT10: .word data_02101738
_LIT11: .word data_02101744
