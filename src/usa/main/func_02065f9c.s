; func_02065f9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101614
        .extern data_02101620
        .extern data_0210162c
        .extern data_02101634
        .extern data_02101638
        .extern data_0210163c
        .extern data_0210164c
        .extern data_02101658
        .extern data_02101664
        .extern data_0219ea8c
        .extern data_0219ea90
        .extern func_02054c34
        .extern func_020552bc
        .extern func_02066a14
        .extern func_02066e2c
        .extern func_02067220
        .extern func_02067280
        .extern func_0206e704
        .extern func_020a9698
        .global func_02065f9c
        .arm
func_02065f9c:
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
    bl func_02066e2c
    ldr r4, _LIT1
    mov r8, #0x0
    ldr r0, [r4]
    cmp r0, #0x0
    ble .L_94
    ldr fp, _LIT2
    ldr r5, _LIT3
    add r7, sp, #0x10
    add r6, sp, #0x24
.L_50:
    mov r0, r7
    mov r1, fp
    mov r2, r8
    bl func_020a9698
    mov r0, r6
    mov r1, r7
    bl func_02067220
    add r0, r5, r8, lsl #0x2
    ldmia r0, {r0}
    bl func_0206e704
    mov r1, r0
    mov r0, r6
    bl func_02067220
    add r8, r8, #0x1
    ldr r0, [r4]
    cmp r8, r0
    blt .L_50
.L_94:
    ldr r1, _LIT4
    add r0, sp, #0x24
    bl func_02067220
    ldr r1, [sl, #0xc0]
    add r0, sp, #0x24
    bl func_02067280
    ldr r1, _LIT5
    add r0, sp, #0x24
    bl func_02067220
    ldr r0, [sl, #0xc8]
    cmp r0, #0x0
    ldrne r1, _LIT6
    add r0, sp, #0x24
    ldreq r1, _LIT7
    bl func_02067220
    cmp r9, #0x0
    beq .L_f0
    ldr r1, _LIT8
    add r0, sp, #0x24
    bl func_02067220
    add r0, sp, #0x24
    mov r1, r9
    bl func_02067280
.L_f0:
    ldr r1, _LIT9
    add r0, sp, #0x24
    bl func_02067220
    add r0, sp, #0x24
    add r1, sl, #0x4
    bl func_02067220
    ldr r0, [sl, #0xa8]
    cmp r0, #0x0
    beq .L_148
    ldr r1, _LIT10
    add r0, sp, #0x24
    bl func_02067220
    ldr r1, [sl, #0x104]
    add r0, sp, #0x24
    bl func_02067280
    ldr r1, _LIT11
    add r0, sp, #0x24
    bl func_02067220
    add r0, sl, #0x100
    ldrh r1, [r0, #0x8]
    add r0, sp, #0x24
    bl func_02067280
.L_148:
    cmp r9, #0x2
    beq .L_178
    mov r2, #0xff
    str r2, [sp]
    mov r3, #0x0
    str r3, [sp, #0x4]
    str r2, [sp, #0x8]
    add r1, sp, #0x24
    mov r0, sl
    str r3, [sp, #0xc]
    bl func_02066a14
    b .L_198
.L_178:
    ldr r2, [sp, #0x824]
    rsb r0, r2, #0x800
    cmp r0, #0x1
    addge r1, r2, #0x1
    strge r1, [sp, #0x824]
    addge r0, sp, #0x24
    movge r1, #0x0
    strgeb r1, [r0, r2]
.L_198:
    add r0, sl, #0xcc
    str r0, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [sl]
    ldr r2, [sp, #0x824]
    add r1, sp, #0x24
    mov r3, #0x0
    bl func_02054c34
    bl func_020552bc
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
_LIT1: .word data_0219ea8c
_LIT2: .word data_02101614
_LIT3: .word data_0219ea90
_LIT4: .word data_02101620
_LIT5: .word data_0210162c
_LIT6: .word data_02101634
_LIT7: .word data_02101638
_LIT8: .word data_0210163c
_LIT9: .word data_0210164c
_LIT10: .word data_02101658
_LIT11: .word data_02101664
