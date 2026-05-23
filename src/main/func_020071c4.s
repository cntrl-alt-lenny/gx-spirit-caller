; func_020071c4 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_02104f1c
        .extern func_020057dc
        .extern func_02006918
        .extern func_02006a38
        .global func_020071c4
        .arm
func_020071c4:
    stmdb sp!, {r4, lr}
    ldr r0, .L_02007210
    ldr r4, .L_02007214
    ldr r0, [r0, #0x10]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r4, pc}
    bl func_02006918
    bl func_02006a38
    ldr r0, [r4, #0x14]
    cmp r0, #0x0
    beq .L_020071f8
    bl func_020057dc
.L_020071f8:
    ldr r1, [r4, #0x10]
    mov r0, #0x0
    bic r1, r1, #0x2
    str r1, [r4, #0x10]
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.L_02007210:
        .word   data_02104f1c
.L_02007214:
        .word   0x02104f1c                       ; literal value of `data_02104f1c` — bypasses patcher trim
