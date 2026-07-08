; func_ov002_0222e778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ff37c
        .extern func_ov002_0226aec4
        .extern func_ov002_0226afa4
        .extern func_ov002_0227acc8
        .global func_ov002_0222e778
        .arm
func_ov002_0222e778:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr ip, [r2, #0x5a8]
    ldr r4, [r3, #0xcec]
    ldr r3, [r2, #0x5ac]
    mov r5, r0
    cmp ip, #0x64
    eor r4, r4, r3
    bgt .L_34
    cmp ip, #0x64
    beq .L_154
    b .L_174
.L_34:
    sub r2, ip, #0x7d
    cmp r2, #0x3
    addls pc, pc, r2, lsl #0x2
    b .L_174
    b .L_118
    b .L_f0
    b .L_6c
    b .L_54
.L_54:
    bl func_ov002_021e2a4c
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_6c:
    ldrh ip, [r5, #0x2]
    mov r2, r4, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, ip, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    mov r3, ip, lsl #0x1f
    strh r2, [r5, #0x2]
    mov r6, r3, lsr #0x1f
    bl func_ov002_021ff37c
    ldrh r2, [r5, #0x2]
    mov r1, r6, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r0, #0x0
    bic r2, r2, #0x1
    and r1, r1, #0x1
    orr r1, r2, r1
    strh r1, [r5, #0x2]
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x1
    bne .L_dc
    ldr r0, _LIT3
    mov r1, #0x1
    strh r1, [r0, #0xb0]
    b .L_e8
.L_dc:
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_0226afa4
.L_e8:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_f0:
    ldr r0, _LIT3
    ldrh r0, [r0, #0xb0]
    cmp r0, #0x0
    moveq r0, #0x64
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_0226aec4
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
    ldr r2, _LIT4
    ldr r0, _LIT5
    and r1, r4, #0x1
    mla r3, r1, r0, r2
    ldr r0, _LIT3
    ldrh r2, [r5]
    ldrh r1, [r0, #0xb0]
    add r3, r3, #0x120
    mov r0, r4
    add r1, r3, r1, lsl #0x2
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    mov r0, #0x64
    ldmia sp!, {r4, r5, r6, pc}
.L_154:
    add r0, r3, #0x1
    str r0, [r2, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r4, r5, r6, pc}
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_174:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd664
_LIT3: .word data_ov002_022d0d8c
_LIT4: .word data_ov002_022cf08c
_LIT5: .word 0x00000868
