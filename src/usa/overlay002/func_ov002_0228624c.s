; func_ov002_0228624c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf098
        .extern func_ov002_021bbe70
        .extern func_ov002_021bd284
        .extern func_ov002_021c9bb4
        .extern func_ov002_0227d18c
        .extern func_ov002_02280870
        .global func_ov002_0228624c
        .arm
func_ov002_0228624c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    mov r5, r0
    mov r0, r4
    bl func_ov002_0227d18c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov002_021c9bb4
    cmp r0, #0x0
    beq .L_154
    ldr r1, _LIT0
    cmp r4, r1
    bgt .L_88
    sub r0, r1, #0x1
    cmp r4, r0
    blt .L_58
    beq .L_118
    cmp r4, r1
    beq .L_c8
    b .L_154
.L_58:
    sub r0, r1, #0x71
    cmp r4, r0
    bgt .L_78
    bge .L_e0
    ldr r0, _LIT1
    cmp r4, r0
    beq .L_fc
    b .L_154
.L_78:
    sub r0, r1, #0x28
    cmp r4, r0
    beq .L_c8
    b .L_154
.L_88:
    ldr r1, _LIT2
    cmp r4, r1
    bgt .L_a8
    bge .L_13c
    sub r0, r1, #0x13c
    cmp r4, r0
    beq .L_118
    b .L_154
.L_a8:
    add r0, r1, #0x38
    cmp r4, r0
    bgt .L_bc
    beq .L_13c
    b .L_154
.L_bc:
    ldr r0, _LIT3
    cmp r4, r0
    bne .L_154
.L_c8:
    rsb r0, r5, #0x1
    bl func_ov002_021bbe70
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_e0:
    mov r0, r5
    mov r1, #0x16
    bl func_ov002_021bd284
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_fc:
    mov r0, r5
    mov r1, #0x17
    bl func_ov002_021bd284
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_118:
    ldr r0, _LIT4
    and r1, r5, #0x1
    mul r2, r1, r0
    ldr r0, _LIT5
    ldr r0, [r0, r2]
    cmp r0, #0x3
    movcc r0, #0x1
    movcs r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_13c:
    mov r0, r5
    bl func_ov002_02280870
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_154:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x000011c3
_LIT1: .word 0x0000100c
_LIT2: .word 0x00001331
_LIT3: .word 0x0000179a
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf098
