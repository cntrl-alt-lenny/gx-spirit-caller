; func_02060dd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101354
        .extern data_0219e510
        .extern data_0219e514
        .extern data_0219e51c
        .extern data_0219e524
        .extern func_020453cc
        .extern func_02054d4c
        .extern func_02060728
        .extern func_02060c90
        .extern func_02060f50
        .extern func_020a7388
        .global func_02060dd4
        .arm
func_02060dd4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r0, _LIT0
    mvn r1, #0x0
    ldr r0, [r0]
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT1
    ldr r1, [r1]
    cmp r1, #0x5
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_02060c90
    cmp r0, #0x0
    beq .L_244
    ldr r8, _LIT2
    ldr sl, _LIT3
    ldr r9, _LIT4
    ldr r7, _LIT0
    mov r6, #0x100
    mov r5, #0x0
.L_16c:
    ldr r1, [sl]
    ldr r0, [r9]
    sub r0, r1, r0
    cmp r0, #0x80
    bge .L_1b0
    cmp r1, #0x100
    strlt r6, [sl]
    movge r0, r1, lsl #0x1
    strge r0, [sl]
    ldr r1, [sl]
    ldr r0, [r8]
    add r1, r1, #0x1
    bl func_020453cc
    str r0, [r8]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1b0:
    ldr r4, [r9]
    ldr r1, [r8]
    ldr r2, [sl]
    ldr r0, [r7]
    mov r3, r5
    add r1, r1, r4
    sub r2, r2, r4
    bl func_02054d4c
    cmp r0, #0x0
    bgt .L_1e4
    bl func_02060f50
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1e4:
    ldr r2, [r9]
    ldr r1, [r8]
    add r0, r2, r0
    str r0, [r9]
    strb r5, [r1, r0]
    ldr r0, [r8]
    ldr r1, [r9]
    bl func_02060728
    ldr r1, [r9]
    mov r4, r0
    cmp r4, r1
    streq r5, [r9]
    beq .L_234
    ldr r0, [r8]
    sub r2, r1, r4
    add r1, r0, r4
    bl func_020a7388
    ldr r0, [r9]
    sub r0, r0, r4
    str r0, [r9]
.L_234:
    ldr r0, [r7]
    bl func_02060c90
    cmp r0, #0x0
    bne .L_16c
.L_244:
    ldr r1, _LIT0
    mvn r0, #0x0
    ldr r1, [r1]
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02101354
_LIT1: .word data_0219e51c
_LIT2: .word data_0219e514
_LIT3: .word data_0219e524
_LIT4: .word data_0219e510
