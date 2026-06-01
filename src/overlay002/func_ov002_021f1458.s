; func_ov002_021f1458 — .s escape hatch (brief 290): mwcc is byte-identical except
; the commutative add-operand order below (a CSE'd-temp wall, brief 288).
;   fix [11]: C emits `add lr, ip, lr`; original is `add lr, lr, ip`.

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1e44
        .global func_ov002_021f1458
        .arm
func_ov002_021f1458:
    stmdb sp!, {r3, lr}
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r3, pc}
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
    ldrh lr, [r0, #0x2]
    mov lr, lr, lsl #0x1f
    cmp r1, lr, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr lr, _LIT2
    add lr, lr, r3
    ldrh lr, [ip, lr]
    cmp lr, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr lr, _LIT3
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_021c1e44
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf1a2
