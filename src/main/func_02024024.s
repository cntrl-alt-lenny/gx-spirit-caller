; func_02024024 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a8e4
        .extern Fill32
        .extern func_02024368
        .global func_02024024
        .arm
func_02024024:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_02024098
    mov r4, r0
    ldr r5, [r1, #0x4]
    ldr r1, .L_0202409c
    cmp r5, #0x0
    mov r3, #0x0
    ble .L_02024064
    ldr r2, [r1, #0x0]
.L_02024048:
    ldr r0, [r2, #0x0]
    cmp r0, #0x0
    beq .L_02024064
    add r3, r3, #0x1
    cmp r3, r5
    add r2, r2, #0x88
    blt .L_02024048
.L_02024064:
    cmp r3, r5
    mov r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r2, #0x88
    mul r5, r3, r2
    ldr r6, [r1, #0x0]
    add r1, r6, r5
    bl Fill32
    add r0, r6, r5
    str r4, [r6, r5]
    bl func_02024368
    add r0, r6, r5
    ldmia sp!, {r4, r5, r6, pc}
.L_02024098:
        .word   data_0219a8e4
.L_0202409c:
        .word   0x0219a8e4                       ; literal value of `data_0219a8e4` — bypasses patcher trim
