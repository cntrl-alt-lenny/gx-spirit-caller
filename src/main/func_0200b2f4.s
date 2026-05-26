; func_0200b2f4 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern Fill32
        .global func_0200b2f4
        .arm
func_0200b2f4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    movs r7, r3
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r6, #0x0
    beq .L_0200b354
    mov r5, r6
    mov r11, #0xc
    mvn r4, #0x0
.L_0200b31c:
    mov r0, r5
    mov r1, r10
    mov r2, r11
    bl Fill32
    ldr r1, [r9, r6, lsl #0x3]
    add r0, r9, r6, lsl #0x3
    add r1, r8, r1
    str r1, [r10, #0x0]
    ldr r0, [r0, #0x4]
    add r6, r6, #0x1
    stmib r10, {r0, r4}
    cmp r6, r7
    add r10, r10, #0xc
    blo .L_0200b31c
.L_0200b354:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
