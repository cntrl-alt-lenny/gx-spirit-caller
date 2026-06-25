; func_02060d60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101274
        .extern data_0219e430
        .extern data_0219e434
        .extern data_0219e43c
        .extern data_0219e444
        .extern func_0204537c
        .extern func_02054cd8
        .extern func_020606b4
        .extern func_02060c1c
        .extern func_02060edc
        .extern func_020a7294
        .global func_02060d60
        .arm
func_02060d60:
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
    bl func_02060c1c
    cmp r0, #0x0
    beq .L_12c
    ldr r8, _LIT2
    ldr sl, _LIT3
    ldr r9, _LIT4
    ldr r7, _LIT0
    mov r6, #0x100
    mov r5, #0x0
.L_54:
    ldr r1, [sl]
    ldr r0, [r9]
    sub r0, r1, r0
    cmp r0, #0x80
    bge .L_98
    cmp r1, #0x100
    strlt r6, [sl]
    movge r0, r1, lsl #0x1
    strge r0, [sl]
    ldr r1, [sl]
    ldr r0, [r8]
    add r1, r1, #0x1
    bl func_0204537c
    str r0, [r8]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_98:
    ldr r4, [r9]
    ldr r1, [r8]
    ldr r2, [sl]
    ldr r0, [r7]
    mov r3, r5
    add r1, r1, r4
    sub r2, r2, r4
    bl func_02054cd8
    cmp r0, #0x0
    bgt .L_cc
    bl func_02060edc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_cc:
    ldr r2, [r9]
    ldr r1, [r8]
    add r0, r2, r0
    str r0, [r9]
    strb r5, [r1, r0]
    ldr r0, [r8]
    ldr r1, [r9]
    bl func_020606b4
    ldr r1, [r9]
    mov r4, r0
    cmp r4, r1
    streq r5, [r9]
    beq .L_11c
    ldr r0, [r8]
    sub r2, r1, r4
    add r1, r0, r4
    bl func_020a7294
    ldr r0, [r9]
    sub r0, r0, r4
    str r0, [r9]
.L_11c:
    ldr r0, [r7]
    bl func_02060c1c
    cmp r0, #0x0
    bne .L_54
.L_12c:
    ldr r1, _LIT0
    mvn r0, #0x0
    ldr r1, [r1]
    cmp r1, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_02101274
_LIT1: .word data_0219e43c
_LIT2: .word data_0219e434
_LIT3: .word data_0219e444
_LIT4: .word data_0219e430
