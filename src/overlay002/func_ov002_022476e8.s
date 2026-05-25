; func_ov002_022476e8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cacc0
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_022477e8
        .global func_ov002_022476e8
        .arm
func_ov002_022476e8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r8, .L_0224778c
    mov r7, r2
    ldr r2, [r8, #0x48c]
    ldrh r2, [r2, #0x2]
    mov r2, r2, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    cmpeq r1, #0xb
    bne .L_02247784
    ldr r1, .L_02247790
    mov r5, #0x0
    ldr r1, [r1, #0x0]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_02247784
    ldr r2, .L_02247794
    ldr r1, .L_02247798
    and r0, r0, #0x1
    mla r1, r0, r1, r2
    ldr r6, .L_0224779c
    add r4, r1, #0x120
.L_0224773c:
    ldr r1, [r6, #0x0]
    ldr r0, [r4, r7, lsl #0x2]
    mov r1, r1, lsl #0x13
    mov r1, r1, lsr #0x13
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    bne .L_02247770
    ldr r0, [r8, #0x48c]
    mov r1, r5
    bl func_ov002_022477e8
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_02247770:
    ldr r0, [r6, #0x4]!
    add r5, r5, #0x1
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_0224773c
.L_02247784:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0224778c:
        .word   data_ov002_022ce288
.L_02247790:
        .word   data_ov002_022cacc0
.L_02247794:
        .word   data_ov002_022cf16c
.L_02247798:
        .word   0x868
.L_0224779c:
        .word   data_ov002_022cacc0
