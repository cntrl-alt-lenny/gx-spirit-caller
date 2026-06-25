; func_02063214 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101450
        .extern func_02061504
        .extern func_020615fc
        .extern func_020623c4
        .extern func_0206283c
        .extern func_02062888
        .extern func_020634d4
        .extern func_020637e0
        .extern func_02064194
        .extern func_02064364
        .extern func_02064c9c
        .extern func_020a734c
        .global func_02063214
        .arm
func_02063214:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x1c
    ldr r5, [sp, #0x38]
    mov r6, r3
    mov r8, r1
    mov r7, r2
    mov r1, r6
    mov r2, r5
    mov r9, r0
    bl func_02064c9c
    str r0, [sp, #0x10]
    ldr r0, [r9, #0x2c]
    cmp r0, #0x0
    beq .L_70
    mov r0, #0x0
    str r0, [sp]
    str r8, [sp, #0x4]
    str r7, [sp, #0x8]
    str r0, [sp, #0xc]
    ldr r1, [sp, #0x10]
    mov r0, r9
    mov r2, r6
    mov r3, r5
    bl func_020615fc
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_70:
    cmp r7, #0x2
    ble .L_94
    ldr r1, _LIT0
    mov r0, r8
    mov r2, #0x2
    bl func_020a734c
    cmp r0, #0x0
    moveq r4, #0x1
    beq .L_98
.L_94:
    mov r4, #0x0
.L_98:
    ldr r0, [sp, #0x10]
    cmp r0, #0x0
    bne .L_1a0
    add ip, sp, #0x14
    str r7, [sp]
    mov r0, r9
    mov r1, r6
    mov r2, r5
    mov r3, r8
    str ip, [sp, #0x4]
    bl func_02061504
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
    beq .L_fc
    ldrb r0, [r8, #0x2]
    cmp r0, #0x1
    beq .L_13c
.L_fc:
    cmp r4, #0x0
    beq .L_110
    ldrb r0, [r8, #0x2]
    cmp r0, #0x68
    beq .L_130
.L_110:
    mov r0, r9
    mov r1, r6
    mov r2, r5
    bl func_0206283c
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_130:
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_13c:
    ldr r0, [r9, #0x20]
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r1, sp, #0x10
    mov r0, r9
    mov r2, r6
    mov r3, r5
    bl func_020623c4
    cmp r0, #0x0
    beq .L_1a0
    cmp r0, #0x5
    beq .L_194
    mov r0, r9
    mov r1, r6
    mov r2, r5
    bl func_0206283c
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_194:
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1a0:
    ldr r5, [sp, #0x10]
    ldr r0, [r5, #0xc]
    cmp r0, #0x7
    bne .L_1e8
    cmp r4, #0x0
    beq .L_1c4
    ldrb r0, [r8, #0x2]
    cmp r0, #0x68
    beq .L_1dc
.L_1c4:
    mov r0, r5
    bl func_02062888
    cmp r0, #0x0
    addeq sp, sp, #0x1c
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1dc:
    add sp, sp, #0x1c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_1e8:
    cmp r4, #0x0
    beq .L_218
    cmp r7, #0x4
    blt .L_218
    ldr r1, _LIT0
    add r0, r8, #0x2
    mov r2, #0x2
    bl func_020a734c
    cmp r0, #0x0
    addeq r8, r8, #0x2
    subeq r7, r7, #0x2
    moveq r4, #0x0
.L_218:
    cmp r4, #0x0
    bne .L_244
    mov r0, r5
    mov r1, r8
    mov r2, r7
    bl func_02064194
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x1c
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_244:
    ldrb r1, [r8, #0x2]
    cmp r1, #0x0
    bge .L_26c
    mov r0, r5
    bl func_02064364
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x1c
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_26c:
    cmp r1, #0x8
    bge .L_298
    mov r0, r5
    mov r2, r8
    mov r3, r7
    bl func_020637e0
    cmp r0, #0x0
    movne r0, #0x1
    add sp, sp, #0x1c
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_298:
    mov r0, r5
    mov r2, r8
    mov r3, r7
    bl func_020634d4
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_02101450
