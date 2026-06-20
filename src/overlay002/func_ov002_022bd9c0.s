; func_ov002_022bd9c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_02036590
        .extern func_020373cc
        .extern func_ov002_022b3898
        .extern func_ov002_022bc2b4
        .extern func_ov002_022bdb88
        .global func_ov002_022bd9c0
        .arm
func_ov002_022bd9c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_28
    cmp r0, #0x1
    beq .L_40
    cmp r0, #0x2
    beq .L_114
    b .L_130
.L_28:
    mov r1, #0x0
    str r1, [r4, #0xc48]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_130
.L_40:
    ldr r0, [r4, #0xc64]
    cmp r0, #0xa
    bne .L_8c
    ldr r0, _LIT0
    ldr r5, [r4, #0xc58]
    ldr r0, [r0, #0xdc]
    bl func_ov002_022bc2b4
    mov r1, #0x0
    bl func_02036590
    cmp r5, #0x1
    moveq r0, #0x2a
    beq .L_7c
    cmp r5, #0x2
    moveq r0, #0x2b
    movne r0, #0x2c
.L_7c:
    mov r2, #0x0
    sub r3, r2, #0x1
    mov r1, #0x1
    bl func_020373cc
.L_8c:
    ldr r0, [r4, #0xc64]
    cmp r0, #0x28
    bne .L_c8
    ldr r1, [r4, #0xc58]
    ldr r0, _LIT1
    cmp r1, #0x1
    moveq r2, #0x0
    beq .L_b8
    cmp r1, #0x2
    moveq r2, #0x1
    movne r2, #0x2
.L_b8:
    mov r3, #0x0
    mov r1, #0x4c
    str r3, [sp]
    bl func_ov002_022bdb88
.L_c8:
    ldr r0, [r4, #0xc58]
    cmp r0, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    sub r1, r1, r0
    mov r0, #0x14
    mul r0, r1, r0
    ldr r1, [r4, #0xc64]
    add r0, r0, #0x12c
    cmp r1, r0
    blt .L_130
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_130
.L_114:
    ldr r0, _LIT2
    bl func_ov002_022b3898
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x0
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_130:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022d28fc
_LIT2: .word data_ov002_022d1af8
