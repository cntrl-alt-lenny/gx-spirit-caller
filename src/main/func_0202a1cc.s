; func_0202a1cc — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a934
        .extern Fill32
        .extern Task_PostLocked
        .extern func_0202a998
        .global func_0202a1cc
        .arm
func_0202a1cc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, .L_0202a238
    mov r5, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r0, .L_0202a23c
    str r5, [r0, #0x4]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0202a22c
    ldr r1, [r4, #0x4]
    mov r0, #0xec
    mul r5, r1, r0
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r5
    mov r0, #0x0
    str r1, [r4, #0x0]
    bl Fill32
.L_0202a22c:
    bl func_0202a998
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_0202a238:
        .word   data_0219a934
.L_0202a23c:
        .word   0x0219a934                       ; literal value of `data_0219a934` — bypasses patcher trim
