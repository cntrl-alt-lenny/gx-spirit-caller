; func_ov002_021e97bc — .s escape hatch (brief 290): mwcc is byte-identical except
; the commutative add-operand order below (a CSE'd-temp wall, brief 288).
;   fix [14]: C emits `add lr, ip, lr`; original is `add lr, lr, ip`.

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .global func_ov002_021e97bc
        .arm
func_ov002_021e97bc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r3, _LIT0
    and lr, r5, #0x1
    mov ip, #0x14
    mul r3, lr, r3
    ldr lr, _LIT1
    mul ip, r4, ip
    add lr, lr, r3
    add lr, lr, ip
    ldr lr, [lr, #0x30]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
