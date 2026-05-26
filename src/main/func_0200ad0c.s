; func_0200ad0c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02186ae8
        .extern data_02186b00
        .extern Fill32
        .extern Task_PostLocked
        .extern func_0200ac44
        .global func_0200ad0c
        .arm
func_0200ad0c:
    stmdb sp!, {r3, lr}
    mov r1, #0x284
    mul r3, r0, r1
    ldr r2, .L_0200ad88
    mov r1, #0x4
    str r0, [r2, #0xc]
    mov r0, r3
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    ldr r0, .L_0200ad88
    mov r2, #0x284
    str r1, [r0, #0x14]
    ldr r3, [r0, #0xc]
    mov r0, #0x0
    mul r2, r3, r2
    bl Fill32
    ldr r1, .L_0200ad8c
    mov r0, #0x0
    mov r2, #0x30
    bl Fill32
    bl func_0200ac44
    ldr r0, .L_0200ad88
    mov r2, #0x0
    strh r2, [r0, #0x0]
    mov r1, #0x40
    strh r1, [r0, #0x6]
    strh r2, [r0, #0x2]
    str r2, [r0, #0x8]
    str r2, [r0, #0x10]
    ldmia sp!, {r3, pc}
.L_0200ad88:
        .word   data_02186ae8
.L_0200ad8c:
        .word   data_02186b00
