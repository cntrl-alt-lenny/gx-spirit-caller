; func_020318b8 — brief 205 / Phase 2: C-34 candidate. Duplicate
; pool entries for the same data symbol; pure `.s` recipe per
; brief 202 (`func_02023f7c.s`). Subsequent duplicate `.word`
; entries use literal values instead of symbol references to
; defeat the patcher's trim heuristic (PR #115 / brief 204).

        .text
        .extern data_020fe45c
        .extern data_0219adb8
        .extern data_0219adcc
        .extern data_0219b27c
        .extern func_020318a4
        .extern func_02034754
        .global func_020318b8
        .arm
func_020318b8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_02031914
    ldr r1, .L_02031918
    ldr r5, .L_0203191c
    bl func_02034754
    ldr r6, .L_02031920
    mov r4, #0x0
.L_020318d4:
    mov r0, r5
    bl func_020318a4
    add r0, r5, #0x30
    bl func_020318a4
    ldrb r0, [r6], #0x1
    add r4, r4, #0x1
    cmp r4, #0xc
    str r0, [r5, #0x60]
    add r5, r5, #0x64
    blt .L_020318d4
    ldr r0, .L_02031924
    bl func_020318a4
    ldr r0, .L_02031928
    mov r1, #0x1
    str r1, [r0, #0x4]
    ldmia sp!, {r4, r5, r6, pc}
.L_02031914:
        .word   data_0219adb8
.L_02031918: .word 0x4f4
.L_0203191c:
        .word   data_0219adcc
.L_02031920:
        .word   data_020fe45c
.L_02031924:
        .word   data_0219b27c
.L_02031928:
        .word   0x0219adb8                       ; literal value of `data_0219adb8` — bypasses patcher trim
