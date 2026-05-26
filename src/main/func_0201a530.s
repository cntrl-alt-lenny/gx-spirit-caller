; func_0201a530 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02105f4c
        .extern GetSystemWork
        .extern func_0201a4dc
        .global func_0201a530
        .arm
func_0201a530:
    stmdb sp!, {r3, lr}
    bl GetSystemWork
    bl func_0201a4dc
    cmp r0, #0x1
    beq .L_0201a554
    cmp r0, #0x2
    cmpne r0, #0x3
    beq .L_0201a56c
    b .L_0201a584
.L_0201a554:
    ldr r1, .L_0201a58c
    ldr r0, .L_0201a590
    ldr r2, [r1, #0x854]
    umull r1, r0, r2, r0
    mov r0, r0, lsr #0xc
    ldmia sp!, {r3, pc}
.L_0201a56c:
    ldr r1, .L_0201a58c
    ldr r0, .L_0201a590
    ldr r2, [r1, #0x858]
    umull r1, r0, r2, r0
    mov r0, r0, lsr #0xc
    ldmia sp!, {r3, pc}
.L_0201a584:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_0201a58c:
        .word   data_02105f4c
.L_0201a590:
        .word   0xd1b71759
