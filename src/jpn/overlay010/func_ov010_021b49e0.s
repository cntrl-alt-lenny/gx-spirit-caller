; func_ov010_021b49e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov010_021b90b4
        .extern data_ov010_021b9160
        .extern func_020371b8
        .extern func_ov005_021ab028
        .extern func_ov005_021ab180
        .extern func_ov005_021ab238
        .extern func_ov005_021ab2a4
        .extern func_ov005_021ac87c
        .extern func_ov005_021ac8c0
        .extern func_ov005_021ac8c8
        .extern func_ov005_021ac8d4
        .extern func_ov005_021ac928
        .extern func_ov005_021ac95c
        .extern func_ov010_021b22f4
        .extern func_ov010_021b3898
        .extern func_ov010_021b38c0
        .extern func_ov010_021b3914
        .extern func_ov010_021b3f90
        .global func_ov010_021b49e0
        .arm
func_ov010_021b49e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r0, _LIT0
    ldr r4, _LIT1
    ldr r1, [r0, #0x198]
    ldr r5, [r0, #0xb0]
    cmp r1, #0x1
    ldreq r0, [r4, #0x80]
    ldreq r1, [r0, #0x54]
    cmpeq r1, #0x0
    bne .L_4c0
    ldr r7, [r4, #0xe0]
    mov r1, r7
    bl func_ov005_021ac8c8
    ldr r1, _LIT2
    mov r6, r0
    ldrh r0, [r1, #0x54]
    tst r0, #0x2
    beq .L_2b4
    ldr r0, [r4, #0x220]
    orr r0, r0, #0x4
    str r0, [r4, #0x220]
    b .L_4c0
.L_2b4:
    tst r0, #0x1
    beq .L_2cc
    ldr r0, [r4, #0x220]
    orr r0, r0, #0x10
    str r0, [r4, #0x220]
    b .L_4c0
.L_2cc:
    ldrh r0, [r1, #0x56]
    tst r0, #0x40
    beq .L_300
    cmp r7, #0x0
    blt .L_300
    add r0, r4, #0x84
    bl func_ov010_021b3898
    cmp r0, #0x0
    bne .L_4c0
    ldr r0, [r4, #0x80]
    mov r1, #0x8000
    bl func_ov005_021ac928
    b .L_4c0
.L_300:
    tst r0, #0x80
    beq .L_340
    ldr r0, [r4, #0x7c]
    mov r1, #0x4
    bl func_ov005_021ab028
    sub r0, r0, #0x1
    cmp r7, r0
    bge .L_340
    add r0, r4, #0x84
    bl func_ov010_021b38c0
    cmp r0, #0x0
    bne .L_4c0
    ldr r0, [r4, #0x80]
    mov r1, #0x8000
    bl func_ov005_021ac95c
    b .L_4c0
.L_340:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x56]
    tst r0, #0x10
    beq .L_3bc
    ldr r0, [r4, #0x7c]
    mov r1, r6
    bl func_ov005_021ab180
    cmp r0, #0x0
    ble .L_4c0
    ldr r0, [r4, #0x7c]
    mov r1, r6
    mov r2, #0x2
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    bne .L_38c
    mov r0, r7
    mvn r1, #0x0
    bl func_ov010_021b3f90
    b .L_4c0
.L_38c:
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac87c
    sub r0, r0, #0x1
    cmp r7, r0
    bne .L_3b0
    ldr r0, [r4, #0x80]
    mov r1, #0x8000
    bl func_ov005_021ac95c
    b .L_4c0
.L_3b0:
    add r0, r4, #0x84
    bl func_ov010_021b38c0
    b .L_4c0
.L_3bc:
    tst r0, #0x20
    beq .L_4c0
    ldr r0, [r4, #0x7c]
    mov r1, r6
    bl func_ov005_021ab180
    cmp r0, #0x0
    ble .L_400
    ldr r0, [r4, #0x7c]
    mov r1, r6
    mov r2, #0x2
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    beq .L_400
    mov r0, r7
    mvn r1, #0x0
    bl func_ov010_021b3f90
    b .L_4c0
.L_400:
    ldr r0, [r4, #0x7c]
    mov r1, r6
    bl func_ov005_021ab238
    mov r6, r0
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac87c
    mov r7, r0
    cmp r6, #0x0
    beq .L_4c0
    cmp r7, #0x0
    mov r8, #0x0
    ble .L_460
.L_430:
    ldr r0, [r4, #0x80]
    mov r1, r8
    bl func_ov005_021ac8c8
    cmp r6, r0
    bne .L_454
    mov r1, r8
    add r0, r4, #0x84
    bl func_ov010_021b3914
    b .L_460
.L_454:
    add r8, r8, #0x1
    cmp r8, r7
    blt .L_430
.L_460:
    cmp r8, r7
    bne .L_4ac
    ldr r0, [r4, #0x80]
    mov r1, r6
    str r6, [r4]
    bl func_ov005_021ac8d4
    mov r6, r0
    ldr r0, [r4, #0x80]
    bl func_ov005_021ac8c0
    mul r1, r6, r0
    ldr r0, [r4, #0x2c]
    bl func_ov010_021b22f4
    ldr r1, [r4, #0x220]
    add r0, r4, #0x84
    bic r1, r1, #0x1
    orr r2, r1, #0x1
    mov r1, #0x0
    str r2, [r4, #0x220]
    bl func_ov010_021b3914
.L_4ac:
    mov r0, #0x38
    sub r1, r0, #0x39
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_4c0:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov010_021b90b4
_LIT1: .word data_ov010_021b9160
_LIT2: .word data_02104acc
