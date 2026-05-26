; func_0203244c — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .global func_0203244c
        .arm
func_0203244c:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r0
    mov r4, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl OS_DisableIrq
    ldr r2, [r5, #0x0]
    ldr r1, [r5, #0x4]
    cmp r2, r1
    moveq r6, #0x0
    beq .L_020324b4
    ldr r1, [r5, #0xc]
    add r2, r1, r2
    ldrb r1, [r2, #0x1]
    cmp r1, #0x1
    bne .L_020324a8
    mov r6, #0x0
    str r6, [r5, #0x0]
    ldr r1, [r5, #0x4]
    cmp r1, #0x0
    beq .L_020324b4
    ldr r1, [r5, #0xc]
    add r2, r1, r6
.L_020324a8:
    ldrh r1, [r2, #0x2]
    add r6, r2, #0x4
    str r1, [r4, #0x0]
.L_020324b4:
    bl OS_RestoreIrq
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
