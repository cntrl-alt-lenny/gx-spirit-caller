; func_020286a0 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a92c
        .extern Task_InvokeLocked
        .extern func_02005c60
        .extern func_02005ca0
        .extern func_02005e20
        .extern func_020211a4
        .extern func_02028804
        .global func_020286a0
        .arm
func_020286a0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_0202874c
    ldr r4, .L_02028750
    ldr r0, [r0, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_020286ec
    mov r6, r5
.L_020286c0:
    ldr r1, [r4, #0x0]
    ldr r0, [r1, r6]
    cmp r0, #0x0
    beq .L_020286d8
    add r0, r1, r6
    bl func_02028804
.L_020286d8:
    ldr r0, [r4, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x19c
    blt .L_020286c0
.L_020286ec:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02028704
    bl Task_InvokeLocked
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_02028704:
    mov r0, #0x0
    bl func_020211a4
    cmp r0, #0x0
    beq .L_02028744
    mov r0, #0x1
    bl func_02005ca0
    mov r0, #0x2
    bl func_02005ca0
    mov r0, #0x1
    bl func_02005e20
    mov r0, #0x2
    bl func_02005e20
    mov r0, #0x1
    bl func_02005c60
    mov r0, #0x2
    bl func_02005c60
.L_02028744:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_0202874c:
        .word   data_0219a92c
.L_02028750:
        .word   0x0219a92c                       ; literal value of `data_0219a92c` — bypasses patcher trim
