; func_ov016_021b5130 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b9024
        .extern func_ov016_021b277c
        .global func_ov016_021b5130
        .arm
func_ov016_021b5130:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r7, _LIT0
    mov r5, r0
    mov r4, #0xf
    mov r8, #0x0
    mov r6, #0xa
.L_18:
    add r1, r8, #0x1
    mla r0, r1, r6, r7
    bl func_ov016_021b277c
    cmp r0, #0x0
    movne r4, r8
    bne .L_3c
    add r8, r8, #0x1
    cmp r8, #0xe
    blt .L_18
.L_3c:
    cmp r4, #0xf
    bge .L_fc
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_9c
    b .L_60
    b .L_60
    b .L_74
    b .L_88
.L_60:
    add r0, r4, #0x1
    str r0, [r5, #0x18]
    mov r0, #0x3
    str r0, [r5, #0x1c]
    b .L_f4
.L_74:
    mov r0, #0x3
    str r0, [r5, #0x18]
    mov r0, #0x2
    str r0, [r5, #0x1c]
    b .L_f4
.L_88:
    mov r0, #0x3
    str r0, [r5, #0x18]
    mov r0, #0x1
    str r0, [r5, #0x1c]
    b .L_f4
.L_9c:
    subs r0, r4, #0x4
    bne .L_b8
    mov r0, #0x0
    str r0, [r5, #0x18]
    mov r0, #0x3
    str r0, [r5, #0x1c]
    b .L_f4
.L_b8:
    cmp r0, #0x1
    blt .L_f4
    cmp r0, #0x9
    bgt .L_f4
    ldr r1, _LIT1
    sub r4, r4, #0x5
    smull r0, r6, r1, r4
    smull r0, r3, r1, r4
    add r6, r6, r4, lsr #0x1f
    mov r2, #0x3
    smull r0, r1, r2, r6
    sub r6, r4, r0
    str r6, [r5, #0x18]
    add r3, r3, r4, lsr #0x1f
    str r3, [r5, #0x1c]
.L_f4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_fc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov016_021b9024
_LIT1: .word 0x55555556
