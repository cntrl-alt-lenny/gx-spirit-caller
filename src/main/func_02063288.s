; func_02063288 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101530
        .extern func_02061578
        .extern func_02061670
        .extern func_02062438
        .extern func_020628b0
        .extern func_020628fc
        .extern func_02063548
        .extern func_02063854
        .extern func_02064208
        .extern func_020643d8
        .extern func_02064d10
        .extern func_020a7440
        .global func_02063288
        .arm
func_02063288:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x1c
    ldr r5, [sp, #0x38]
    mov r6, r3
    mov r8, r1
    mov r7, r2
    mov r1, r6
    mov r2, r5
    mov r9, r0
    bl func_02064d10
    str r0, [sp, #0x10]
    ldr r0, [r9, #0x2c]
    cmp r0, #0x0
    beq .L_9cc
    mov r0, #0x0
    str r0, [sp]
    str r8, [sp, #0x4]
    str r7, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    mov r0, r9
    mov r2, r6
    mov r3, r5
    bl func_02061670
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_9cc:
    cmp r7, #0x2
    ble .L_9f0
    ldr r1, _LIT0
    mov r0, r8
    mov r2, #0x2
    bl func_020a7440
    cmp r0, #0x0
    moveq r4, #0x1
    beq .L_9f4
.L_9f0:
    mov r4, #0x0
.L_9f4:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_afc
    add ip, sp, #0x14
    str r7, [sp]
    mov r0, r9
    mov r1, r6
    mov r2, r5
    mov r3, r8
    str ip, [sp, #0x4]
    bl func_02061578
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    addne sp, sp, #0x1c
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    cmp r4, #0x0
    beq .L_a58
    ldrb r0, [r8, #0x2]
    cmp r0, #0x1
    beq .L_a98
.L_a58:
    cmp r4, #0x0
    beq .L_a6c
    ldrb r0, [r8, #0x2]
    cmp r0, #0x68
    beq .L_a8c
.L_a6c:
    mov r0, r9
    mov r1, r6
    mov r2, r5
    bl func_020628b0
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_a8c:
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_a98:
    ldr r0, [r9, #0x20]
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r1, sp, #0x10
    mov r0, r9
    mov r2, r6
    mov r3, r5
    bl func_02062438
    cmp r0, #0x0
    beq .L_afc
    cmp r0, #0x5
    beq .L_af0
    mov r0, r9
    mov r1, r6
    mov r2, r5
    bl func_020628b0
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_af0:
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_afc:
    ldr r5, [sp, #0x10]
    ldr r0, [r5, #0xc]
    cmp r0, #0x7
    bne .L_b44
    cmp r4, #0x0
    beq .L_b20
    ldrb r0, [r8, #0x2]
    cmp r0, #0x68
    beq .L_b38
.L_b20:
    mov r0, r5
    bl func_020628fc
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_b38:
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_b44:
    cmp r4, #0x0
    beq .L_b74
    cmp r7, #0x4
    blt .L_b74
    ldr r1, _LIT0
    add r0, r8, #0x2
    mov r2, #0x2
    bl func_020a7440
    cmp r0, #0x0
    addeq r8, r8, #0x2
    subeq r7, r7, #0x2
    moveq r4, #0x0
.L_b74:
    cmp r4, #0x0
    bne .L_ba0
    mov r0, r5
    mov r1, r8
    mov r2, r7
    bl func_02064208
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x1c
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_ba0:
    ldrb r1, [r8, #0x2]
    cmp r1, #0x0
    bge .L_bc8
    mov r0, r5
    bl func_020643d8
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x1c
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_bc8:
    cmp r1, #0x8
    bge .L_bf4
    mov r0, r5
    mov r2, r8
    mov r3, r7
    bl func_02063854
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x1c
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_bf4:
    mov r0, r5
    mov r2, r8
    mov r3, r7
    bl func_02063548
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02101530
