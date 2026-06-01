; func_ov002_021eb128 — .s escape hatch (brief 290): mwcc is byte-identical except
; the commutative add-operand order below (a CSE'd-temp wall, brief 288).
;   fix [16]: C emits `add r3, lr, r3`; original is `add r3, r3, lr`.

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1ef0
        .global func_ov002_021eb128
        .arm
func_ov002_021eb128:
    stmdb sp!, {r4, lr}
    cmp r2, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, pc}
    ldrh r3, [r0, #0x2]
    mov r3, r3, lsl #0x1f
    cmp r1, r3, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr ip, _LIT0
    and lr, r1, #0x1
    mul r4, lr, ip
    mov r3, #0x14
    mul lr, r2, r3
    ldr ip, _LIT1
    add r3, ip, r4
    add r3, r3, lr
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r3, _LIT2
    add r3, r3, r4
    ldrh r3, [lr, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
