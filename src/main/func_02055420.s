; func_02055420 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffc10
        .extern data_020ffc40
        .extern data_020ffc4c
        .extern data_020ffc78
        .extern data_020ffc90
        .extern data_020ffca8
        .extern data_020ffcb4
        .extern data_020ffcc4
        .extern func_02058038
        .extern func_02058070
        .extern func_0205ffc0
        .extern func_020604b0
        .extern func_020aaf40
        .global func_02055420
        .arm
func_02055420:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x204
    movs r7, r0
    mov r6, r1
    mov r5, r3
    beq .L_114
    ldr r4, [r7]
    cmp r4, #0x0
    bne .L_120
.L_114:
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_120:
    ldr r1, [r4, #0x108]
    cmp r1, #0x0
    addne sp, sp, #0x204
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, pc}
    ldr r1, [r4, #0x1d8]
    cmp r1, #0x4
    bne .L_154
    ldr r1, _LIT0
    bl func_0205ffc0
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_154:
    cmp r2, #0x0
    bne .L_170
    ldr r1, _LIT1
    bl func_0205ffc0
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_170:
    cmp r5, #0x0
    bne .L_18c
    ldr r1, _LIT2
    bl func_0205ffc0
    add sp, sp, #0x204
    mov r0, #0x2
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_18c:
    mov r1, r2
    add r0, sp, #0x0
    mov r2, #0x100
    bl func_020604b0
    ldrsb r0, [sp]
    cmp r0, #0x0
    beq .L_1c8
    add r2, sp, #0x0
    mov r1, #0x2f
.L_1b0:
    ldrsb r0, [r2]
    cmp r0, #0x5c
    streqb r1, [r2]
    ldrsb r0, [r2, #0x1]!
    cmp r0, #0x0
    bne .L_1b0
.L_1c8:
    add r0, sp, #0x100
    mov r1, r5
    mov r2, #0x100
    bl func_020604b0
    add r0, sp, #0x100
    ldrsb r0, [r0]
    cmp r0, #0x0
    beq .L_208
    add r2, sp, #0x100
    mov r1, #0x2f
.L_1f0:
    ldrsb r0, [r2]
    cmp r0, #0x5c
    streqb r1, [r2]
    ldrsb r0, [r2, #0x1]!
    cmp r0, #0x0
    bne .L_1f0
.L_208:
    ldr r0, [r4, #0x214]
    cmp r6, r0
    bne .L_244
    add r0, sp, #0x0
    add r1, r4, #0x218
    bl func_020aaf40
    cmp r0, #0x0
    bne .L_244
    add r0, sp, #0x100
    add r1, r4, #0x318
    bl func_020aaf40
    cmp r0, #0x0
    addeq sp, sp, #0x204
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, pc}
.L_244:
    add r1, sp, #0x0
    add r0, r4, #0x218
    mov r2, #0x100
    str r6, [r4, #0x214]
    bl func_020604b0
    add r1, sp, #0x100
    add r0, r4, #0x318
    mov r2, #0x100
    bl func_020604b0
    ldr r2, _LIT3
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r7
    mov r2, r6
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT4
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    ldr r2, [r4, #0x198]
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058038
    ldr r2, _LIT5
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r7
    add r1, r4, #0x1f4
    add r2, sp, #0x0
    bl func_02058070
    ldr r2, _LIT6
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, r7
    add r1, r4, #0x1f4
    add r2, sp, #0x100
    bl func_02058070
    ldr r2, _LIT7
    mov r0, r7
    add r1, r4, #0x1f4
    bl func_02058070
    mov r0, #0x0
    add sp, sp, #0x204
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_020ffc10
_LIT1: .word data_020ffc78
_LIT2: .word data_020ffc90
_LIT3: .word data_020ffca8
_LIT4: .word data_020ffc40
_LIT5: .word data_020ffcb4
_LIT6: .word data_020ffcc4
_LIT7: .word data_020ffc4c
