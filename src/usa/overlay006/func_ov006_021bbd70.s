; func_ov006_021bbd70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cbfd4
        .extern data_ov006_021cc358
        .extern data_ov006_021cc468
        .extern data_ov006_0225de1c
        .extern data_ov006_0225df48
        .extern func_0202160c
        .extern func_0202165c
        .global func_ov006_021bbd70
        .arm
func_ov006_021bbd70:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    ldr r5, [r4, #0x50]
    add r6, r4, #0xa0
    mov r3, #0x24
    mla r9, r5, r3, r6
    ldr r0, [r4]
    ldr r5, _LIT0
    mov r1, #0x5
    mov r2, #0x0
    ldr r6, _LIT1
    bl func_0202160c
    mov r1, r5
    mov r7, r0
    ldr r0, [r1]
    ldr r8, _LIT2
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_74
    ldr r0, [r6]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldreq r0, [r4, #0x48]
    cmpeq r0, #0x0
    orreq r8, r8, #0x20
.L_74:
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq .L_90
    cmp r0, #0x2
    beq .L_a4
    cmp r0, #0x3
    bne .L_b8
.L_90:
    ldr r1, [r4, #0x4c]
    ldr r2, _LIT3
    mov r0, #0xc
    mla sl, r1, r0, r2
    b .L_c8
.L_a4:
    ldr r1, [r4, #0x4c]
    ldr r2, _LIT4
    mov r0, #0xc
    mla sl, r1, r0, r2
    b .L_c8
.L_b8:
    ldr r1, [r4, #0x4c]
    ldr r2, _LIT5
    mov r0, #0xc
    mla sl, r1, r0, r2
.L_c8:
    ldrsh r2, [sl]
    mov r0, r7
    mov r1, #0x3
    bl func_0202165c
    ldrsh r2, [sl, #0x2]
    mov r0, r7
    mov r1, #0x4
    bl func_0202165c
    mov r0, r7
    mov r1, #0x11
    mov r2, #0x2
    bl func_0202165c
    mov r0, r7
    mov r1, #0x12
    mov r2, #0x0
    bl func_0202165c
    ldr r2, [sl, #0x4]
    mov r0, r7
    mov r1, #0xd
    bl func_0202165c
    mov r0, r7
    mov r2, r8
    mov r1, #0x0
    bl func_0202165c
    ldr r0, [r4]
    mov r1, #0x5
    mov r2, #0x1
    bl func_0202160c
    ldr r2, [r4, #0x50]
    mov r7, r0
    cmp r2, #0x4
    moveq r1, #0x3
    ldr r0, [r9, #0x4]
    movne r1, #0x4
    cmp r0, #0x0
    blt .L_1a0
    cmp r0, r1
    bge .L_1a0
    ldr r1, [r5]
    ldr r5, _LIT2
    cmp r1, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne .L_1a4
    ldr r1, [r6]
    cmp r1, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    ldreq r1, [r4, #0x48]
    cmpeq r1, #0x1
    orreq r5, r5, #0x20
    b .L_1a4
.L_1a0:
    mov r5, #0x0
.L_1a4:
    cmp r2, #0x4
    ldr r2, [r9]
    mov r1, #0x17
    mul r1, r2, r1
    bne .L_1c8
    mov r0, r0, lsl #0x5
    add r2, r1, #0xe
    add r4, r0, #0x56
    b .L_1d4
.L_1c8:
    mov r0, r0, lsl #0x5
    add r2, r1, #0xe
    add r4, r0, #0x36
.L_1d4:
    mov r0, r7
    mov r1, #0x3
    bl func_0202165c
    mov r0, r7
    mov r2, r4
    mov r1, #0x4
    bl func_0202165c
    mov r0, r7
    mov r1, #0x11
    mov r2, #0x2
    bl func_0202165c
    mov r0, r7
    mov r1, #0x12
    mov r2, #0x0
    bl func_0202165c
    mov r0, r7
    mov r1, #0xd
    mov r2, #0x0
    bl func_0202165c
    mov r0, r7
    mov r2, r5
    mov r1, #0x0
    bl func_0202165c
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov006_0225de1c
_LIT1: .word data_ov006_0225df48
_LIT2: .word 0x000008c9
_LIT3: .word data_ov006_021cc468
_LIT4: .word data_ov006_021cc358
_LIT5: .word data_ov006_021cbfd4
