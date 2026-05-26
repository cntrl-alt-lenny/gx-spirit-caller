; func_0203d078 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern Copy32
        .global func_0203d078
        .arm
func_0203d078:
    stmdb sp!, {lr}
    sub sp, sp, #0x4
    ldr lr, .L_0203d0dc
    add ip, r3, #0xbf0
    add r3, r3, lr
    strb r0, [r3, #0x1]
    ldrh lr, [r1, #0x2]
    and r2, r2, #0x7f
    ands r0, lr, #0x2
    movne r0, lr, asr #0x2
    andne r0, r0, #0xff
    moveq r0, lr, asr #0x2
    addeq r0, r0, #0x19
    andeq r0, r0, #0xff
    strb r0, [r3, #0x2]
    ldrb lr, [r3, #0x3]
    mov r0, r1
    bic r1, lr, #0x7f
    orr lr, r1, r2
    mov r1, ip
    mov r2, #0xc0
    strb lr, [r3, #0x3]
    bl Copy32
    add sp, sp, #0x4
    ldmia sp!, {pc}
.L_0203d0dc:
        .word   0x46c
