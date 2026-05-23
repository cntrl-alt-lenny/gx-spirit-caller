; func_0200ac60 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_02186a58
        .extern func_0208e2f4
        .extern func_020b2d2c
        .extern func_020b3168
        .extern func_020b319c
        .extern func_020b31e4
        .global func_0200ac60
        .arm
func_0200ac60:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_0200ad00
    ldr r4, .L_0200ad04
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrsh r0, [r4, #0xe]
    ldrsh r6, [r4, #0xc]
    add r0, r0, #0x1
    strh r0, [r4, #0xe]
    ldrsh r0, [r4, #0xe]
    cmp r0, r6
    blt .L_0200aca4
    mov r1, #0x0
    ldrsh r0, [r4, #0xa]
    str r1, [r4, #0x0]
    b .L_0200ace8
.L_0200aca4:
    bl func_020b319c
    mov r5, r0
    mov r0, r6
    bl func_020b319c
    mov r1, r0
    mov r0, r5
    bl func_020b2d2c
    ldrsh r6, [r4, #0x8]
    ldrsh r1, [r4, #0xa]
    mov r5, r0
    sub r0, r1, r6
    bl func_020b319c
    mov r1, r0
    mov r0, r5
    bl func_020b31e4
    bl func_020b3168
    add r0, r6, r0
.L_0200ace8:
    str r0, [r4, #0x4]
    ldr r2, [r4, #0x4]
    ldr r0, .L_0200ad08
    mov r1, #0x3
    bl func_0208e2f4
    ldmia sp!, {r4, r5, r6, pc}
.L_0200ad00:
        .word   data_02186a58
.L_0200ad04:
        .word   0x02186a58                       ; literal value of `data_02186a58` — bypasses patcher trim
.L_0200ad08: .word 0x4000050
