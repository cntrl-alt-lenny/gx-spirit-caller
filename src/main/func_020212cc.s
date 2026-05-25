; func_020212cc — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_02194340
        .extern Fill32
        .extern func_020211a4
        .extern func_02021bac
        .extern func_02021cbc
        .extern func_02023478
        .extern func_02023574
        .extern func_02023fec
        .extern func_020240a0
        .extern func_020244e8
        .extern func_020245e8
        .extern func_02027048
        .extern func_02027144
        .extern func_020286a0
        .extern func_02028804
        .extern func_0202a240
        .extern func_0202a2f8
        .global func_020212cc
        .arm
func_020212cc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, .L_02021420
    mov r5, r0
    ldr r0, [r1, #0x0]
    ldr r4, .L_02021424
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x4]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r5, #0x14]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_020213a0
    add r7, r5, #0x18
.L_02021310:
    ldr r0, [r7, #0x0]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_0202138c
.L_02021320: ; jump table
    b .L_0202133c ; case 0
    b .L_02021348 ; case 1
    b .L_02021354 ; case 2
    b .L_02021360 ; case 3
    b .L_0202136c ; case 4
    b .L_02021378 ; case 5
    b .L_02021384 ; case 6
.L_0202133c:
    ldr r0, [r7, #0x4]
    bl func_02021cbc
    b .L_0202138c
.L_02021348:
    ldr r0, [r7, #0x4]
    bl func_02023574
    b .L_0202138c
.L_02021354:
    ldr r0, [r7, #0x4]
    bl func_020240a0
    b .L_0202138c
.L_02021360:
    ldr r0, [r7, #0x4]
    bl func_020245e8
    b .L_0202138c
.L_0202136c:
    ldr r0, [r7, #0x4]
    bl func_02027144
    b .L_0202138c
.L_02021378:
    ldr r0, [r7, #0x4]
    bl func_02028804
    b .L_0202138c
.L_02021384:
    ldr r0, [r7, #0x4]
    bl func_0202a2f8
.L_0202138c:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0xc
    blt .L_02021310
.L_020213a0:
    ldr r1, [r5, #0xc]
    cmp r1, #0x0
    beq .L_020213b4
    ldr r0, [r5, #0x10]
    blx r1
.L_020213b4:
    ldr r2, .L_02021428
    mov r1, r5
    mov r0, #0x0
    bl Fill32
    ldr r0, [r4, #0x8]
    subs r0, r0, #0x1
    str r0, [r4, #0x8]
    bne .L_02021418
    mov r0, #0x0
    str r0, [r4, #0x0]
    bl func_02021bac
    mov r0, #0x1
    bl func_020211a4
    cmp r0, #0x0
    bne .L_020213fc
    bl func_02023478
    bl func_02023fec
    bl func_020244e8
.L_020213fc:
    mov r0, #0x2
    bl func_020211a4
    cmp r0, #0x0
    bne .L_02021414
    bl func_02027048
    bl func_020286a0
.L_02021414:
    bl func_0202a240
.L_02021418:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02021420:
        .word   data_02194340
.L_02021424:
        .word   data_02194340
.L_02021428:
        .word   0x618
