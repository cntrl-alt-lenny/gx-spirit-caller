; func_020244e8 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a8ec
        .extern Task_InvokeLocked
        .extern func_020245e8
        .global func_020244e8
        .arm
func_020244e8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_02024554
    ldr r4, .L_02024558
    ldr r0, [r0, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_02024534
    mov r6, r5
.L_02024508:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, r6]
    cmp r0, #0x0
    beq .L_02024520
    add r0, r1, r6
    bl func_020245e8
.L_02024520:
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x16c
    blt .L_02024508
.L_02024534:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_0202454c
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_0202454c:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_02024554:
        .word   data_0219a8ec
.L_02024558:
        .word   0x0219a8ec                       ; literal value of `data_0219a8ec` — bypasses patcher trim
