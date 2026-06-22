; func_ov002_021ca6f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cd744
        .extern data_ov002_022cd968
        .extern data_ov002_022ce950
        .extern data_ov002_022d016c
        .extern func_ov002_021b1cf0
        .extern func_ov002_0229c7f8
        .global func_ov002_021ca6f8
        .arm
func_ov002_021ca6f8:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r2, [r1, #0x80c]
    cmp r2, #0x0
    ldreq r1, [r1, #0x808]
    cmpeq r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, _LIT1
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_64
    ldr r1, _LIT2
    ldr r2, [r1, #0xcec]
    cmp r2, r0
    bne .L_5c
    ldr r0, [r1, #0xd14]
    cmp r0, #0x0
    beq .L_5c
    ldr r0, [r1, #0xd1c]
    cmp r0, #0x3
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
.L_5c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_64:
    ldr r1, _LIT3
    ldr r1, [r1, #0x4]
    cmp r0, r1
    bne .L_b4
    ldr r0, _LIT2
    ldr r0, [r0, #0xd48]
    cmp r0, #0x0
    bne .L_a4
    mov r0, #0x31
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    bne .L_a4
    mov r0, #0x32
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    beq .L_ac
.L_a4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_ac:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_b4:
    ldr r0, _LIT4
    ldr r0, [r0, #0x300]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    cmpeq r2, #0x0
    bne .L_dc
    bl func_ov002_021b1cf0
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
.L_dc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022cd73c
_LIT4: .word data_ov002_022cd968
