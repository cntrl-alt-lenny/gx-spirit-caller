; func_02023274 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02104f1c
        .extern data_0219a8dc
        .extern Fill32
        .extern Task_PostLocked
        .extern func_02010f84
        .extern func_0207deb0
        .extern func_0207e124
        .extern func_0207e370
        .extern func_020852cc
        .extern func_0208c884
        .extern func_0208c8b0
        .extern func_0208c8cc
        .extern func_0208e4d0
        .extern func_0208e5ec
        .extern func_0208e6ac
        .extern func_0208e7ac
        .extern func_0208e918
        .global func_02023274
        .arm
func_02023274:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    ldr r4, .L_02023448
    mov r5, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x8
    bl Fill32
    ldr r0, .L_0202344c
    str r5, [r0, #0x4]
    ldr r0, [r0, #0x0]
    cmp r0, #0x0
    bne .L_020232d8
    ldr r1, [r4, #0x4]
    mov r0, #0xd0
    mul r5, r1, r0
    mov r0, r5
    mov r1, #0x4
    mov r2, #0x0
    bl Task_PostLocked
    mov r1, r0
    mov r2, r5
    mov r0, #0x0
    str r1, [r4, #0x0]
    bl Fill32
.L_020232d8:
    mov r0, #0x0
    mov r1, r0
    bl func_02010f84
    mov r0, #0x1
    mov r1, r0
    bl func_02010f84
    ldr r2, .L_02023450
    ldr r0, .L_02023454
    ldr r1, [r2, #0x0]
    and r0, r1, r0
    orr r0, r0, #0x10
    orr r0, r0, #0x200000
    str r0, [r2, #0x0]
    bl func_020852cc
    ldr r1, .L_02023458
    add r0, sp, #0x4
    ldr r1, [r1, #0x1c]
    mov r2, #0x4
    bl func_0207deb0
    mov r0, #0x2
    mov r1, #0x1
    bl func_0207e124
    mov r0, #0x8000
    mov r1, #0x1
    bl func_0207e370
    bl func_0208e918
    bl func_0208e7ac
    ldr r1, .L_0202345c
    mov r2, #0x2
    str r2, [r1, #0x0]
    mov r0, #0x1
    mov r1, #0x0
    mov r2, r0
    bl func_0208c8cc
    mov r0, #0x0
    bl func_0208c8b0
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    add r0, r2, #0x6c
    mov r1, #0x0
    bl func_0208c884
    ldr ip, .L_02023460
    ldr r0, .L_02023464
    ldrh r2, [ip, #0x0]
    ldr r1, .L_02023468
    bic r2, r2, #0x3
    orr r2, r2, #0x2
    strh r2, [ip, #0x0]
    ldrh r2, [ip, #0x58]
    and r0, r2, r0
    strh r0, [ip, #0x58]
    ldrh r0, [ip, #0x58]
    and r0, r0, r1
    strh r0, [ip, #0x58]
    ldrh r0, [ip, #0x58]
    bic r0, r0, #0x3000
    orr r0, r0, #0x8
    strh r0, [ip, #0x58]
    ldrh r0, [ip, #0x58]
    bic r0, r0, #0x3000
    orr r0, r0, #0x10
    strh r0, [ip, #0x58]
    ldrh r2, [ip, #0x58]
    mov r0, #0x0
    sub r1, r1, #0x1c
    and lr, r2, r1
    mov r1, r0
    mov r2, r0
    mov r3, r0
    strh lr, [ip, #0x58]
    bl func_0208e6ac
    mov r0, #0x0
    ldr r2, .L_0202346c
    mov r1, #0x1f
    mov r3, #0x3f
    str r0, [sp, #0x0]
    bl func_0208e5ec
    mov r0, #0x0
    bl func_0208e4d0
    ldr r2, .L_02023470
    ldr r1, .L_02023474
    mov r0, #0x1
    str r2, [r1, #0x0]
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_02023448:
        .word   data_0219a8dc
.L_0202344c:
        .word   data_0219a8dc
.L_02023450:
        .word   0x4001000
.L_02023454:
        .word   0xffcfffef
.L_02023458:
        .word   data_02104f1c
.L_0202345c:
        .word   0x4000540
.L_02023460:
        .word   0x4000008
.L_02023464:
        .word   0xffffcffd
.L_02023468:
        .word   0xcffb
.L_0202346c:
        .word   0x7fff
.L_02023470:
        .word   0xbfff0000
.L_02023474:
        .word   0x4000580
