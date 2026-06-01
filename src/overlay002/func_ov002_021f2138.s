; func_ov002_021f2138 — .s escape hatch (brief 290): mwcc is byte-identical except
; the commutative add-operand order below (a CSE'd-temp wall, brief 288).
;   fix [19]: C emits `add r0, r2, r0`; original is `add r0, r0, r2`.

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1e44
        .extern func_ov002_021c8940
        .global func_ov002_021f2138
        .arm
func_ov002_021f2138:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    and r2, r5, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r2, r4, r0
    ldr r1, _LIT1
    add r0, r1, r3
    add r0, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT2
    add r0, r0, r3
    ldrh r0, [r2, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c8940
    cmp r0, #0x7
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
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
