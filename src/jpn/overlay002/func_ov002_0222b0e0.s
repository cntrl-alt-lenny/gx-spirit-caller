; func_ov002_0222b0e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern data_ov002_022d008c
        .extern func_0202e1e0
        .extern func_ov002_021d8038
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .global func_ov002_0222b0e0
        .arm
func_ov002_0222b0e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1, #0x5a8]
    ldr r4, [r2, #0xcec]
    ldr r2, [r1, #0x5ac]
    mov r7, r0
    cmp r3, #0x78
    eor r5, r4, r2
    beq .L_d8
    cmp r3, #0x7f
    beq .L_4c
    cmp r3, #0x80
    mov r0, #0x0
    bne .L_f8
    str r0, [r1, #0x5ac]
    bl func_ov002_021e2a4c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_4c:
    ldr r0, _LIT2
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r0, [r0, r2]
    subs r4, r0, #0x1
    bmi .L_d0
    ldr r0, _LIT4
    add r6, r0, r2
    add r0, r6, #0x18
    add r0, r0, #0x400
    add r8, r0, r4, lsl #0x2
.L_7c:
    ldr r0, [r8]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_c4
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    add r0, r6, #0x18
    add r1, r0, #0x400
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    add r1, r1, r4, lsl #0x2
    bl func_ov002_021d8038
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c4:
    sub r8, r8, #0x4
    subs r4, r4, #0x1
    bpl .L_7c
.L_d0:
    mov r0, #0x78
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_d8:
    add r0, r2, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movlt r0, #0x7f
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_f8:
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf0a0
_LIT4: .word data_ov002_022cf08c
