; func_ov002_02252d6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0a0
        .extern func_0202b854
        .extern func_0202e1e0
        .extern func_0202e898
        .extern func_ov002_021b9ac0
        .extern func_ov002_021ca310
        .extern func_ov002_02253370
        .global func_ov002_02252d6c
        .arm
func_ov002_02252d6c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r3, r2, lsl #0x10
    mov r1, r2, lsr #0x10
    mov r1, r1, lsl #0x10
    mov r5, r3, lsr #0x10
    mov sl, r0
    mov r0, r5
    mov r4, r1, lsr #0x10
    bl func_0202b854
    str r0, [sp]
    mov r0, r5
    bl func_0202e898
    ldr r1, _LIT0
    and r2, r4, #0x1
    mul r3, r2, r1
    ldr r2, _LIT1
    mov fp, r0
    ldr r0, [r2, r3]
    mov r5, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, _LIT2
    and r0, sl, #0x1
    mla r1, r0, r1, r2
    add r9, r2, r3
    add r0, r9, #0x18
    add r1, r1, #0x18
    add r7, r0, #0x400
    add r8, r1, #0x400
.L_74:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_e8
    mov r0, r6
    bl func_0202b854
    ldr r1, [sp]
    cmp r0, r1
    bge .L_e8
    mov r0, r6
    bl func_0202e898
    cmp fp, r0
    bne .L_e8
    mov r0, sl
    mov r1, r6
    bl func_ov002_021ca310
    cmp r0, #0x0
    beq .L_e8
    mov r0, r8
    bl func_ov002_021b9ac0
    cmp r0, #0x0
    beq .L_e8
    mov r0, r4
    mov r1, #0xe
    mov r2, r5
    bl func_ov002_02253370
.L_e8:
    ldr r0, [r9, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x4
    add r8, r8, #0x4
    bcc .L_74
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0a0
_LIT2: .word data_ov002_022cf08c
