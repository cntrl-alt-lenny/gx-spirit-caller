; func_ov002_021ee23c — .s escape hatch (brief 290): mwcc is byte-identical except
; the commutative add-operand order below (a CSE'd-temp wall, brief 288).
;   fix [14]: C emits `add r2, r1, r2`; original is `add r2, r2, r1`.

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c84e0
        .global func_ov002_021ee23c
        .arm
func_ov002_021ee23c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r2
    mov r6, r0
    cmp r4, #0x5
    mov r5, r1
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    and r2, r5, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r2, _LIT1
    mul r1, r4, r1
    add r2, r2, r0
    add r2, r2, r1
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    movs r2, r2, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r6, #0x2]
    mov r2, r2, lsl #0x1f
    cmp r5, r2, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r2, _LIT2
    add r0, r2, r0
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021c84e0
    cmp r0, #0x3
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
