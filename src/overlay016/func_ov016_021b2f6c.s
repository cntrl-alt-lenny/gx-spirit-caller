; func_ov016_021b2f6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov016_021b9740
        .extern data_ov016_021bac38
        .extern data_ov016_021bac64
        .extern func_02009494
        .extern func_0202c0c0
        .extern func_02037208
        .extern func_0208c884
        .extern func_ov016_021b3174
        .extern func_ov016_021b5544
        .extern func_ov016_021b5a28
        .extern func_ov016_021b5a6c
        .extern func_ov016_021b700c
        .global func_ov016_021b2f6c
        .arm
func_ov016_021b2f6c:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r2, [r1, #0x8]
    ldr r4, _LIT1
    cmp r2, #0x0
    mov r5, #0x0
    beq .L_104
    mov r0, r1
    bl func_ov016_021b5a6c
    cmp r0, #0x0
    beq .L_64
    ldr r0, _LIT0
    bl func_ov016_021b5a28
    ldrh r0, [r6, #0x98]
    tst r0, #0x2
    beq .L_5c
    ldr r0, _LIT0
    ldr r0, [r0, #0x10]
    rsbs r0, r0, #0x1
    beq .L_5c
    ldr r0, _LIT2
    bl func_ov016_021b700c
.L_5c:
    mov r0, #0x0
    strh r0, [r6, #0x98]
.L_64:
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_1e8
    add r0, r4, #0x1000
    ldr r0, [r0, #0x3f4]
    cmp r0, #0x0
    beq .L_1e8
    ldr r0, [r6, #0x8]
    cmp r0, #0x40
    movlt r1, #0x1
    ldr r0, [r6, #0x8]
    movge r1, #0x0
    add r0, r0, r1
    str r0, [r6, #0x8]
    cmp r0, #0x8
    bne .L_b0
    add r0, r4, #0x44
    bl func_02009494
.L_b0:
    ldr r0, [r6, #0x8]
    cmp r0, #0x30
    blt .L_f4
    bne .L_d4
    mov r0, #0x42
    sub r1, r0, #0x43
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_d4:
    ldr r1, [r6, #0x8]
    ldr r0, _LIT3
    rsb r1, r1, #0x30
    bl func_0208c884
    ldr r1, [r6, #0x8]
    ldr r0, _LIT4
    rsb r1, r1, #0x30
    bl func_0208c884
.L_f4:
    ldr r0, [r6, #0x8]
    cmp r0, #0x40
    movge r5, #0x1
    b .L_1e8
.L_104:
    ldr r1, [r6]
    cmp r1, #0x0
    beq .L_124
    cmp r1, #0x1
    beq .L_16c
    cmp r1, #0x2
    beq .L_1b4
    b .L_1e8
.L_124:
    ldr r1, [r6, #0x8]
    ldr r0, _LIT3
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    sub r1, r1, #0x10
    bl func_0208c884
    ldr r1, [r6, #0x8]
    ldr r0, _LIT4
    sub r1, r1, #0x10
    bl func_0208c884
    ldr r0, [r6, #0x8]
    cmp r0, #0x10
    blt .L_1e8
    mov r0, #0x1
    str r0, [r6]
    mov r0, r5
    str r0, [r6, #0x8]
    b .L_1e8
.L_16c:
    bl func_ov016_021b3174
    cmp r0, #0x0
    beq .L_1e8
    add r0, r4, #0x1000
    ldr r0, [r0, #0x3f4]
    cmp r0, #0x0
    moveq r0, #0x2
    streq r0, [r6]
    beq .L_1a8
    ldr r0, _LIT5
    bl func_0202c0c0
    mov r2, r0
    ldr r0, _LIT0
    mov r1, r5
    bl func_ov016_021b5544
.L_1a8:
    mov r0, #0x0
    str r0, [r6, #0x8]
    b .L_1e8
.L_1b4:
    ldr r1, [r6, #0x8]
    ldr r0, _LIT3
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r1, [r6, #0x8]
    ldr r0, _LIT4
    rsb r1, r1, #0x0
    bl func_0208c884
    ldr r0, [r6, #0x8]
    cmp r0, #0x10
    movge r5, #0x1
.L_1e8:
    mov r0, r5
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov016_021bac38
_LIT1: .word data_ov016_021b9740
_LIT2: .word data_ov016_021bac64
_LIT3: .word 0x0400006c
_LIT4: .word 0x0400106c
_LIT5: .word 0x000006b3
