; func_ov002_021d4e28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022cd888
        .extern data_ov002_022ce870
        .extern data_ov002_022ce878
        .extern data_ov002_022d008c
        .extern func_ov002_021b077c
        .extern func_ov002_021b1490
        .extern func_ov002_021d4804
        .extern func_ov002_021d4d20
        .extern func_ov002_0229c6e8
        .extern func_ov002_0229cc60
        .global func_ov002_021d4e28
        .arm
func_ov002_021d4e28:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r0, #0x0
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0xd0c]
    cmp r0, #0x0
    beq .L_44
    ldr r0, _LIT1
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    beq .L_44
    bl func_ov002_021d4d20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_44:
    ldr r0, _LIT0
    ldr r0, [r0, #0xd88]
    cmp r0, #0x0
    beq .L_68
    cmp r0, #0x1
    beq .L_140
    cmp r0, #0x2
    beq .L_168
    b .L_1c8
.L_68:
    ldr r0, _LIT2
    ldr r1, [r0, #0x808]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT3
    mov r2, #0x8
    bl func_ov002_0229cc60
    ldr r5, _LIT2
    mov r4, #0x0
    ldr r0, [r5, #0x808]
    subs r0, r0, #0x1
    str r0, [r5, #0x808]
    beq .L_d4
    ldr r8, _LIT3
    mov r6, #0x8
    mov r7, r8
.L_ac:
    add r1, r4, #0x1
    mov r0, r8
    mov r2, r6
    add r1, r7, r1, lsl #0x3
    bl func_ov002_0229cc60
    ldr r0, [r5, #0x808]
    add r4, r4, #0x1
    cmp r4, r0
    add r8, r8, #0x8
    bcc .L_ac
.L_d4:
    ldr r0, _LIT1
    ldr r2, _LIT2
    ldr r3, [r0, #0x300]
    mov r1, #0x1
    orr r3, r3, #0x8
    str r3, [r0, #0x300]
    ldr r0, _LIT0
    str r1, [r2, #0x80c]
    ldr r0, [r0, #0xd0c]
    cmp r0, #0x0
    beq .L_120
    mov r0, #0x7
    sub r1, r0, #0x8
    mov r3, #0x8
    bl func_ov002_021b1490
    ldr r0, _LIT1
    ldr r1, [r0, #0x300]
    bic r1, r1, #0x8
    str r1, [r0, #0x300]
.L_120:
    ldr r1, _LIT2
    mov r2, #0x0
    str r2, [r1, #0x810]
    ldr r0, _LIT0
    str r2, [r1, #0x814]
    ldr r1, [r0, #0xd88]
    add r1, r1, #0x1
    str r1, [r0, #0xd88]
.L_140:
    bl func_ov002_021d4804
    ldr r0, _LIT2
    ldr r0, [r0, #0x80c]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd88]
    add r1, r1, #0x1
    str r1, [r0, #0xd88]
.L_168:
    ldr r0, _LIT1
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1c
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, _LIT2
    str r0, [r1, #0xd88]
    ldr r1, [r2, #0x808]
    cmp r1, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, _LIT4
    ldr r1, [r1, #0x8]
    cmp r1, #0x3
    ldreq r1, [r2, #0x80c]
    cmpeq r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021b077c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word data_ov002_022cd888
_LIT2: .word data_ov002_022ce870
_LIT3: .word data_ov002_022ce878
_LIT4: .word data_ov002_022cd65c
