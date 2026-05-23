; func_02006950 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_02104f1c
        .extern Fill32
        .extern Task_PostLocked
        .extern func_0207d4dc
        .extern func_02090624
        .extern func_020929ac
        .extern func_02092c78
        .extern func_02092c8c
        .extern func_020983f4
        .global func_02006950
        .arm
func_02006950:
    stmdb sp!, {r4, lr}
    ldr r1, .L_020069ec
    mov r0, #0x0
    mov r2, #0x20
    bl Fill32
    ldr r1, .L_020069f0
    mvn r2, #0x0
    str r2, [r1, #0xc]
    mov r0, #0x0
    str r2, [r1, #0x8]
    bl func_02092c78
    mov r4, r0
    mov r0, #0x0
    bl func_02092c8c
    add r1, r4, #0x3
    bic r2, r0, #0x3
    bic r0, r1, #0x3
    sub r4, r2, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x4
    bl func_020929ac
    mov r1, r4
    mov r2, #0x0
    bl func_0207d4dc
    ldr r1, .L_020069f0
    str r0, [r1, #0x1c]
    mov r0, #0x40000
    bl func_02090624
    mov r0, #0x0
    mov r1, r0
    bl func_020983f4
    mov r4, r0
    mov r1, #0x4
    mov r2, r1
    bl Task_PostLocked
    mov r1, r4
    bl func_020983f4
    ldmia sp!, {r4, pc}
.L_020069ec:
        .word   data_02104f1c
.L_020069f0:
        .word   0x02104f1c                       ; literal value of `data_02104f1c` — bypasses patcher trim
