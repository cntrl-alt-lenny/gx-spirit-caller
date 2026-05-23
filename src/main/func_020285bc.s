; func_020285bc — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_0219a92c
        .extern Fill32
        .extern Task_PostLocked
        .extern func_02005bfc
        .extern func_0201d5c0
        .extern func_0201e7e0
        .extern func_020211a4
        .global func_020285bc
        .arm
func_020285bc:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, .L_02028694
    mov r5, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r0, .L_02028698
    str r5, [r0, #0x4]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_0202861c
    ldr r1, [r4, #0x4]
    mov r0, #0x19c
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
.L_0202861c:
    mov r0, #0x0
    bl func_020211a4
    cmp r0, #0x0
    beq .L_0202868c
    mov r2, #0x4000000
    ldr r0, [r2, #0x0]
    ldr r1, .L_0202869c
    add r3, r2, #0x1000
    and r0, r0, r1
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2, #0x0]
    ldr r2, [r3, #0x0]
    mov r0, #0x4
    and r1, r2, r1
    orr r2, r1, #0x10
    orr r2, r2, #0x200000
    mov r1, #0x2
    str r2, [r3, #0x0]
    bl func_0201d5c0
    mov r0, #0x9
    mov r1, #0x2
    bl func_0201d5c0
    bl func_0201e7e0
    mov r0, #0x1
    bl func_02005bfc
    mov r0, #0x2
    bl func_02005bfc
.L_0202868c:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02028694:
        .word   data_0219a92c
.L_02028698:
        .word   0x0219a92c                       ; literal value of `data_0219a92c` — bypasses patcher trim
.L_0202869c: .word 0xffcfffef
