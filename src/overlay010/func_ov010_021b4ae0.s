; func_ov010_021b4ae0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov010_021b91b4
        .extern data_ov010_021b9260
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
        .extern func_ov010_021b4090
        .global func_ov010_021b4ae0
        .arm
func_ov010_021b4ae0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x198]
    ldr r5, [r0, #0xb0]
    cmp r1, #0x1
    ldreq r0, [r4, #0x80]
    ldreq r1, [r0, #0x54]
    cmpeq r1, #0x0
    bne .L_5d8
    ldr r7, [r4, #0xe0]
    mov r1, r7
    bl func_ov005_021ac9d0
    ldr r1, _LIT2
    mov r6, r0
    ldrh r0, [r1, #0x54]
    tst r0, #0x2
    beq .L_3cc
    ldr r0, [r4, #0x220]
    orr r0, r0, #0x4
    str r0, [r4, #0x220]
    b .L_5d8
.L_3cc:
    tst r0, #0x1
    beq .L_3e4
    ldr r0, [r4, #0x220]
    orr r0, r0, #0x10
    str r0, [r4, #0x220]
    b .L_5d8
.L_3e4:
    ldrh r0, [r1, #0x56]
    tst r0, #0x40
    beq .L_418
    cmp r7, #0x0
    blt .L_418
    add r0, r4, #0x84
    bl func_ov010_021b3998
    cmp r0, #0x0
    bne .L_5d8
    ldr r0, [r4, #0x80]
    mov r1, #0x8000
    bl func_ov005_021aca30
    b .L_5d8
.L_418:
    tst r0, #0x80
    beq .L_458
    ldr r0, [r4, #0x7c]
    mov r1, #0x4
    bl func_ov005_021ab108
    sub r0, r0, #0x1
    cmp r7, r0
    bge .L_458
    add r0, r4, #0x84
    bl func_ov010_021b39c0
    cmp r0, #0x0
    bne .L_5d8
    ldr r0, [r4, #0x80]
    mov r1, #0x8000
    bl func_ov005_021aca64
    b .L_5d8
.L_458:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x10
    beq .L_4d4
    ldr r0, [r4, #0x7c]
    mov r1, r6
    bl func_ov005_021ab260
    cmp r0, #0x0
    ble .L_5d8
    ldr r0, [r4, #0x7c]
    mov r1, r6
    mov r2, #0x2
    bl func_ov005_021ab384
    cmp r0, #0x0
    bne .L_4a4
    mov r0, r7
    mvn r1, #0x0
    bl func_ov010_021b4090
    b .L_5d8
.L_4a4:
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac984
    sub r0, r0, #0x1
    cmp r7, r0
    bne .L_4c8
    ldr r0, [r4, #0x80]
    mov r1, #0x8000
    bl func_ov005_021aca64
    b .L_5d8
.L_4c8:
    add r0, r4, #0x84
    bl func_ov010_021b39c0
    b .L_5d8
.L_4d4:
    tst r0, #0x20
    beq .L_5d8
    ldr r0, [r4, #0x7c]
    mov r1, r6
    bl func_ov005_021ab260
    cmp r0, #0x0
    ble .L_518
    ldr r0, [r4, #0x7c]
    mov r1, r6
    mov r2, #0x2
    bl func_ov005_021ab384
    cmp r0, #0x0
    beq .L_518
    mov r0, r7
    mvn r1, #0x0
    bl func_ov010_021b4090
    b .L_5d8
.L_518:
    ldr r0, [r4, #0x7c]
    mov r1, r6
    bl func_ov005_021ab318
    mov r6, r0
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac984
    mov r7, r0
    cmp r6, #0x0
    beq .L_5d8
    cmp r7, #0x0
    mov r8, #0x0
    ble .L_578
.L_548:
    ldr r0, [r4, #0x80]
    mov r1, r8
    bl func_ov005_021ac9d0
    cmp r6, r0
    bne .L_56c
    mov r1, r8
    add r0, r4, #0x84
    bl func_ov010_021b3a14
    b .L_578
.L_56c:
    add r8, r8, #0x1
    cmp r8, r7
    blt .L_548
.L_578:
    cmp r8, r7
    bne .L_5c4
    ldr r0, [r4, #0x80]
    mov r1, r6
    str r6, [r4]
    bl func_ov005_021ac9dc
    mov r6, r0
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac9c8
    mul r1, r6, r0
    ldr r0, [r4, #0x2c]
    bl func_ov010_021b23f4
    ldr r1, [r4, #0x220]
    add r0, r4, #0x84
    bic r1, r1, #0x1
    orr r2, r1, #0x1
    mov r1, #0x0
    str r2, [r4, #0x220]
    bl func_ov010_021b3a14
.L_5c4:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_5d8:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov010_021b91b4
_LIT1: .word data_ov010_021b9260
_LIT2: .word data_02104bac
