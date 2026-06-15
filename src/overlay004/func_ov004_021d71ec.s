; func_ov004_021d71ec - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov004_0220b500
        .extern func_020342f0
        .extern func_ov004_021ca0a4
        .extern func_ov004_021d705c
        .extern func_ov004_021d7118
        .global func_ov004_021d71ec
        .arm
func_ov004_021d71ec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r0, _LIT0
    mov r4, #0x0
    ldr r0, [r0, #0x54]
    mov r7, r4
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_b70
    b .L_af8
    b .L_af8
    b .L_b00
    b .L_b10
    b .L_b4c
    b .L_b58
    b .L_b6c
.L_af8:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b00:
    ldr r0, _LIT0
    ldr r0, [r0, #0x58]
    rsb r7, r0, #0x100
    b .L_b70
.L_b10:
    ldr r0, _LIT0
    ldr r1, [r0, #0x90]
    cmp r1, #0x0
    blt .L_b70
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    bne .L_b70
    mov r0, #0x34
    mul r0, r1, r0
    add r1, r0, #0x7
    mov r0, #0x14
    mov r2, #0xd8
    mov r3, #0x2d
    bl func_ov004_021d7118
    b .L_b70
.L_b4c:
    ldr r0, _LIT0
    ldr r7, [r0, #0x58]
    b .L_b70
.L_b58:
    ldr r0, _LIT0
    ldr r4, [r0, #0x58]
    cmp r4, #0x0
    rsblt r4, r4, #0x0
    b .L_b70
.L_b6c:
    mov r4, #0x100
.L_b70:
    mov r0, #0xd0
    mul r1, r4, r0
    rsb r2, r4, #0x100
    mov r0, #0x14
    mla r1, r2, r0, r1
    mov r0, r1, asr #0x7
    add r1, r1, r0, lsr #0x18
    mov r2, #0xc0
    mul r0, r7, r2
    str r0, [sp, #0x8]
    rsb r0, r7, #0x100
    str r0, [sp, #0xc]
    ldr r0, _LIT0
    mov r5, #0x0
    add fp, r0, #0xf90
    add r0, r0, #0x3000
    mov r9, r5
    mov r6, r1, asr #0x8
    mov r8, #0x7
    mov sl, #0x1
    str r0, [sp, #0x10]
.L_bc4:
    ldr r1, [sp, #0xc]
    ldr r0, [sp, #0x8]
    cmp r4, #0x100
    mla r2, r1, r8, r0
    mov r0, r2, asr #0x7
    add r0, r2, r0, lsr #0x18
    mov r7, r0, asr #0x8
    moveq r0, r9
    addne r0, r5, #0x6
    cmp r4, #0x0
    ldreq r1, _LIT0
    ldreq r1, [r1, #0x90]
    cmpeq r5, r1
    bne .L_c0c
    ldr r1, _LIT0
    ldr r1, [r1, #0x9c]
    cmp r1, #0x0
    addne r0, r5, #0x9
.L_c0c:
    cmp r4, #0x100
    bne .L_c2c
    cmp r5, #0x0
    beq .L_c2c
    ldr r1, [sp, #0x10]
    ldr r1, [r1, #0xc8c]
    cmp r5, r1
    moveq r0, sl
.L_c2c:
    mov r1, #0x3
    str r1, [sp]
    str r0, [sp, #0x4]
    add r0, fp, #0x5000
    mov r1, #0x2
    mov r2, r6
    mov r3, r7
    bl func_ov004_021ca0a4
    cmp r4, #0x0
    bne .L_c9c
    ldr r0, _LIT0
    mov r1, #0xc
    add r0, r0, r5, lsl #0x2
    add r0, r0, #0x3000
    ldr r0, [r0, #0xca4]
    cmp r0, #0x80
    ble .L_c80
    sub r0, r0, #0x80
    add r1, r0, r0, lsr #0x1f
    mov r0, #0xc
    add r1, r0, r1, asr #0x1
.L_c80:
    add r0, r6, r1
    mov r1, #0xc0
    str r1, [sp]
    add r1, r7, #0x11
    mov r2, r5
    mov r3, #0x2
    bl func_ov004_021d705c
.L_c9c:
    cmp r5, #0x1
    bne .L_ce4
    bl func_020342f0
    cmp r0, #0x0
    beq .L_ce4
    ldr r0, _LIT1
    ldr r0, [r0, #0x38]
    tst r0, #0x20
    beq .L_ce4
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0x1c
    str r0, [sp, #0x4]
    add r3, r7, #0x2
    add r0, fp, #0x5000
    mov r1, #0x2
    add r2, r6, #0x2
    bl func_ov004_021ca0a4
.L_ce4:
    add r8, r8, #0x34
    add r9, r9, #0x2
    add sl, sl, #0x2
    add r5, r5, #0x1
    cmp r5, #0x3
    blt .L_bc4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_021040ac
