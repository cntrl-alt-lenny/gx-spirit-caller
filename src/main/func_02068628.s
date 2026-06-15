; func_02068628 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101d54
        .extern func_02068b54
        .extern func_0206b44c
        .extern func_020a978c
        .extern func_020aaddc
        .global func_02068628
        .arm
func_02068628:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x9c
    mov sl, r1
    ldrsb r1, [sl]
    mov fp, r0
    mov r9, r2
    cmp r1, #0x0
    beq .L_e0
.L_80:
    mov r0, sl
    mov r1, r9
    bl func_0206b44c
    cmp r0, #0x0
    addlt sp, sp, #0x9c
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r4, sl
    sub r9, r9, r0
    add sl, sl, r0
    mov r0, sl
    mov r1, r9
    bl func_0206b44c
    cmp r0, #0x0
    addlt sp, sp, #0x9c
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r2, sl
    mov r1, r4
    add sl, sl, r0
    sub r9, r9, r0
    mov r0, fp
    bl func_02068b54
    ldrsb r0, [sl]
    cmp r0, #0x0
    bne .L_80
.L_e0:
    mov r0, #0x0
    add sl, sl, #0x1
    sub r9, r9, #0x1
    str r0, [sp, #0x4]
    str r0, [sp, #0x10]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
.L_fc:
    cmp r9, #0x2
    addlt sp, sp, #0x9c
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r2, [sl]
    ldrb r1, [sl, #0x1]
    add r0, sp, #0x14
    add sl, sl, #0x2
    strb r2, [r0]
    strb r1, [r0, #0x1]
    ldrh r2, [sp, #0x14]
    str sl, [sp]
    ldr r8, [sp, #0x8]
    mov r0, r2, asr #0x8
    and r1, r0, #0xff
    mov r0, r2, lsl #0x8
    and r0, r0, #0xff00
    orr r0, r1, r0
    strh r0, [sp, #0x14]
    ldrsb r0, [sl]
    sub r9, r9, #0x2
    cmp r0, #0x0
    beq .L_18c
.L_154:
    mov r0, sl
    mov r1, r9
    bl func_0206b44c
    cmp r0, #0x0
    addlt sp, sp, #0x9c
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r0, #0x64
    addgt sp, sp, #0x9c
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrsb r1, [sl, r0]!
    sub r9, r9, r0
    add r8, r8, #0x1
    cmp r1, #0x0
    bne .L_154
.L_18c:
    ldrh r0, [sp, #0x14]
    ldr r7, [sp, #0xc]
    add sl, sl, #0x1
    cmp r0, #0x0
    sub r9, r9, #0x1
    ble .L_224
.L_1a4:
    ldr r5, [sp]
    cmp r8, #0x0
    ldr r6, [sp, #0x10]
    ble .L_214
.L_1b4:
    mov r0, sl
    mov r1, r9
    bl func_0206b44c
    movs r4, r0
    addmi sp, sp, #0x9c
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    add r0, sp, #0x16
    mov r2, r5
    mov r3, r7
    bl func_020a978c
    mov r0, fp
    add r1, sp, #0x16
    mov r2, sl
    bl func_02068b54
    mov r0, r5
    add sl, sl, r4
    sub r9, r9, r4
    bl func_020aaddc
    add r0, r0, #0x1
    add r6, r6, #0x1
    add r5, r5, r0
    cmp r6, r8
    blt .L_1b4
.L_214:
    ldrh r0, [sp, #0x14]
    add r7, r7, #0x1
    cmp r7, r0
    blt .L_1a4
.L_224:
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_fc
    add sp, sp, #0x9c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02101d54
