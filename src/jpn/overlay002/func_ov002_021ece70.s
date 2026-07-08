; func_ov002_021ece70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce7a4
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_021c1e10
        .global func_ov002_021ece70
        .arm
func_ov002_021ece70:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r3, _LIT0
    and lr, r5, #0x1
    mul r3, lr, r3
    ldr lr, _LIT1
    mov r4, r2
    mov ip, #0x14
    mul ip, r4, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #0x30]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh lr, [r0, #0x2]
    mov lr, lr, lsl #0x1f
    cmp r5, lr, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr lr, _LIT2
    add lr, lr, r3
    ldrh lr, [ip, lr]
    cmp lr, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr lr, _LIT3
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov002_021c1e10
    cmp r0, #0x0
    mov r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT4
    ldr r3, [r1, #0x5d4]
    cmp r3, #0x0
    bls .L_110
    ldr r2, _LIT5
.L_b4:
    ldrb ip, [r1, #0x5dc]
    add ip, ip, #0xf8
    and ip, ip, #0xff
    cmp ip, #0x1
    bhi .L_fc
    ldr lr, [r2]
    mov ip, lr, lsl #0x16
    cmp r5, ip, lsr #0x1f
    moveq ip, lr, lsl #0x12
    cmpeq r4, ip, lsr #0x1c
    bne .L_fc
    mov ip, lr, lsl #0x10
    movs ip, ip, lsr #0x1f
    bne .L_fc
    mov ip, lr, lsl #0x11
    movs ip, ip, lsr #0x1f
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
.L_fc:
    add r0, r0, #0x1
    cmp r0, r3
    add r1, r1, #0x1
    add r2, r2, #0x4
    bcc .L_b4
.L_110:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf0c2
_LIT4: .word data_ov002_022ce1a8
_LIT5: .word data_ov002_022ce7a4
