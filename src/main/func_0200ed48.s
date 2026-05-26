; func_0200ed48 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02186ae8
        .extern Fill32
        .global func_0200ed48
        .arm
func_0200ed48:
    stmdb sp!, {r4, lr}
    ldr r0, .L_0200edb4
    mov r1, #0x0
    ldr r3, [r0, #0xc]
    cmp r3, #0x0
    ble .L_0200edac
    ldr ip, [r0, #0x14]
    mov r2, ip
.L_0200ed68:
    ldr r0, [r2, #0x60]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_0200ed9c
    mov r2, #0x284
    mul r4, r1, r2
    add r1, ip, r4
    mov r0, #0x0
    bl Fill32
    ldr r0, .L_0200edb4
    ldr r0, [r0, #0x14]
    add r0, r0, r4
    ldmia sp!, {r4, pc}
.L_0200ed9c:
    add r1, r1, #0x1
    cmp r1, r3
    add r2, r2, #0x284
    blt .L_0200ed68
.L_0200edac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0200edb4:
        .word   data_02186ae8
