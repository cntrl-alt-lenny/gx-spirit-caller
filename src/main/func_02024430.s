; func_02024430 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_020be754
        .extern data_0219a8ec
        .extern data_0219a8f4
        .extern Fill32
        .extern Task_PostLocked
        .extern func_02026f78
        .global func_02024430
        .arm
func_02024430:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    ldr r4, .L_020244d8
    ldr r1, .L_020244dc
    mov r6, r0
    add r3, sp, #0x0
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x38
    ldr r5, .L_020244e0
    bl Fill32
    ldr r0, .L_020244e4
    str r6, [r0, #0x4]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_020244a8
    ldr r1, [r4, #0x4]
    mov r0, #0x16c
    mul r6, r1, r0
    mov r0, r6
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r6
    mov r0, #0x0
    str r1, [r4, #0x0]
    bl Fill32
.L_020244a8:
    mov r2, #0x80
    mov r3, #0x5
    mov r1, #0x0
    add r0, sp, #0x0
    strb r3, [r5, #0x0]
    strh r2, [r5, #0x4]
    strh r2, [r5, #0x6]
    str r1, [r5, #0x1c]
    bl func_02026f78
    mov r0, #0x1
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_020244d8:
        .word   data_0219a8ec
.L_020244dc:
        .word   data_020be754
.L_020244e0:
        .word   data_0219a8f4
.L_020244e4:
        .word   0x0219a8ec                       ; literal value of `data_0219a8ec` — bypasses patcher trim
