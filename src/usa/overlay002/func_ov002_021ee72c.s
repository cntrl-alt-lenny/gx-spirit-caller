; func_ov002_021ee72c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce7a4
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern func_ov002_021b3ef8
        .extern func_ov002_021c1d64
        .extern func_ov002_021c8390
        .global func_ov002_021ee72c
        .arm
func_ov002_021ee72c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r5, r1
    ldr r3, _LIT0
    and ip, r5, #0x1
    mov r4, r2
    mov r6, #0x14
    mul r3, ip, r3
    mul ip, r4, r6
    ldr lr, _LIT1
    add r6, lr, r3
    add r6, r6, ip
    ldr lr, [r6, #0x30]
    mov r6, r0
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021c1d64
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r1, [r6]
    ldr r0, _LIT3
    cmp r1, r0
    bne .L_98
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8390
    ldr r1, _LIT4
    cmp r0, r1
    movlt r0, #0x0
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
.L_98:
    ldrh r0, [r6, #0x8]
    cmp r0, #0x0
    bne .L_128
    ldr ip, _LIT5
    mov r1, #0x0
    ldr r7, [ip, #0x5d4]
    cmp r7, #0x0
    bls .L_148
    ldr lr, _LIT6
.L_bc:
    ldrb r0, [ip, #0x5dc]
    cmp r0, #0x6
    cmpne r0, #0x7
    cmpne r0, #0x8
    bne .L_110
    ldr r2, [lr]
    mov r3, r2, lsl #0x16
    cmp r5, r3, lsr #0x1f
    moveq r0, r2, lsl #0x12
    cmpeq r4, r0, lsr #0x1c
    bne .L_110
    ldrh r1, [r6, #0x2]
    mov r0, r2, lsl #0xf
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    eor r0, r0, r3, lsr #0x1f
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_110:
    add r1, r1, #0x1
    cmp r1, r7
    add ip, ip, #0x1
    add lr, lr, #0x4
    bcc .L_bc
    b .L_148
.L_128:
    ldrh r1, [r6, #0x4]
    ldr r2, _LIT3
    mov r0, r5
    mov r3, r1, lsl #0x11
    mov r1, r4
    mov r3, r3, lsr #0x17
    bl func_ov002_021b3ef8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_148:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x00001518
_LIT4: .word 0x000005dc
_LIT5: .word data_ov002_022ce1a8
_LIT6: .word data_ov002_022ce7a4
