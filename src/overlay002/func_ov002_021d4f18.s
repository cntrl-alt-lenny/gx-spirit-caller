; func_ov002_021d4f18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd968
        .extern data_ov002_022ce950
        .extern data_ov002_022ce958
        .extern data_ov002_022d016c
        .extern func_ov002_021b085c
        .extern func_ov002_021b1570
        .extern func_ov002_021d48f4
        .extern func_ov002_021d4e10
        .extern func_ov002_0229c7f8
        .extern func_ov002_0229cd70
        .global func_ov002_021d4f18
        .arm
func_ov002_021d4f18:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r0, #0x0
    bl func_ov002_0229c7f8
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
    bl func_ov002_021d4e10
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
    bl func_ov002_0229cd70
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
    bl func_ov002_0229cd70
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
    bl func_ov002_021b1570
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
    bl func_ov002_021d48f4
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
    bl func_ov002_021b085c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd968
_LIT2: .word data_ov002_022ce950
_LIT3: .word data_ov002_022ce958
_LIT4: .word data_ov002_022cd73c
