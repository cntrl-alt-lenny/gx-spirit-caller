; func_ov002_02205950 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern data_ov002_022d0170
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021ff2cc
        .global func_ov002_02205950
        .arm
func_ov002_02205950:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r3, lsl #0x1f
    mov ip, r2, lsr #0x1f
    and r2, ip, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r3, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x1b
    ldreq r1, [r4, #0x14]
    moveq r0, r1, lsl #0x16
    cmpeq ip, r0, lsr #0x1f
    bne .L_dc
    mov r0, r1, lsl #0x12
    mov r0, r0, lsr #0x1c
    cmp r0, #0x4
    bhi .L_dc
    mov r0, r1, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_dc
    mov r0, r1, lsl #0x10
    movs r0, r0, lsr #0x1f
    beq .L_dc
    mov r0, r1, lsl #0x9
    mov r0, r0, lsr #0x1c
    cmp r0, #0xe
    bne .L_dc
    mov r1, r1, lsl #0x17
    ldr r0, _LIT2
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r4, r0, lsr #0x13
    mov r0, r4
    bl func_0202e2a4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_dc:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022d0170
