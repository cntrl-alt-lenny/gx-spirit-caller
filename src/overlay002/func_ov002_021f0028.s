; func_ov002_021f0028 — .s escape hatch (brief 290): mwcc is byte-identical except
; the commutative add-operand order below (a CSE'd-temp wall, brief 288).
;   fix [11]: C emits `add r1, r4, r1`; original is `add r1, r1, r4`.

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_0202e2f8
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .global func_ov002_021f0028
        .arm
func_ov002_021f0028:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldr r3, _LIT0
    and r4, r7, #0x1
    mov r6, r2
    mov r1, #0x14
    mul r5, r4, r3
    mul r4, r6, r1
    ldr r2, _LIT1
    mov r8, r0
    add r1, r2, r5
    add r1, r1, r4
    ldr r1, [r1, #0x30]
    mov r0, r1, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r6, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r8, #0x2]
    mov r1, r1, lsl #0x1f
    cmp r7, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
