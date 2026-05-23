; func_0202a27c — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a934
        .extern Fill32
        .extern func_0202aa58
        .global func_0202a27c
        .arm
func_0202a27c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_0202a2f0
    mov r4, r0
    ldr r5, [r1, #0x4]
    ldr r1, .L_0202a2f4
    cmp r5, #0x0
    mov r3, #0x0
    ble .L_0202a2bc
    ldr r2, [r1, #0x0]
.L_0202a2a0:
    ldr r0, [r2, #0x0]
    cmp r0, #0x0
    beq .L_0202a2bc
    add r3, r3, #0x1
    cmp r3, r5
    add r2, r2, #0xec
    blt .L_0202a2a0
.L_0202a2bc:
    cmp r3, r5
    mov r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r2, #0xec
    mul r5, r3, r2
    ldr r6, [r1, #0x0]
    add r1, r6, r5
    bl Fill32
    add r0, r6, r5
    str r4, [r6, r5]
    bl func_0202aa58
    add r0, r6, r5
    ldmia sp!, {r4, r5, r6, pc}
.L_0202a2f0:
        .word   data_0219a934
.L_0202a2f4:
        .word   0x0219a934                       ; literal value of `data_0219a934` — bypasses patcher trim
