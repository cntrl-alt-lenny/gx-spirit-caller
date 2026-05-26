; func_ov002_021f677c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_021e1404
        .global func_ov002_021f677c
        .arm
func_ov002_021f677c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, .L_021f67c8
    ldr r2, .L_021f67cc
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x3
    blo .L_021f67c0
    mov r1, #0x3
    mov r2, #0x0
    bl func_ov002_021e1404
    mov r0, #0x1
    strh r0, [r4, #0xc]
.L_021f67c0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_021f67c8:
        .word   0x868
.L_021f67cc:
        .word   data_ov002_022cf17c
