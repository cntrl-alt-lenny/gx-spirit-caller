; func_020988a8 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_02102c44
        .extern func_02000950
        .extern func_02092904
        .extern func_02093bfc
        .extern func_020945f4
        .extern func_020989a8
        .extern func_02098cdc
        .global func_020988a8
        .arm
func_020988a8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_02098cdc
    ldr r1, .L_02098998
    mov r4, r0
    ldrh r0, [r1, #0x0]
    cmp r0, #0x2
    bne .L_0209893c
    ldrb r1, [r5, #0x1f]
    mov r0, #0x0
    ands r1, r1, #0x2
    beq .L_02098918
    ldr r1, .L_0209899c
    ldr r3, .L_020989a0
    ldr r2, .L_020989a4
    sub ip, r1, r3
    smull r1, lr, r2, ip
    mov lr, lr, asr #0x3
    mov r1, ip, lsr #0x1f
    ldr r2, [r5, #0x0]
    add lr, r1, lr
    cmp r2, lr
    bhs .L_02098918
    mov r0, #0x14
    mla r0, r2, r0, r3
    ldr r1, [r5, #0x4]
    mov r2, r4
    bl func_020989a8
.L_02098918:
    cmp r0, #0x0
    bne .L_0209893c
    ldr r0, [r5, #0x4]
    mov r2, r4
    mov r1, #0x0
    bl func_020945f4
    bl func_02093bfc
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_0209893c:
    ldrb r0, [r5, #0x1f]
    ands r0, r0, #0x1
    beq .L_02098954
    ldr r0, [r5, #0x4]
    add r0, r0, r4
    bl func_02000950
.L_02098954:
    ldr r0, [r5, #0x4]
    ldr r1, [r5, #0x8]
    bl func_02092904
    ldr r6, [r5, #0x10]
    ldr r4, [r5, #0x14]
    cmp r6, r4
    ldmhsia sp!, {r4, r5, r6, lr}
    bxhs lr
.L_02098974:
    ldr r0, [r6, #0x0]
    cmp r0, #0x0
    beq .L_02098984
    blx r0
.L_02098984:
    add r6, r6, #0x4
    cmp r6, r4
    blo .L_02098974
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
.L_02098998: .word 0x27ffc40
.L_0209899c:
        .word   data_02102c44
.L_020989a0:
        .word   0x02102c44                       ; literal value of `data_02102c44` — bypasses patcher trim
.L_020989a4: .word 0x66666667
