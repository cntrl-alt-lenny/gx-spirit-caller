; func_0207c20c — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .extern data_021a088c
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_0207c20c
        .arm
func_0207c20c:
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r2, .L_0207c27c
    ldr r1, [r2, #0x0]
    cmp r1, #0x0
    bne .L_0207c23c
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {lr}
    bx lr
.L_0207c23c:
    add r1, r1, #0x2000
    ldr r1, [r1, #0x260]
    cmp r1, #0x1
    beq .L_0207c260
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {lr}
    bx lr
.L_0207c260:
    mov r1, #0x0
    str r1, [r2, #0x0]
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {lr}
    bx lr
.L_0207c27c:
        .word   data_021a088c
