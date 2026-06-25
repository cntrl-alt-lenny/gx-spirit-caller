; func_0203a900 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219c3a0
        .extern data_0219c3b4
        .extern func_02038c48
        .extern func_0203a7fc
        .extern func_0207cf0c
        .extern func_02095d34
        .global func_0203a900
        .arm
func_0203a900:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r1, _LIT0
    mov sl, r0
    ldrh r0, [r1, #0x4]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, [sl, #0x10]
    cmp r1, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [r1, #0x1c]
    sub r0, r0, #0x1
    strb r0, [r1, #0x1c]
    ldr r4, [sl, #0x10]
    ldrb r0, [r4, #0x1c]
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [sl, #0x57]
    tst r0, #0x80
    beq .L_16c
    add r6, r4, #0x34
    ldrsh r8, [r4, #0x30]
    mvn r7, #0x0
    bl OS_DisableIrq
    str r0, [sp]
    ldrh r0, [r4, #0x2e]
    bl func_0203a7fc
    movs r5, r0
    add r7, r7, #0x1
    bne .L_e8
    cmp r7, r8
    bge .L_164
    mov r5, #0x0
    ldr fp, _LIT1
    mov r4, r5
.L_88:
    ldr r9, [r6]
    cmp r9, #0x0
    beq .L_d4
    ldrb r0, [r9, #0x1c]
    sub r0, r0, #0x1
    strb r0, [r9, #0x1c]
    tst r0, #0xff
    bne .L_d4
    ldr r0, [r9, #0x8]
    mov r1, r9
    cmp r0, #0x0
    strne r5, [r0, #0x4]
    mov r0, fp
    strne r5, [r9, #0x8]
    bl func_0207cf0c
    mov r0, r9
    mov r1, #0x1
    bl func_02038c48
    str r4, [r6]
.L_d4:
    add r7, r7, #0x1
    cmp r7, r8
    add r6, r6, #0x4
    blt .L_88
    b .L_164
.L_e8:
    cmp r7, r8
    bge .L_164
    mov r4, #0x0
    mov fp, r4
.L_f8:
    ldr r9, [r6]
    cmp r9, #0x0
    beq .L_154
    ldrb r0, [r9, #0x1c]
    sub r0, r0, #0x1
    strb r0, [r9, #0x1c]
    tst r0, #0xff
    bne .L_154
    ldr r0, [r9, #0x8]
    mov r1, r9
    cmp r0, #0x0
    strne r4, [r0, #0x4]
    ldr r0, _LIT1
    strne r4, [r9, #0x8]
    bl func_0207cf0c
    mov r0, r9
    mov r1, #0x1
    bl func_02038c48
    add r0, r5, #0x20
    mov r1, r7
    mov r2, #0x0
    bl func_02095d34
    str fp, [r6]
.L_154:
    add r7, r7, #0x1
    cmp r7, r8
    add r6, r6, #0x4
    blt .L_f8
.L_164:
    ldr r0, [sp]
    bl OS_RestoreIrq
.L_16c:
    ldr r1, [sl, #0x10]
    ldr r0, _LIT1
    bl func_0207cf0c
    ldr r0, [sl, #0x10]
    mov r1, #0x1
    bl func_02038c48
    mov r0, #0x0
    str r0, [sl, #0x10]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219c3a0
_LIT1: .word data_0219c3b4
