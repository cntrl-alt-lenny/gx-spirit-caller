; func_020323f4 — brief 655 review: no duplicate-address evidence.
; Taxonomy citation removed; never assessed as a C-match target.

        .text
        .extern data_0219b2b4
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_020323f4
        .arm
func_020323f4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    bl OS_DisableIrq
    mov r4, r0
    cmp r6, #0x0
    beq .L_02032428
    ldr r0, [r6, #0xc]
    ldr r5, [r6, #0x14]
    cmp r0, #0x0
    beq .L_02032420
    blx r5
.L_02032420:
    mov r0, r6
    blx r5
.L_02032428:
    bl OS_DisableIrq
    ldr r1, .L_02032448
    mov r2, #0x0
    str r2, [r1, #0x0]
    bl OS_RestoreIrq
    mov r0, r4
    bl OS_RestoreIrq
    ldmia sp!, {r4, r5, r6, pc}
.L_02032448:
        .word   data_0219b2b4
