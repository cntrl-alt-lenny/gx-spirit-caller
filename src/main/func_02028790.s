; func_02028790 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a92c
        .extern Fill32
        .global func_02028790
        .arm
func_02028790:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_020287fc
    mov r4, r0
    ldr r5, [r1, #0x4]
    ldr r1, .L_02028800
    cmp r5, #0x0
    mov r3, #0x0
    ble .L_020287d0
    ldr r2, [r1, #0x0]
.L_020287b4:
    ldr r0, [r2, #0x0]
    cmp r0, #0x0
    beq .L_020287d0
    add r3, r3, #0x1
    cmp r3, r5
    add r2, r2, #0x19c
    blt .L_020287b4
.L_020287d0:
    cmp r3, r5
    mov r0, #0x0
    ldmgeia sp!, {r4, r5, r6, pc}
    mov r2, #0x19c
    mul r5, r3, r2
    ldr r6, [r1, #0x0]
    add r1, r6, r5
    bl Fill32
    str r4, [r6, r5]
    add r0, r6, r5
    ldmia sp!, {r4, r5, r6, pc}
.L_020287fc:
        .word   data_0219a92c
.L_02028800:
        .word   0x0219a92c                       ; literal value of `data_0219a92c` — bypasses patcher trim
