; func_ov011_021d1514 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_ov011_021d403c
        .extern func_02005dac
        .extern func_02018bc0
        .extern func_0201942c
        .extern func_02037208
        .extern func_0209448c
        .extern func_ov011_021cc140
        .extern func_ov011_021cc15c
        .extern func_ov011_021cc194
        .extern func_ov011_021d1434
        .global func_ov011_021d1514
        .arm
func_ov011_021d1514:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldr r0, [r6, #0x18]
    mov r0, r0, lsl #0x19
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x18
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT0
    ldr r2, [r6]
    ldr r1, [r0, #0x1fc]
    ldr r0, [r0, #0x200]
    sub r1, r2, r1
    str r1, [sp, #0x10]
    ldr r1, [r6, #0x4]
    sub r0, r1, r0
    str r0, [sp, #0x14]
    ldr r0, [r6, #0x8]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1e
    cmpne r0, #0x2
    bne .L_44c
    ldr r0, [r6, #0x18]
    mov r0, r0, lsl #0x14
    movs r0, r0, lsr #0x1e
    beq .L_364
    cmp r0, #0x1
    beq .L_2d0
    cmp r0, #0x2
    beq .L_30c
    b .L_44c
.L_2d0:
    mov r0, #0x3
    bl func_ov011_021cc140
    ldr r2, [r6, #0x18]
    mov r0, #0x47
    mov r1, r2, lsl #0x14
    mov r1, r1, lsr #0x1e
    add r1, r1, #0x1
    bic r2, r2, #0xc00
    mov r1, r1, lsl #0x1e
    orr r4, r2, r1, lsr #0x14
    sub r1, r0, #0x48
    mov r2, #0x0
    mov r3, #0x1
    str r4, [r6, #0x18]
    bl func_02037208
.L_30c:
    mov r0, #0x3
    bl func_ov011_021cc15c
    cmp r0, #0x0
    bne .L_354
    add r1, sp, #0x10
    str r1, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r2, [r6, #0x18]
    mov r0, #0x3
    mov r2, r2, lsl #0x1b
    mov r3, r2, lsr #0x1b
    sub r1, r0, #0x4
    mov r2, #0x2
    bl func_ov011_021cc194
    b .L_44c
.L_354:
    ldr r0, [r6, #0x18]
    bic r0, r0, #0xc00
    str r0, [r6, #0x18]
    b .L_44c
.L_364:
    ldr r1, [r6, #0x8]
    mov r0, r1, lsl #0x15
    movs r0, r0, lsr #0x1f
    add r0, r0, #0x1
    bic r1, r1, #0x400
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x15
    str r0, [r6, #0x8]
    beq .L_3bc
    add r1, sp, #0x10
    str r1, [sp]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r1, [sp, #0x8]
    str r1, [sp, #0xc]
    ldr r1, [r6, #0x18]
    mov r0, #0x2
    mov r3, r1, lsl #0x1b
    mov r2, r0
    sub r1, r0, #0x3
    mov r3, r3, lsr #0x1b
    bl func_ov011_021cc194
.L_3bc:
    ldr r0, [r6, #0x8]
    mov r0, r0, lsl #0x1e
    movs r0, r0, lsr #0x1e
    beq .L_3d8
    cmp r0, #0x2
    beq .L_418
    b .L_44c
.L_3d8:
    add r0, sp, #0x10
    mov r3, #0x0
    stmia sp, {r0, r3}
    str r3, [sp, #0x8]
    str r3, [sp, #0xc]
    ldr r1, [r6, #0x8]
    ldr r0, [r6, #0x18]
    mov r1, r1, lsl #0x5
    mov r2, r0, lsl #0x1b
    mov r0, r1, lsr #0x18
    sub r1, r3, #0x1
    mov r3, r2, lsr #0x1b
    ldr r4, [r6, #0x1c]
    mov r2, #0x2
    blx r4
    b .L_44c
.L_418:
    add r1, sp, #0x10
    mov r0, #0x0
    str r1, [sp]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r1, [r6, #0x18]
    ldr r4, [r6, #0x20]
    mov r2, r1, lsl #0x1b
    mov r3, r2, lsr #0x1b
    sub r1, r0, #0x1
    mov r2, #0x2
    blx r4
.L_44c:
    ldr r1, [r6, #0x8]
    mov r0, r1, lsl #0xd
    movs r0, r0, lsr #0x18
    movne r1, r1, lsl #0x1e
    movne r1, r1, lsr #0x1e
    cmpne r1, #0x2
    addeq sp, sp, #0x18
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_0201942c
    cmp r0, #0x0
    addne sp, sp, #0x18
    ldmneia sp!, {r4, r5, r6, pc}
    bl GetSystemWork
    ldr r0, [r0, #0x8e8]
    mov r0, r0, lsl #0x17
    movs r0, r0, lsr #0x1f
    bne .L_4b4
    ldr r0, [r6, #0x8]
    mov r0, r0, lsl #0xd
    mov r0, r0, lsr #0x18
    bl func_02018bc0
    ldr r0, [r0, #0x10]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x18
    ldmeqia sp!, {r4, r5, r6, pc}
.L_4b4:
    ldr r0, [r6, #0x18]
    mov r0, r0, lsl #0x16
    movs r0, r0, lsr #0x1f
    beq .L_4e4
    mov r0, r6
    mov r1, #0x0
    bl func_ov011_021d1434
    ldr r0, [r6, #0x18]
    add sp, sp, #0x18
    bic r0, r0, #0x200
    str r0, [r6, #0x18]
    ldmia sp!, {r4, r5, r6, pc}
.L_4e4:
    ldr r0, [sp, #0x14]
    mov r0, r0, asr #0xc
    sub r5, r0, #0x32
    cmp r5, #0xf0
    addge sp, sp, #0x18
    ldmgeia sp!, {r4, r5, r6, pc}
    mvn r0, #0xf
    cmp r5, r0
    addle sp, sp, #0x18
    ldmleia sp!, {r4, r5, r6, pc}
    mov r0, #0x1
    mov r1, #0x11
    bl func_02005dac
    mov r4, r0
    mov r1, r4
    mov r0, #0x0
    mov r2, #0x6
    bl func_0209448c
    mov r0, #0x400
    rsb r0, r0, #0x0
    ldr r3, [r4, #0x4]
    ldr r2, [r6, #0x10]
    mov r1, r0, lsr #0x16
    and r3, r3, r0
    and r0, r1, r2, lsr #0x7
    orr r1, r3, r0
    str r1, [r4, #0x4]
    ldr r0, [r6, #0x14]
    bic r1, r1, #0xf000
    mov r0, r0, lsr #0x9
    mov r0, r0, lsl #0x1c
    orr r1, r1, r0, lsr #0x10
    bic r0, r1, #0xc00
    orr r0, r0, #0x800
    str r0, [r4, #0x4]
    ldr r1, [r4]
    ldr r0, _LIT1
    bic r1, r1, #0x1000
    bic r2, r1, #0xc00
    str r2, [r4]
    ldr r1, [sp, #0x10]
    and r2, r2, r0
    mov r1, r1, asr #0xc
    sub r1, r1, #0x8
    mov r0, r1, lsl #0x17
    orr r2, r2, r0, lsr #0x7
    bic r1, r2, #0xff
    and r0, r5, #0xff
    orr r1, r1, r0
    orr r0, r1, #0x2000
    orr r0, r0, #0x40000000
    str r0, [r4]
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov011_021d403c
_LIT1: .word 0xfe00ffff
