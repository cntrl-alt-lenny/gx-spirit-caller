; func_0201fbe0 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_020c6670
        .extern data_02191f40
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201fc6c
        .extern func_0201fd24
        .global func_0201fbe0
        .arm
func_0201fbe0:
    stmdb sp!, {r3, lr}
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_0201fbf8
    bl func_0201f19c
    ldmia sp!, {r3, pc}
.L_0201fbf8:
    mov r0, #0x1
    bl func_0201f138
    ldr r0, .L_0201fc64
    ldrh r1, [r0, #0x0]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    beq .L_0201fc34
    bl func_0201fc6c
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_0201fc34:
    bl func_0201fd24
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, .L_0201fc64
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_0201fc58
    ldr r0, .L_0201fc68
    blx r1
.L_0201fc58:
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_0201fc64:
        .word   data_02191f40
.L_0201fc68:
        .word   data_020c6670
