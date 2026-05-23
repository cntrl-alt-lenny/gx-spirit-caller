; func_0202142c — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_02194340
        .global func_0202142c
        .arm
func_0202142c:
    ldr r1, .L_02021474
    ldr r3, .L_02021478
    ldr r1, [r1, #0x0]
    cmp r1, #0x1
    movne r0, #0x1
    bxne lr
    ldr r1, [r0, #0x4]
    cmp r1, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r2, [r0, #0x0]
    mov r1, #0x2
    bic r2, r2, #0x1
    orr r2, r2, #0x1
    str r2, [r0, #0x0]
    str r1, [r3, #0x0]
    mov r0, #0x1
    bx lr
.L_02021474:
        .word   data_02194340
.L_02021478:
        .word   0x02194340                       ; literal value of `data_02194340` — bypasses patcher trim
