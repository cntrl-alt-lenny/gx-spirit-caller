; func_ov006_021bbe7c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cc0f4
        .extern data_ov006_021cc478
        .extern data_ov006_021cc588
        .extern data_ov006_0225df3c
        .extern data_ov006_0225e068
        .extern func_02021660
        .extern func_020216b0
        .global func_ov006_021bbe7c
        .arm
func_ov006_021bbe7c:
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
    bl func_02021660
    mov r1, r5
    mov r7, r0
    ldr r0, [r1]
    ldr r8, _LIT2
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_1cf8
    ldr r0, [r6]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    ldreq r0, [r4, #0x48]
    cmpeq r0, #0x0
    orreq r8, r8, #0x20
.L_1cf8:
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    beq .L_1d14
    cmp r0, #0x2
    beq .L_1d28
    cmp r0, #0x3
    bne .L_1d3c
.L_1d14:
    ldr r1, [r4, #0x4c]
    ldr r2, _LIT3
    mov r0, #0xc
    mla sl, r1, r0, r2
    b .L_1d4c
.L_1d28:
    ldr r1, [r4, #0x4c]
    ldr r2, _LIT4
    mov r0, #0xc
    mla sl, r1, r0, r2
    b .L_1d4c
.L_1d3c:
    ldr r1, [r4, #0x4c]
    ldr r2, _LIT5
    mov r0, #0xc
    mla sl, r1, r0, r2
.L_1d4c:
    ldrsh r2, [sl]
    mov r0, r7
    mov r1, #0x3
    bl func_020216b0
    ldrsh r2, [sl, #0x2]
    mov r0, r7
    mov r1, #0x4
    bl func_020216b0
    mov r0, r7
    mov r1, #0x11
    mov r2, #0x2
    bl func_020216b0
    mov r0, r7
    mov r1, #0x12
    mov r2, #0x0
    bl func_020216b0
    ldr r2, [sl, #0x4]
    mov r0, r7
    mov r1, #0xd
    bl func_020216b0
    mov r0, r7
    mov r2, r8
    mov r1, #0x0
    bl func_020216b0
    ldr r0, [r4]
    mov r1, #0x5
    mov r2, #0x1
    bl func_02021660
    ldr r2, [r4, #0x50]
    mov r7, r0
    cmp r2, #0x4
    moveq r1, #0x3
    ldr r0, [r9, #0x4]
    movne r1, #0x4
    cmp r0, #0x0
    blt .L_1e24
    cmp r0, r1
    bge .L_1e24
    ldr r1, [r5]
    ldr r5, _LIT2
    cmp r1, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    bne .L_1e28
    ldr r1, [r6]
    cmp r1, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    ldreq r1, [r4, #0x48]
    cmpeq r1, #0x1
    orreq r5, r5, #0x20
    b .L_1e28
.L_1e24:
    mov r5, #0x0
.L_1e28:
    cmp r2, #0x4
    ldr r2, [r9]
    mov r1, #0x17
    mul r1, r2, r1
    bne .L_1e4c
    mov r0, r0, lsl #0x5
    add r2, r1, #0xe
    add r4, r0, #0x56
    b .L_1e58
.L_1e4c:
    mov r0, r0, lsl #0x5
    add r2, r1, #0xe
    add r4, r0, #0x36
.L_1e58:
    mov r0, r7
    mov r1, #0x3
    bl func_020216b0
    mov r0, r7
    mov r2, r4
    mov r1, #0x4
    bl func_020216b0
    mov r0, r7
    mov r1, #0x11
    mov r2, #0x2
    bl func_020216b0
    mov r0, r7
    mov r1, #0x12
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    mov r1, #0xd
    mov r2, #0x0
    bl func_020216b0
    mov r0, r7
    mov r2, r5
    mov r1, #0x0
    bl func_020216b0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov006_0225df3c
_LIT1: .word data_ov006_0225e068
_LIT2: .word 0x000008c9
_LIT3: .word data_ov006_021cc588
_LIT4: .word data_ov006_021cc478
_LIT5: .word data_ov006_021cc0f4
