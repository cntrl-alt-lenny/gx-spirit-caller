; func_0207391c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_0219eefc
        .extern data_0219ef24
        .extern data_0219ef28
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_0207391c
        .arm
func_0207391c:
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r2, .L_02073970
    ldr r1, .L_02073974
    ldr lr, [r2, #0x0]
    ldr ip, [r1, #0x0]
    ldr r3, [r2, #0x0]
    ldr r1, .L_02073978
    ldrh r3, [ip, r3]
    add r3, lr, r3
    str r3, [r2, #0x0]
    ldr r3, [r2, #0x0]
    ldr r1, [r1, #0x0]
    cmp r3, r1
    movhs r1, #0x0
    strhs r1, [r2, #0x0]
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {lr}
    bx lr
.L_02073970:
        .word   data_0219eefc
.L_02073974:
        .word   data_0219ef24
.L_02073978:
        .word   data_0219ef28
