; func_020581d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020582c0
        .global func_020581d0
        .arm
func_020581d0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov sl, r0
    movs r9, r1
    ldr r8, [sl]
    beq .L_a4
    ldr r7, [r8, #0x438]
    ldr r6, [r8, #0x43c]
    mov r5, #0x0
    str r5, [r8, #0x438]
    mov r1, r7
    str r5, [r8, #0x43c]
    cmp r7, #0x0
    beq .L_80
.L_34:
    ldr r0, [r1, #0x10]
    ldr r4, [r1, #0x14]
    cmp r0, r9
    beq .L_50
    ldr r0, [r1, #0xc]
    cmp r0, #0x1
    bne .L_70
.L_50:
    mov r0, sl
    cmp r5, #0x0
    strne r4, [r5, #0x14]
    moveq r7, r4
    cmp r6, r1
    moveq r6, r5
    bl func_020582c0
    b .L_74
.L_70:
    mov r5, r1
.L_74:
    mov r1, r4
    cmp r4, #0x0
    bne .L_34
.L_80:
    ldr r0, [r8, #0x438]
    cmp r0, #0x0
    ldrne r0, [r8, #0x43c]
    strne r7, [r0, #0x14]
    strne r6, [r8, #0x43c]
    streq r7, [r8, #0x438]
    streq r6, [r8, #0x43c]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a4:
    ldr r1, [r8, #0x438]
    cmp r1, #0x0
    beq .L_e8
    mov r4, #0x0
.L_b4:
    str r4, [r8, #0x438]
    str r4, [r8, #0x43c]
    cmp r1, #0x0
    beq .L_dc
.L_c4:
    ldr r5, [r1, #0x14]
    mov r0, sl
    bl func_020582c0
    mov r1, r5
    cmp r5, #0x0
    bne .L_c4
.L_dc:
    ldr r1, [r8, #0x438]
    cmp r1, #0x0
    bne .L_b4
.L_e8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
