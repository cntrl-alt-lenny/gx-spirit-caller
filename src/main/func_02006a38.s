; func_02006a38 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_020c3e84
        .extern data_02104f1c
        .extern func_020067f8
        .extern func_020069f4
        .extern func_0209286c
        .extern func_02098734
        .global func_02006a38
        .arm
func_02006a38:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, .L_02006b04
    ldr r4, .L_02006b08
    ldr r2, [r0, #0x10]
    ldr r1, [r0, #0x8]
    mov r2, r2, lsl #0x1f
    movs r2, r2, lsr #0x1f
    ldr r7, [r0, #0xc]
    ldmia r0, {r5, r6}
    beq .L_02006a8c
    mov r0, #0x0
    bl func_02098734
    mvn r0, #0x0
    cmp r7, r0
    beq .L_02006a80
    mov r1, r7
    mov r0, #0x0
    bl func_02098734
.L_02006a80:
    ldr r0, [r4, #0x10]
    bic r0, r0, #0x1
    str r0, [r4, #0x10]
.L_02006a8c:
    mov r0, r5
    bl func_020069f4
    cmp r0, #0x0
    moveq r7, #0x1
    mvn r0, #0x0
    movne r7, #0x0
    cmp r6, r0
    beq .L_02006ac4
    mov r0, r6
    bl func_020069f4
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    orr r7, r7, r0
.L_02006ac4:
    bl func_0209286c
    cmp r7, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r4, #0x10]
    ldr r2, .L_02006b0c
    bic r0, r0, #0x1
    orr r3, r0, #0x1
    mvn r0, #0x0
    ldr r1, [r2, r5, lsl #0x3]
    cmp r6, r0
    ldrne r0, [r2, r6, lsl #0x3]
    str r3, [r4, #0x10]
    str r1, [r4, #0x8]
    str r0, [r4, #0xc]
    bl func_020067f8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02006b04:
        .word   data_02104f1c
.L_02006b08:
        .word   0x02104f1c                       ; literal value of `data_02104f1c` — bypasses patcher trim
.L_02006b0c:
        .word   0x020c3e84                       ; literal value of `data_020c3e84` — bypasses patcher trim (last entry; ensures non-zero high byte)
