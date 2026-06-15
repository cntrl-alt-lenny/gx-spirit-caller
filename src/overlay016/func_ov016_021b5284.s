; func_ov016_021b5284 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b9184
        .extern func_ov016_021b287c
        .global func_ov016_021b5284
        .arm
func_ov016_021b5284:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r7, _LIT0
    mov r5, r0
    mov r4, #0xf
    mov r8, #0x0
    mov r6, #0xa
.L_114:
    add r1, r8, #0x1
    mla r0, r1, r6, r7
    bl func_ov016_021b287c
    cmp r0, #0x0
    movne r4, r8
    bne .L_138
    add r8, r8, #0x1
    cmp r8, #0xe
    blt .L_114
.L_138:
    cmp r4, #0xf
    bge .L_1f8
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_198
    b .L_15c
    b .L_15c
    b .L_170
    b .L_184
.L_15c:
    add r0, r4, #0x1
    str r0, [r5, #0x18]
    mov r0, #0x3
    str r0, [r5, #0x1c]
    b .L_1f0
.L_170:
    mov r0, #0x3
    str r0, [r5, #0x18]
    mov r0, #0x2
    str r0, [r5, #0x1c]
    b .L_1f0
.L_184:
    mov r0, #0x3
    str r0, [r5, #0x18]
    mov r0, #0x1
    str r0, [r5, #0x1c]
    b .L_1f0
.L_198:
    subs r0, r4, #0x4
    bne .L_1b4
    mov r0, #0x0
    str r0, [r5, #0x18]
    mov r0, #0x3
    str r0, [r5, #0x1c]
    b .L_1f0
.L_1b4:
    cmp r0, #0x1
    blt .L_1f0
    cmp r0, #0x9
    bgt .L_1f0
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
.L_1f0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1f8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov016_021b9184
_LIT1: .word 0x55555556
