; func_ov004_021cc49c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern func_02006110
        .extern func_0200612c
        .extern func_0200617c
        .extern func_02006194
        .extern func_ov004_021cc21c
        .extern func_ov004_021cc2a4
        .global func_ov004_021cc49c
        .arm
func_ov004_021cc49c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr r4, _LIT0
    mov r1, #0x0
    str r1, [r4, #0xb0]
    ldr r0, [r4, #0x90]
    cmp r0, #0x0
    strlt r1, [r4, #0x90]
    bl func_02006194
    cmp r0, #0x0
    bne .L_38
    bl func_0200617c
    cmp r0, #0x0
    beq .L_104
.L_38:
    add r0, sp, #0x8
    add r1, sp, #0x0
    bl func_0200612c
    add r0, sp, #0x8
    add r1, sp, #0x4
    bl func_02006110
    ldr r0, [sp]
    cmp r0, #0x20
    addlt sp, sp, #0xc
    ldmltia sp!, {r3, r4, pc}
    ldr r1, [sp, #0x4]
    ldr r0, [r4, #0xa4]
    add r0, r1, r0
    str r0, [sp, #0x4]
    cmp r0, #0x63
    addlt sp, sp, #0xc
    ldmltia sp!, {r3, r4, pc}
    cmp r0, #0x7b
    addge sp, sp, #0xc
    ldmgeia sp!, {r3, r4, pc}
    ldr r0, [sp, #0x8]
    cmp r0, #0x9
    blt .L_bc
    cmp r0, #0x70
    bge .L_bc
    mov r1, #0x1
    mov r0, #0x0
    str r1, [r4, #0xb0]
    str r0, [r4, #0x90]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_bc
    bl func_ov004_021cc21c
.L_bc:
    ldr r0, [sp, #0x8]
    cmp r0, #0x75
    addlt sp, sp, #0xc
    ldmltia sp!, {r3, r4, pc}
    cmp r0, #0xdc
    addge sp, sp, #0xc
    ldmgeia sp!, {r3, r4, pc}
    mov r1, #0x2
    mov r0, #0x1
    str r1, [r4, #0xb0]
    str r0, [r4, #0x90]
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r3, r4, pc}
    bl func_ov004_021cc2a4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_104:
    ldr r1, [r4, #0x90]
    cmp r1, #0x0
    bne .L_134
    ldr r0, _LIT1
    ldrh r0, [r0, #0x54]
    tst r0, #0x1
    beq .L_134
    mov r0, #0x1
    str r0, [r4, #0xb0]
    bl func_ov004_021cc21c
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_134:
    ldr r0, _LIT1
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    bne .L_154
    cmp r1, #0x1
    bne .L_170
    tst r0, #0x1
    beq .L_170
.L_154:
    mov r1, #0x2
    mov r0, #0x1
    str r1, [r4, #0xb0]
    str r0, [r4, #0x90]
    bl func_ov004_021cc2a4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_170:
    tst r0, #0x20
    movne r0, #0x0
    addne sp, sp, #0xc
    strne r0, [r4, #0x90]
    ldmneia sp!, {r3, r4, pc}
    tst r0, #0x10
    movne r0, #0x1
    strne r0, [r4, #0x90]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_02104bac
