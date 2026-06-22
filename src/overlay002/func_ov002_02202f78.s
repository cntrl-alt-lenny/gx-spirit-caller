; func_ov002_02202f78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1ef0
        .global func_ov002_02202f78
        .arm
func_ov002_02202f78:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r1, r3, lsl #0x14
    mov r1, r1, lsr #0x1a
    add r1, r1, #0x3f8
    add r1, r1, #0xfc00
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r1, #0x1
    bhi .L_e4
    ldr lr, [r0, #0x14]
    mov r1, lr, lsl #0x16
    mov r2, lr, lsl #0x12
    mov ip, lr, lsl #0x11
    movs ip, ip, lsr #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov ip, lr, lsl #0x10
    movs ip, ip, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r3, r3, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r3, _LIT0
    and lr, r1, #0x1
    mov ip, #0x14
    mul r3, lr, r3
    ldr lr, _LIT1
    mul ip, r2, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #0x30]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr lr, _LIT2
    add lr, lr, r3
    ldrh lr, [ip, lr]
    cmp lr, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr lr, _LIT3
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    movne r0, #0x2
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
.L_e4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a2
_LIT3: .word data_ov002_022cf1a4
