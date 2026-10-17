; func_02027048 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a924
        .extern Task_InvokeLocked
        .extern func_02027144
        .global func_02027048
        .arm
func_02027048:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_020270c8
    ldr r4, .L_020270cc
    ldr r0, [r0, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_02027094
    mov r6, r5
.L_02027068:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, r6]
    cmp r0, #0x0
    beq .L_02027080
    add r0, r1, r6
    bl func_02027144
.L_02027080:
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0xe0
    blt .L_02027068
.L_02027094:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_020270ac
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_020270ac:
    mov r0, #0x5000000
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x400
    strh r1, [r0, #0x0]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_020270c8:
        .word   data_0219a924
.L_020270cc:
        .word   0x0219a924                       ; literal value of `data_0219a924` — bypasses patcher trim
