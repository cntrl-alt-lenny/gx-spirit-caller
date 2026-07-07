; func_ov002_0222fab8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021de3c0
        .extern func_ov002_021de438
        .global func_ov002_0222fab8
        .arm
func_ov002_0222fab8:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_4a4
    cmp r1, #0x80
    bne .L_4d8
    ldr r3, _LIT1
    ldr lr, _LIT2
    ldr r1, [r3, #0x4]
    ldr r2, _LIT3
    and ip, r1, #0x1
    mla lr, ip, r2, lr
    ldr r3, [r3, #0x20]
    mov r2, #0x14
    mul r2, r3, r2
    add r3, lr, #0x30
    ldr r2, [r3, r2]
    mov r3, r2, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    mov r2, r2, lsl #0x12
    cmp r1, r2, lsr #0x1f
    beq .L_468
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_49c
.L_468:
    ldrh r1, [r0, #0x2]
    ldr r0, _LIT5
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_494
    ldr r0, _LIT4
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_49c
.L_494:
    ldr r0, _LIT6
    bl func_ov002_021ae3a4
.L_49c:
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_4a4:
    ldr r1, _LIT4
    ldr r1, [r1, #0xd44]
    cmp r1, #0x0
    beq .L_4c8
    ldr r2, _LIT1
    ldr r1, [r2, #0x4]
    ldr r2, [r2, #0x20]
    bl func_ov002_021de438
    b .L_4d8
.L_4c8:
    ldr r2, _LIT1
    ldr r1, [r2, #0x4]
    ldr r2, [r2, #0x20]
    bl func_ov002_021de3c0
.L_4d8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cd664
_LIT6: .word 0x00000137
