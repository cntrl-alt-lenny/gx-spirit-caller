; func_ov002_02222cac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021de910
        .extern func_ov002_0220e75c
        .extern func_ov002_02210104
        .extern func_ov002_0221074c
        .extern func_ov002_0221a798
        .extern func_ov002_0221b6d4
        .extern func_ov002_02220340
        .extern func_ov002_02221fc0
        .extern func_ov002_0222623c
        .global func_ov002_02222cac
        .arm
func_ov002_02222cac:
    stmdb sp!, {r4, lr}
    ldrh r3, [r0, #0x2]
    mov r2, r3, lsl #0x12
    mov r2, r2, lsr #0x1e
    cmp r2, #0x1
    moveq r2, r3, lsl #0x14
    moveq r2, r2, lsr #0x1a
    cmpeq r2, #0x5
    bne .L_444
    mov r1, r3, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov lr, r3, lsl #0x1a
    ldr ip, _LIT0
    ldr r2, _LIT1
    and r3, r1, #0x1
    mla r4, r3, r2, ip
    mov r2, lr, lsr #0x1b
    mov r3, #0x14
    ldrh ip, [r0, #0x4]
    mul r3, r2, r3
    mov lr, ip, lsl #0x11
    add r4, r4, #0x30
    ldr ip, [r4, r3]
    mov lr, lr, lsr #0x17
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    cmp lr, r3
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_ov002_021de910
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_444:
    ldrh r3, [r0]
    ldr r2, _LIT2
    cmp r3, r2
    bgt .L_494
    bge .L_4dc
    sub r2, r2, #0x29
    sub r2, r3, r2
    cmp r2, #0x9
    addls pc, pc, r2, lsl #0x2
    b .L_4ec
    b .L_4a4
    b .L_4ec
    b .L_4ac
    b .L_4ec
    b .L_4b4
    b .L_4bc
    b .L_4c4
    b .L_4cc
    b .L_4ec
    b .L_4d4
.L_494:
    ldr r2, _LIT3
    cmp r3, r2
    beq .L_4e4
    b .L_4ec
.L_4a4:
    bl func_ov002_0221a798
    ldmia sp!, {r4, pc}
.L_4ac:
    bl func_ov002_0221b6d4
    ldmia sp!, {r4, pc}
.L_4b4:
    bl func_ov002_0221074c
    ldmia sp!, {r4, pc}
.L_4bc:
    bl func_ov002_0221b6d4
    ldmia sp!, {r4, pc}
.L_4c4:
    bl func_ov002_02220340
    ldmia sp!, {r4, pc}
.L_4cc:
    bl func_ov002_0222623c
    ldmia sp!, {r4, pc}
.L_4d4:
    bl func_ov002_02210104
    ldmia sp!, {r4, pc}
.L_4dc:
    bl func_ov002_0220e75c
    ldmia sp!, {r4, pc}
.L_4e4:
    bl func_ov002_02221fc0
    ldmia sp!, {r4, pc}
.L_4ec:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001526
_LIT3: .word 0x00001694
