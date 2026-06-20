; func_ov002_0223ad60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_ov002_021c1e44
        .extern func_ov002_021d479c
        .extern func_ov002_022112f8
        .global func_ov002_0223ad60
        .arm
func_ov002_0223ad60:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r2, [r2, #0x5a8]
    mov r4, r1
    cmp r2, #0x80
    bne .L_e4
    ldr r2, _LIT1
    ldr r3, _LIT2
    ldr r1, [r2]
    ldr r2, [r2, #0x1c]
    mov ip, #0x14
    ldr lr, _LIT3
    and r6, r1, #0x1
    mul ip, r2, ip
    mla r3, r6, r3, lr
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    beq .L_dc
    bl func_ov002_021c1e44
    cmp r0, #0x0
    bne .L_dc
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    bne .L_e4
    ldr r0, _LIT4
    ldr r0, [r0, #0xd0]
    tst r0, #0x1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r0, lsr #0x1
    tst r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    ldr r0, [r0]
    cmp r0, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT1
    orr r2, r1, #0x20
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, #0x0
    mov r3, r2
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021d479c
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x5ac]
    mov r0, #0x80
    ldmia sp!, {r4, r5, r6, pc}
.L_dc:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_e4:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022112f8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word 0x00000868
_LIT3: .word data_ov002_022cf1a4
_LIT4: .word data_ov002_022d016c
