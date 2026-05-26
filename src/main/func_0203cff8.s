; func_0203cff8 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern Copy32
        .global func_0203cff8
        .arm
func_0203cff8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldrh r4, [r1, #0x2]
    ldr lr, .L_0203d074
    add r5, r3, #0x470
    mov ip, #0xc0
    add r3, r3, lr
    mla ip, r0, ip, r5
    add r0, r3, r0, lsl #0x2
    ands r3, r4, #0x2
    movne r3, r4, asr #0x2
    andne r4, r3, #0xff
    moveq r3, r4, asr #0x2
    addeq r3, r3, #0x19
    andeq r4, r3, #0xff
    ldrb r3, [r0, #0x2]
    and lr, r4, #0xff
    cmp lr, r3
    bls .L_0203d05c
    strb lr, [r0, #0x2]
    ldrb r3, [r0, #0x3]
    and r2, r2, #0x7f
    bic r3, r3, #0x7f
    orr r2, r3, r2
    strb r2, [r0, #0x3]
.L_0203d05c:
    mov r0, r1
    mov r1, ip
    mov r2, #0xc0
    bl Copy32
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
.L_0203d074:
        .word   0x444
