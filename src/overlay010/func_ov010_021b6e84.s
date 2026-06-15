; func_ov010_021b6e84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov010_021b9884
        .extern data_ov010_021b9890
        .extern func_02037208
        .extern func_ov005_021ab108
        .extern func_ov005_021ab260
        .extern func_ov005_021ab318
        .extern func_ov005_021ab384
        .extern func_ov005_021ac984
        .extern func_ov005_021ac9c8
        .extern func_ov005_021ac9d0
        .extern func_ov005_021ac9dc
        .extern func_ov005_021aca30
        .extern func_ov005_021aca64
        .extern func_ov010_021b23f4
        .extern func_ov010_021b3998
        .extern func_ov010_021b39c0
        .extern func_ov010_021b3a14
        .extern func_ov010_021b6868
        .global func_ov010_021b6e84
        .arm
func_ov010_021b6e84:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x100]
    ldr r5, [r0, #0xc]
    cmp r1, #0x1
    ldreq r0, [r4, #0x88]
    ldreq r1, [r0, #0x54]
    cmpeq r1, #0x0
    bne .L_4a4
    ldr r7, [r4, #0xe8]
    mov r1, r7
    bl func_ov005_021ac9d0
    ldr r1, _LIT2
    mov r6, r0
    ldrh r0, [r1, #0x54]
    tst r0, #0x2
    beq .L_290
    ldr r0, [r4, #0x358]
    orr r0, r0, #0x4
    str r0, [r4, #0x358]
    b .L_4a4
.L_290:
    tst r0, #0x1
    beq .L_2a8
    ldr r0, [r4, #0x358]
    orr r0, r0, #0x10
    str r0, [r4, #0x358]
    b .L_4a4
.L_2a8:
    ldrh r1, [r1, #0x56]
    tst r1, #0x40
    beq .L_2e0
    ldr r0, [r4, #0xe8]
    cmp r0, #0x0
    blt .L_2e0
    add r0, r4, #0x8c
    bl func_ov010_021b3998
    cmp r0, #0x0
    bne .L_4a4
    ldr r0, [r4, #0x88]
    mov r1, #0x8000
    bl func_ov005_021aca30
    b .L_4a4
.L_2e0:
    tst r1, #0x80
    beq .L_324
    ldr r0, [r4, #0x84]
    ldr r8, [r4, #0xe8]
    mov r1, #0x2
    bl func_ov005_021ab108
    sub r0, r0, #0x1
    cmp r8, r0
    bge .L_324
    add r0, r4, #0x8c
    bl func_ov010_021b39c0
    cmp r0, #0x0
    bne .L_4a4
    ldr r0, [r4, #0x88]
    mov r1, #0x8000
    bl func_ov005_021aca64
    b .L_4a4
.L_324:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x10
    beq .L_3a0
    ldr r0, [r4, #0x84]
    mov r1, r6
    bl func_ov005_021ab260
    cmp r0, #0x0
    ble .L_4a4
    ldr r0, [r4, #0x84]
    mov r1, r6
    mov r2, #0x2
    bl func_ov005_021ab384
    cmp r0, #0x0
    bne .L_370
    mov r0, r7
    mvn r1, #0x0
    bl func_ov010_021b6868
    b .L_4a4
.L_370:
    ldr r0, [r4, #0x88]
    bl func_ov005_021ac984
    sub r0, r0, #0x1
    cmp r7, r0
    bne .L_394
    ldr r0, [r4, #0x88]
    mov r1, #0x8000
    bl func_ov005_021aca64
    b .L_4a4
.L_394:
    add r0, r4, #0x8c
    bl func_ov010_021b39c0
    b .L_4a4
.L_3a0:
    tst r0, #0x20
    beq .L_4a4
    ldr r0, [r4, #0x84]
    mov r1, r6
    bl func_ov005_021ab260
    cmp r0, #0x0
    ble .L_3e4
    ldr r0, [r4, #0x84]
    mov r1, r6
    mov r2, #0x2
    bl func_ov005_021ab384
    cmp r0, #0x0
    beq .L_3e4
    mov r0, r7
    mvn r1, #0x0
    bl func_ov010_021b6868
    b .L_4a4
.L_3e4:
    ldr r0, [r4, #0x84]
    mov r1, r6
    bl func_ov005_021ab318
    mov r6, r0
    ldr r0, [r4, #0x88]
    bl func_ov005_021ac984
    mov r7, r0
    cmp r6, #0x0
    beq .L_4a4
    cmp r7, #0x0
    mov r8, #0x0
    ble .L_444
.L_414:
    ldr r0, [r4, #0x88]
    mov r1, r8
    bl func_ov005_021ac9d0
    cmp r6, r0
    bne .L_438
    mov r1, r8
    add r0, r4, #0x8c
    bl func_ov010_021b3a14
    b .L_444
.L_438:
    add r8, r8, #0x1
    cmp r8, r7
    blt .L_414
.L_444:
    cmp r8, r7
    bne .L_490
    ldr r0, [r4, #0x88]
    mov r1, r6
    str r6, [r4, #0x4]
    bl func_ov005_021ac9dc
    mov r6, r0
    ldr r0, [r4, #0x88]
    bl func_ov005_021ac9c8
    mul r1, r6, r0
    ldr r0, [r4, #0x34]
    bl func_ov010_021b23f4
    ldr r1, [r4, #0x358]
    add r0, r4, #0x8c
    bic r1, r1, #0x1
    orr r2, r1, #0x1
    mov r1, #0x0
    str r2, [r4, #0x358]
    bl func_ov010_021b3a14
.L_490:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_4a4:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov010_021b9884
_LIT1: .word data_ov010_021b9890
_LIT2: .word data_02104bac
