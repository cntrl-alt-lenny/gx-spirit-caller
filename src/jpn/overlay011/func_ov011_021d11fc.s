; func_ov011_021d11fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov011_021d4580
        .extern func_ov011_021d11f8
        .global func_ov011_021d11fc
        .arm
func_ov011_021d11fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r4, _LIT0
    mov r5, #0x0
    mov r0, #0x12
    mov r6, r5
    mov r7, r4
    str r0, [sp]
.L_20:
    mov r0, r7
    bl func_ov011_021d11f8
    add r6, r6, #0x1
    cmp r6, #0xa
    add r7, r7, #0x28
    bcc .L_20
    mov r2, r4
    mov r3, #0x0
    add r0, sp, #0x4
.L_44:
    ldr r1, [r2, #0x18]
    add r2, r2, #0x28
    mov r1, r1, lsl #0x1a
    movs r1, r1, lsr #0x1f
    strneb r3, [r0, r5]
    add r3, r3, #0x1
    addne r5, r5, #0x1
    cmp r3, #0xa
    bcc .L_44
    ldr r1, _LIT1
    mov r6, #0x1
    smull r0, r2, r1, r5
    add r2, r2, r5, lsr #0x1f
    cmp r2, #0x1
    ble .L_90
.L_80:
    add r0, r6, r6, lsl #0x1
    add r6, r0, #0x1
    cmp r6, r2
    blt .L_80
.L_90:
    cmp r6, #0x0
    ble .L_114
    add fp, sp, #0x4
.L_9c:
    mov r2, r6
    cmp r6, r5
    bge .L_fc
    mov r7, #0x28
    add ip, fp, r6
    mov r8, r7
.L_b4:
    subs r3, r2, r6
    bmi .L_f0
    add lr, fp, r3
.L_c0:
    ldrsb r1, [ip, r3]
    ldrsb r0, [lr]
    mla r9, r1, r8, r4
    ldr r9, [r9, #0x4]
    mla sl, r0, r7, r4
    ldr sl, [sl, #0x4]
    cmp sl, r9
    bgt .L_f0
    strb r1, [lr], -r6
    strb r0, [ip, r3]
    subs r3, r3, r6
    bpl .L_c0
.L_f0:
    add r2, r2, #0x1
    cmp r2, r5
    blt .L_b4
.L_fc:
    ldr r1, _LIT1
    mov r2, r6
    smull r0, r6, r1, r2
    add r6, r6, r2, lsr #0x1f
    cmp r6, #0x0
    bgt .L_9c
.L_114:
    cmp r5, #0x0
    addle sp, sp, #0x10
    mov r1, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r0, sp, #0x4
    mov r3, #0x28
.L_12c:
    ldrsb r6, [r0], #0x1
    ldr r2, [sp]
    add r1, r1, #0x1
    mla r7, r6, r3, r4
    ldr r6, [r7, #0x18]
    and r2, r2, #0x1f
    bic r6, r6, #0x1f
    orr r2, r6, r2
    str r2, [r7, #0x18]
    ldr r2, [sp]
    cmp r1, r5
    add r2, r2, #0x1
    str r2, [sp]
    blt .L_12c
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov011_021d4580
_LIT1: .word 0x55555556
